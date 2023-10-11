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
      dataComponentRepository
          .addComponent(dataComponentRepository.timeComponent);
      sourceRepository.addSource(source: sourceRepository.timeSource);
    }
    emit(state.copyWith(
      config: event.config.copyWith(
        sources: sourceRepository.sources,
        dataComponents: dataComponentRepository.dataComponents
            .where((e) => e.sourceName.isEmpty)
            .toSet(),
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
        dataComponents: dataComponentRepository.dataComponents
            .where((e) => e.sourceName.isEmpty)
            .toSet(),
      ),
      stateUpdate: DateTime.now().millisecondsSinceEpoch,
    ));
  }

  FutureOr<void> _onAddSource(
    DataComponentsScreenEventAddSource event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    if (sourceRepository.getSourceByName(sourceName: event.source.name) !=
        null) {
      addSr(DataComponentsScreenSR.error(
          message: '${event.source.name.pascalCase}Source already exists'));
      return;
    }

    sourceRepository.addSource(source: event.source);

    add(const DataComponentsScreenEventStateUpdate());
  }

  FutureOr<void> _onDeleteSource(
    DataComponentsScreenEventDeleteSource event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    sourceRepository.deleteSource(
        sourceName: event.sourceName,
        withDataComponents: event.withDataComponents);

    add(const DataComponentsScreenEventStateUpdate());
  }

  FutureOr<void> _onModifySource(
    DataComponentsScreenEventModifySource event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    sourceRepository.modifySource(
        source: event.source, oldSourceName: event.oldSourceName);

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

    dataComponentRepository.addComponent(component);

    if (event.source != null) {
      final source =
          sourceRepository.getSourceByName(sourceName: event.source!.name);

      if (source != null) {
        sourceRepository.addDataComponentToSource(
            sourceName: source.name, dataComponentName: component.name);
      }
    }

    add(const DataComponentsScreenEventStateUpdate());
  }

  FutureOr<void> _onDeleteDataComponent(
    DataComponentsScreenEventDeleteDataComponent event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    if (event.sourceName.isNotEmpty) {
      sourceRepository.deleteDataComponentFromSource(
          sourceName: event.sourceName,
          dataComponentName: event.dataComponentName);
    }

    dataComponentRepository.removeComponent(event.dataComponentName);
    sourceRepository.deleteDataComponentFromAllSources(
        dataComponentName: event.dataComponentName);

    add(const DataComponentsScreenEventStateUpdate());
  }

  FutureOr<void> _onModifyDataComponent(
    DataComponentsScreenEventModifyDataComponent event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    dataComponentRepository.modifyComponent(
        event.oldDataComponentName, event.dataComponent);

    if (event.source != null) {
      final source =
          sourceRepository.getSourceByName(sourceName: event.source!.name);
      if (source != null) {
        sourceRepository.modifyDataComponentInAllSources(
            dataComponent: event.dataComponent,
            oldDataComponentName: event.oldDataComponentName);
      }
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

          dataComponentRepository.modifyComponent(import, componentImport);

          if (componentImport.sourceName.isNotEmpty) {
            sourceRepository.modifyDataComponentInAllSources(
                dataComponent: componentImport, oldDataComponentName: import);
          }

          if (componentImport.imports.isNotEmpty) {
            _inheritRequestResponse(componentImport);
          }
        }
      }
    }
  }
}
