import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/bloc/data_components_screen_v2_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_view.dart';

class DataComponentsScreenV2Bloc extends BaseBloc<DataComponentsScreenV2Event,
    DataComponentsScreenV2State, DataComponentsScreenV2SR> {
  final GetSwaggerComponentsUseCase _getSwaggerComponentsUseCase;

  DataComponentsScreenV2Bloc(this._getSwaggerComponentsUseCase)
      : super(const DataComponentsScreenV2StateData(config: Config())) {
    on<DataComponentsScreenV2IInit>(_onInit);
  }

  Future<void> _onInit(
    DataComponentsScreenV2IInit event,
    Emitter<DataComponentsScreenV2State> emit,
  ) async {
    final components = await _getSwaggerComponentsUseCase();
    emit(
      state.copyWith(
        config: event.config,
        components: components,
      ),
    );
  }

  List<ObjectView> getSourceObjects(SourceComponent source) {
    final components = state.components;

    if (components == null) {
      return [];
    }

    final sourceComponents = <String>{}
      ..addAll(
        source.requests
            .where((element) => element.requestBody != null)
            .map((e) => e.requestBody!.type.toString())
            .toList(),
      )
      ..addAll(
        source.requests
            .where((element) => element.response.type.from.isNotEmpty)
            .map((e) => e.response.type.toString()),
      );

    final sourceComponentObjects = components.dataObjects
        .where((element) => sourceComponents.contains(element.name))
        .toList(growable: true);

    final result = <DataObjectComponent>[...sourceComponentObjects];

    for (final component in sourceComponentObjects) {
      if (component.variables.isNotEmpty) {
        for (final variable in component.variables) {
          final ref = variable.type.getSwaggerObjectReference();

          if (ref != null) {
            final object = components.dataObjects
                .firstWhereOrNull((element) => element.name == ref.reference);
            if (object != null) {
              result.add(object);
            }
          }
        }
      }
    }

    final objectViews = result
        .map(
          (e) => ObjectView(
            name: e.name,
            variables: e.variables,
          ),
        )
        .toList();

    for (final objectView in objectViews) {
      objectView.collectVariables(components);
    }

    return objectViews;
  }
}
