import 'dart:async';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
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
    var component = event.dataComponent;
    component.name = event.dataComponent.name.pascalCase;

    if (dataComponentRepository.exists(component.name)) {
      addSr(DataComponentsScreenSR.error(
          message:
              'Data component ${component.name.pascalCase} already exists'));

      return;
    } else {
      for (var source in sourceRepository.sources) {
        for (var entity in source.dataComponentsNames) {
          if (entity.pascalCase == component.name.pascalCase) {
            addSr(DataComponentsScreenSR.error(
                message:
                    'Data component ${component.name.pascalCase} already exists in ${source.name.titleCase}Source'));
            return;
          }
        }
      }
    }

    if (component.properties.isEmpty) {
      component.properties.add(Property(name: 'name', type: 'string'));
    } else {
      _inheritRequestResponse(component);
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
    if (event.source != null) {
      final source = sourceRepository.getSourceByName(event.source!.name);
      if (source != null) {
        sourceRepository.deleteDataComponentFromSource(source, event.entity);
      }
    }

    dataComponentRepository.removeComponent(event.entity.name);
    sourceRepository.deleteDataComponentFromAllSources(event.entity.name);

    add(const DataComponentsScreenEventStateUpdate());
  }

  FutureOr<void> _onModifyDataComponent(
    DataComponentsScreenEventModifyDataComponent event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    if (event.source != null) {
      final source = sourceRepository.getSourceByName(event.source!.name);
      if (source != null) {
        sourceRepository.modifyDataComponentInAllSources(
            event.dataComponent, event.oldDataComponentName);
      }
    } else {
      dataComponentRepository.modifyComponent(
          event.oldDataComponentName, event.dataComponent);
    }

    _inheritRequestResponse(event.dataComponent);

    add(const DataComponentsScreenEventStateUpdate());
  }

  void _inheritRequestResponse(DataComponent parentComponent) {
    if (parentComponent.imports.isNotEmpty) {
      for (var import in parentComponent.imports
          .where((e) => !dataComponentRepository.isEnum(e))
          .toList()) {
        var componentImport =
            dataComponentRepository.getDataComponentByName(import);

        if (componentImport != null) {
          componentImport.generateRequest = parentComponent.generateRequest;
          componentImport.generateResponse = parentComponent.generateResponse;

          if (componentImport.sourceName.isEmpty) {
            dataComponentRepository.modifyComponent(import, componentImport);
          } else {
            sourceRepository.modifyDataComponentInAllSources(
                componentImport, import);
          }

          if (componentImport.imports.isNotEmpty) {
            _inheritRequestResponse(componentImport);
          }
        }
      }
    }
  }
}
