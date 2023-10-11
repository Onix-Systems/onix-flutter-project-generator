import 'dart:async';
import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
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
    on<ProcedureSelectionScreenEventOnLocaleChange>(_onLocaleChange);
  }

  FutureOr<void> _onInit(
    ProcedureSelectionScreenEventInit event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) {
    emit(state.copyWith(
      config: event.config,
      language: Intl.getCurrentLocale(),
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
      config: Config(
        projectPath: event.projectPath,
        localVersion: state.config.localVersion,
        remoteVersion: state.config.remoteVersion,
      ),
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
    sourceRepository.addAll(sources: config.sources);

    dataComponentRepository.empty();
    dataComponentRepository.addAll(config.dataComponents);

    screenRepository.empty();
    screenRepository.addAll(config.screens);

    emit(state.copyWith(
      config: config.copyWith(
        projectName: projectName,
        projectPath: projectPath,
        projectExists: true,
        localVersion: state.config.localVersion,
        remoteVersion: state.config.remoteVersion,
      ),
    ));

    addSr(const ProcedureSelectionScreenSR.loadFinished());
  }

  FutureOr<void> _onLocaleChange(
    ProcedureSelectionScreenEventOnLocaleChange event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    S.load(Locale(event.language));

    emit(state.copyWith(
      language: event.language,
    ));
  }
}
