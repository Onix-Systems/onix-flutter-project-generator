import 'dart:async';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/bloc/data_components_screen_bloc_imports.dart';
import 'package:recase/recase.dart';

class DataComponentsScreenBloc extends BaseBloc<DataComponentsScreenEvent,
    DataComponentsScreenState, DataComponentsScreenSR> {
  DataComponentsScreenBloc()
      : super(const DataComponentsScreenStateData(config: Config())) {
    on<DataComponentsScreenEventInit>(_onInit);
    on<DataComponentsScreenEventStateUpdate>(_onStateUpdate);
    on<DataComponentsScreenEventAddSource>(_onAddSource);
    on<DataComponentsScreenEventDeleteSource>(_onDeleteSource);
    on<DataComponentsScreenEventAddDataComponent>(_onAddDataComponent);
    on<DataComponentsScreenEventDeleteDataComponent>(_onDeleteDataComponent);
  }

  FutureOr<void> _onInit(
    DataComponentsScreenEventInit event,
    Emitter<DataComponentsScreenState> emit,
  ) {
    emit(state.copyWith(
      config: event.config.copyWith(
        sources: {
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
              ]),
          ...event.config.sources,
        },
        dataComponents: {
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
          ...event.config.dataComponents,
        },
      ),
    ));
  }

  FutureOr<void> _onStateUpdate(
    DataComponentsScreenEventStateUpdate event,
    Emitter<DataComponentsScreenState> emit,
  ) {
    emit(state.copyWith(stateUpdate: DateTime.now().millisecondsSinceEpoch));
  }

  FutureOr<void> _onAddSource(
    DataComponentsScreenEventAddSource event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    if (state.config.sources
        .where((element) => element.name == event.source.name)
        .isNotEmpty) {
      addSr(DataComponentsScreenSR.error(
          message: '${event.source.name.pascalCase}Source already exists'));
      return;
    }

    var sources = state.config.sources.toList();

    sources.add(event.source);
    emit(state.copyWith(
      config: state.config.copyWith(sources: sources.toSet()),
    ));
  }

  FutureOr<void> _onDeleteSource(
    DataComponentsScreenEventDeleteSource event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    var sources = state.config.sources.toList();
    sources.remove(event.source);
    emit(state.copyWith(
      config: state.config.copyWith(sources: sources.toSet()),
    ));
  }

  FutureOr<void> _onAddDataComponent(
    DataComponentsScreenEventAddDataComponent event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    if (state.config.dataComponents
        .where((element) => element.name == event.dataComponent.name)
        .isNotEmpty) {
      addSr(DataComponentsScreenSR.error(
          message:
              'Data component ${event.dataComponent.name.pascalCase} already exists'));

      return;
    } else {
      for (var source in state.config.sources) {
        for (var entity in source.dataComponents) {
          if (entity.name == event.dataComponent.name) {
            addSr(DataComponentsScreenSR.error(
                message:
                    'Data component ${event.dataComponent.name.pascalCase} already exists in ${source.name.titleCase}Source'));
            return;
          }
        }
      }
    }

    var component = event.dataComponent;

    component.properties = [Property(name: 'name', type: 'string')];

    if (event.source == null) {
      var entities = state.config.dataComponents.toList();

      entities.add(event.dataComponent);
      emit(state.copyWith(
        config: state.config.copyWith(dataComponents: entities.toSet()),
      ));
    } else {
      var entities = event.source?.dataComponents.toList() ?? [];
      var entity = event.dataComponent;
      entity.sourceName = event.source?.name ?? '';
      entities.add(event.dataComponent);
      var sources = state.config.sources.toList();

      sources.firstWhere((source) => source == event.source).dataComponents =
          entities;
      emit(state.copyWith(
        config: state.config.copyWith(sources: sources.toSet()),
      ));
    }
    add(const DataComponentsScreenEventStateUpdate());
  }

  FutureOr<void> _onDeleteDataComponent(
    DataComponentsScreenEventDeleteDataComponent event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    if (event.source == null) {
      var entities = state.config.dataComponents.toList();
      entities.remove(event.entity);
      emit(state.copyWith(
        config: state.config.copyWith(dataComponents: entities.toSet()),
      ));
    } else {
      var entities = event.source?.dataComponents.toList() ?? [];
      entities.remove(event.entity);
      var sources = state.config.sources.toList();
      sources.firstWhere((source) => source == event.source).dataComponents =
          entities;
      emit(state.copyWith(
        config: state.config.copyWith(sources: sources.toSet()),
      ));
    }

    add(const DataComponentsScreenEventStateUpdate());
  }
}
