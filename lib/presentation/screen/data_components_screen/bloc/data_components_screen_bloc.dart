import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
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
      sourceRepository.addDemoComponents();
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
          message: S.current.sourceExistsError(event.source.name)));
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

    if (dataComponentRepository.exists(dataComponentName: component.name)) {
      final existingComponent = dataComponentRepository.getDataComponentByName(
          dataComponentName: component.name)!;

      addSr(DataComponentsScreenSR.error(
          message:
              '${S.current.dataComponentExistsError(component.name.pascalCase)}${existingComponent.sourceName.isNotEmpty ? S.current.dataComponentExistsInSource(existingComponent.sourceName) : ''}'));

      return;
    }

    if (component.properties.isEmpty) {
      component.properties.add(Property(name: 'name', type: 'string'));
    } else {
      _inheritRequestResponse(component);
    }

    dataComponentRepository.addComponent(dataComponent: component);

    if (event.source != null) {
      sourceRepository.addDataComponentToSource(
        sourceName: event.source?.name ?? '',
        dataComponentName: component.name,
      );
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

    dataComponentRepository.removeComponent(
        dataComponentName: event.dataComponentName);
    sourceRepository.deleteDataComponentFromAllSources(
        dataComponentName: event.dataComponentName);

    add(const DataComponentsScreenEventStateUpdate());
  }

  FutureOr<void> _onModifyDataComponent(
    DataComponentsScreenEventModifyDataComponent event,
    Emitter<DataComponentsScreenState> emit,
  ) async {
    dataComponentRepository.modifyComponent(
        oldDataComponentName: event.oldDataComponentName,
        dataComponent: event.dataComponent);

    if (event.source != null) {
      sourceRepository.modifyDataComponentInAllSources(
          dataComponentName: event.dataComponent.name,
          dataComponentSourceName: event.source?.name ?? '',
          oldDataComponentName: event.oldDataComponentName);
    }

    _inheritRequestResponse(event.dataComponent);

    add(const DataComponentsScreenEventStateUpdate());
  }

  void _inheritRequestResponse(DataComponent parentComponent) {
    if (parentComponent.imports.isNotEmpty) {
      for (var import in parentComponent.imports
          .where((e) => !dataComponentRepository.isEnum(dataComponentName: e))
          .toList()) {
        var componentImport = dataComponentRepository.getDataComponentByName(
            dataComponentName: import);

        if (componentImport != null) {
          componentImport.generateRequest = parentComponent.generateRequest;
          componentImport.generateResponse = parentComponent.generateResponse;

          dataComponentRepository.modifyComponent(
              oldDataComponentName: import, dataComponent: componentImport);

          if (componentImport.sourceName.isNotEmpty) {
            sourceRepository.modifyDataComponentInAllSources(
                dataComponentName: componentImport.name,
                dataComponentSourceName: componentImport.sourceName,
                oldDataComponentName: import);
          }

          if (componentImport.imports.isNotEmpty) {
            _inheritRequestResponse(componentImport);
          }
        }
      }
    }
  }
}
