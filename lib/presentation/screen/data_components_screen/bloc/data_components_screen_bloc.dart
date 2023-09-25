import 'dart:async';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
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
    on<DataComponentsScreenEventModifySource>(_onModifySource);
    on<DataComponentsScreenEventAddDataComponent>(_onAddDataComponent);
    on<DataComponentsScreenEventDeleteDataComponent>(_onDeleteDataComponent);
    on<DataComponentsScreenEventModifyDataComponent>(_onModifyDataComponent);
  }

  FutureOr<void> _onInit(
    DataComponentsScreenEventInit event,
    Emitter<DataComponentsScreenState> emit,
  ) {
    if (!event.config.projectExists) {
      dataComponentRepository
          .addComponent(dataComponentRepository.authComponent);
      sourceRepository.addSource(sourceRepository.timeSource);
    }
    emit(state.copyWith(
      config: event.config.copyWith(
        sources: sourceRepository.sources,
        dataComponents: dataComponentRepository.dataComponents,
      ),
    ));
  }

  FutureOr<void> _onStateUpdate(
    DataComponentsScreenEventStateUpdate event,
    Emitter<DataComponentsScreenState> emit,
  ) {
    emit(state.copyWith(
      config: state.config.copyWith(
        sources: sourceRepository.sources,
        dataComponents: dataComponentRepository.dataComponents,
      ),
      stateUpdate: DateTime.now().millisecondsSinceEpoch,
    ));
  }

  FutureOr<void> _onAddSource(
    DataComponentsScreenEventAddSource event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    if (sourceRepository.getSourceByName(event.source.name) != null) {
      addSr(DataComponentsScreenSR.error(
          message: '${event.source.name.pascalCase}Source already exists'));
      return;
    }

    sourceRepository.addSource(event.source);

    add(const DataComponentsScreenEventStateUpdate());
  }

  FutureOr<void> _onDeleteSource(
    DataComponentsScreenEventDeleteSource event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    final sourceToDelete = sourceRepository.getSourceByName(event.source.name);

    if (sourceToDelete != null) {
      sourceRepository.deleteSource(sourceToDelete);
    }

    add(const DataComponentsScreenEventStateUpdate());
  }

  FutureOr<void> _onModifySource(
    DataComponentsScreenEventModifySource event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    sourceRepository.modifySource(event.source, event.oldSourceName);

    add(const DataComponentsScreenEventStateUpdate());
  }

  FutureOr<void> _onAddDataComponent(
    DataComponentsScreenEventAddDataComponent event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    if (dataComponentRepository.exists(event.dataComponent.name)) {
      addSr(DataComponentsScreenSR.error(
          message:
              'Data component ${event.dataComponent.name.pascalCase} already exists'));

      return;
    } else {
      for (var source in sourceRepository.sources) {
        for (var entity in source.dataComponents) {
          if (entity.name.pascalCase == event.dataComponent.name.pascalCase) {
            addSr(DataComponentsScreenSR.error(
                message:
                    'Data component ${event.dataComponent.name.pascalCase} already exists in ${source.name.titleCase}Source'));
            return;
          }
        }
      }
    }

    var component = event.dataComponent;

    if (component.properties.isEmpty) {
      component.properties.add(Property(name: 'name', type: 'string'));
    }

    if (event.source == null) {
      dataComponentRepository.addComponent(component);
    } else {
      final source = sourceRepository.getSourceByName(event.source!.name);

      if (source != null) {
        sourceRepository.addDataComponentToSource(source, component);
      }
    }
    add(const DataComponentsScreenEventStateUpdate());
  }

  FutureOr<void> _onDeleteDataComponent(
    DataComponentsScreenEventDeleteDataComponent event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    if (event.source == null) {
      dataComponentRepository.removeComponent(event.entity.name);
      sourceRepository.deleteDataComponentFromAllSources(event.entity.name);
    } else {
      final source = sourceRepository.getSourceByName(event.source!.name);

      if (source != null) {
        sourceRepository.deleteDataComponentFromSource(source, event.entity);
        sourceRepository.deleteDataComponentFromAllSources(event.entity.name);
        dataComponentRepository.removeComponent(event.entity.name);
      }
    }
    add(const DataComponentsScreenEventStateUpdate());
  }

  FutureOr<void> _onModifyDataComponent(
    DataComponentsScreenEventModifyDataComponent event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    if (event.source == null) {
      dataComponentRepository.removeComponent(event.oldDataComponentName);
      dataComponentRepository.addComponent(event.dataComponent);
    } else {
      final source = sourceRepository.getSourceByName(event.source!.name);

      if (source != null) {
        sourceRepository.modifyDataComponentInSource(
            source, event.dataComponent, event.oldDataComponentName);
      }
    }
    add(const DataComponentsScreenEventStateUpdate());
  }
}
