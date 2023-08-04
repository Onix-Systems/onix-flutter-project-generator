import 'dart:async';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/bloc/data_components_screen_bloc_imports.dart';

class DataComponentsScreenBloc extends BaseBloc<DataComponentsScreenEvent,
    DataComponentsScreenState, DataComponentsScreenSR> {
  DataComponentsScreenBloc() : super(const DataComponentsScreenStateData()) {
    on<DataComponentsScreenEventInit>(_onInit);
    add(const DataComponentsScreenEvent.init());
  }

  FutureOr<void> _onInit(
    DataComponentsScreenEventInit event,
    Emitter<DataComponentsScreenState> emit,
  ) {
    emit(state.copyWith.call(
      sources: state.sources.isEmpty
          ? {
              Source(
                  name: 'Time',
                  exists: true,
                  isGenerated: false,
                  dataComponents: [
                    DataComponent(
                        name: 'Time',
                        exists: true,
                        isGenerated: false,
                        properties: [
                          Property(
                            name: 'currentDateTime',
                            type: 'DateTime',
                          ),
                        ])
                      ..setSourceName('Time'),
                  ])
            }
          : state.sources,
      dataComponents: state.dataComponents.isEmpty
          ? {
              DataComponent(
                name: 'Auth',
                exists: true,
                isGenerated: false,
                properties: [
                  Property(
                    name: 'accessToken',
                    type: 'String',
                  ),
                  Property(
                    name: 'refreshToken',
                    type: 'String',
                  ),
                ],
              ),
            }
          : state.dataComponents,
    ));
  }
}
