import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/add_source_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/delete_data_object_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/delete_source_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/edit_source_name_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/bloc/data_components_screen_v2_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_view.dart';

class DataComponentsScreenV2Bloc extends BaseBloc<DataComponentsScreenV2Event,
    DataComponentsScreenV2State, DataComponentsScreenV2SR> {
  final GetSwaggerComponentsUseCase _getSwaggerComponentsUseCase;
  final AddSourceUseCase _addSourceUseCase;
  final DeleteSourceUseCase _deleteSourceUseCase;
  final EditSourceNameUseCase _editSourceNameUseCase;
  final DeleteComponentUseCase _deleteComponentUseCase;

  DataComponentsScreenV2Bloc({
    required GetSwaggerComponentsUseCase getSwaggerComponentsUseCase,
    required AddSourceUseCase addSourceUseCase,
    required DeleteSourceUseCase deleteSourceUseCase,
    required EditSourceNameUseCase editSourceNameUseCase,
    required DeleteComponentUseCase deleteDataObjectComponentUseCase,
  })  : _getSwaggerComponentsUseCase = getSwaggerComponentsUseCase,
        _addSourceUseCase = addSourceUseCase,
        _deleteSourceUseCase = deleteSourceUseCase,
        _editSourceNameUseCase = editSourceNameUseCase,
        _deleteComponentUseCase = deleteDataObjectComponentUseCase,
        super(
          DataComponentsScreenV2StateData(
            config: const Config(),
            components: Components.empty(),
          ),
        ) {
    on<DataComponentsScreenV2IInit>(_onInit);
    on<DataComponentsScreenV2AddSource>(_onAddSource);
    on<DataComponentsScreenV2EditSourceName>(_onEditSourceName);
    on<DataComponentsScreenV2DeleteSource>(_onDeleteSource);
    on<DataComponentsScreenV2DeleteComponent>(_onDeleteComponent);
  }

  void _onInit(
    DataComponentsScreenV2IInit event,
    Emitter<DataComponentsScreenV2State> emit,
  ) {
    final components = _getSwaggerComponentsUseCase();
    emit(
      state.copyWith(
        config: event.config,
        components: components,
      ),
    );
  }

  List<ObjectView> getSourceObjects(SourceComponent source) {
    final components = state.components;

    if (components == Components.empty()) {
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

  Future<void> _onAddSource(
    DataComponentsScreenV2AddSource event,
    Emitter<DataComponentsScreenV2State> emit,
  ) async {
    final result = _addSourceUseCase(
      sourceName: event.sourceName,
      arch: state.config.arch,
    );

    if (result.isError) {
      onFailure(result.error.failure);
      return;
    }

    add(DataComponentsScreenV2IInit(config: state.config));
  }

  Future<void> _onEditSourceName(
    DataComponentsScreenV2EditSourceName event,
    Emitter<DataComponentsScreenV2State> emit,
  ) async {
    if (event.sourceName == event.newName) {
      return;
    }

    final result = _editSourceNameUseCase(
      sourceName: event.sourceName,
      newName: event.newName,
    );

    if (result.isError) {
      onFailure(result.error.failure);
      return;
    }

    add(DataComponentsScreenV2IInit(config: state.config));
  }

  Future<void> _onDeleteSource(
    DataComponentsScreenV2DeleteSource event,
    Emitter<DataComponentsScreenV2State> emit,
  ) async {
    final result = _deleteSourceUseCase(
      event.sourceName,
    );

    if (result.isError) {
      onFailure(result.error.failure);
      return;
    }

    add(DataComponentsScreenV2IInit(config: state.config));
  }

  Future<void> _onDeleteComponent(
    DataComponentsScreenV2DeleteComponent event,
    Emitter<DataComponentsScreenV2State> emit,
  ) async {
    final result = _deleteComponentUseCase(
      component: event.component,
    );

    if (result.isError) {
      onFailure(result.error.failure);
      return;
    }

    add(DataComponentsScreenV2IInit(config: state.config));
  }
}
