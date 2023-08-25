import 'dart:async';

import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/core/di/source.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/bloc/procedure_selection_screen_bloc_imports.dart';

class ProcedureSelectionScreenBloc extends BaseBloc<
    ProcedureSelectionScreenEvent,
    ProcedureSelectionScreenState,
    ProcedureSelectionScreenSR> {
  ProcedureSelectionScreenBloc()
      : super(const ProcedureSelectionScreenStateData(config: Config())) {
    on<ProcedureSelectionScreenEventInit>(_onInit);
    on<ProcedureSelectionScreenEventOnProjectOpen>(_onProjectOpen);
    on<ProcedureSelectionScreenEventOnNewProject>(_onNewProject);
  }

  FutureOr<void> _onInit(
    ProcedureSelectionScreenEventInit event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) {
    emit(state.copyWith(
      config: event.config,
    ));
  }

  FutureOr<void> _onNewProject(
    ProcedureSelectionScreenEventOnNewProject event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    sourceRepository.empty();
    dataComponentRepository.empty();
    screenRepository.empty();

    emit(state.copyWith(
      config: Config(projectPath: event.projectPath),
    ));

    addSr(const ProcedureSelectionScreenSR.onNewProject());
  }

  FutureOr<void> _onProjectOpen(
    ProcedureSelectionScreenEventOnProjectOpen event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    final config = await configSource.getConfig(
        configPath: '${event.projectURI}/.gen_config.json');

    if (config == Config.empty()) {
      addSr(const ProcedureSelectionScreenSR.emptyConfig());
      return;
    }

    final projectName = event.projectURI.split('/').last;
    final projectPath = event.projectURI.replaceAll('/$projectName', '');

    sourceRepository.empty();
    sourceRepository.addAll(config.sources);

    dataComponentRepository.empty();
    dataComponentRepository.addAll(config.dataComponents);

    screenRepository.empty();
    screenRepository.addAll(config.screens);

    emit(state.copyWith(
      config: config.copyWith(
        projectName: projectName,
        projectPath: projectPath,
      ),
    ));

    addSr(const ProcedureSelectionScreenSR.loadFinished());
  }
}