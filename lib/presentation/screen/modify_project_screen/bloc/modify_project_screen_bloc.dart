import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/modify_project_screen/bloc/modify_project_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/util/swagger_parser/swagger_parser.dart';

class ModifyProjectScreenBloc extends BaseBloc<ModifyProjectScreenEvent,
    ModifyProjectScreenState, ModifyProjectScreenSR> {
  ModifyProjectScreenBloc()
      : super(const ModifyProjectScreenStateData(config: Config())) {
    on<ModifyProjectScreenEventInit>(_onInit);
    on<ModifyProjectScreenEventChangeTab>(_onChangeTab);
    on<ModifyProjectScreenEventOnGenerate>(_onGenerate);
    on<ModifyProjectScreenEventOnParse>(_onParse);
  }

  FutureOr<void> _onInit(
    ModifyProjectScreenEventInit event,
    Emitter<ModifyProjectScreenState> emit,
  ) async {
    if (event.config.organization.isEmpty) {
      sourceRepository.empty();
      dataComponentRepository.empty();
      screenRepository.empty();
    }

    emit(
      state.copyWith(
        config: event.config.copyWith(
          sources: sourceRepository.sources,
          dataComponents: dataComponentRepository.dataComponents
              .where((e) => e.sourceName.isEmpty)
              .toSet(),
          screens: screenRepository.screens,
          projectExists: true,
          localVersion: event.config.localVersion,
          remoteVersion: event.config.remoteVersion,
        ),
      ),
    );
  }

  FutureOr<void> _onChangeTab(
    ModifyProjectScreenEventChangeTab event,
    Emitter<ModifyProjectScreenState> emit,
  ) {
    emit(state.copyWith(currentTab: event.index));
  }

  FutureOr<void> _onGenerate(
    ModifyProjectScreenEventOnGenerate event,
    Emitter<ModifyProjectScreenState> emit,
  ) async {
    emit(state.copyWith(
      config: state.config.copyWith(
        sources: sourceRepository.sources,
        dataComponents: dataComponentRepository.dataComponents,
        screens: screenRepository.screens,
      ),
    ));

    addSr(const ModifyProjectScreenSR.onGenerate());
  }

  FutureOr<void> _onParse(
    ModifyProjectScreenEventOnParse event,
    Emitter<ModifyProjectScreenState> emit,
  ) async {
    showProgress();

    try {
      var response = await http.get(Uri.parse(event.path));

      var json = jsonDecode(response.body);

      final stateSources = sourceRepository.sources;
      final stateDataComponents = dataComponentRepository.dataComponents
          .map((e) => DataComponent.copyOf(e))
          .toSet();

      SwaggerParser.parse(
          data: json as Map<String, dynamic>,
          projectName: state.config.projectName);

      final parsedSources = sourceRepository.sources;
      final parsedDataComponents = dataComponentRepository.dataComponents
          .map((e) => DataComponent.copyOf(e))
          .toSet();

      sourceRepository.empty();
      final sources = [
        ...stateSources,
        ...parsedSources,
      ];

      sourceRepository.addAll(
          sources: sources.sorted((a, b) => a.name.compareTo(b.name)).toSet());

      dataComponentRepository.empty();

      final dataComponents = [
        ...stateDataComponents,
        ...parsedDataComponents,
      ];

      dataComponentRepository.addAll(
          dataComponents.sorted((a, b) => a.name.compareTo(b.name)).toSet());

      await hideProgress();

      addSr(const ModifyProjectScreenSR.onRefresh());
    } catch (e) {
      await hideProgress();
      addSr(ModifyProjectScreenSR.onError(message: e.toString()));
    }
  }
}
