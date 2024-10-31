import 'dart:async';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/core/di/source.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/params/flavor_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/params/signing_generator_params.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_flavors_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_signing_config_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/clear_output_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/get_generation_output_stream_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/get_signing_fingerprint_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/screen/clear_screens_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/empty_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/bloc/procedure_selection_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/commands.dart';
import 'package:onix_flutter_bricks/util/extension/project_config_extension.dart';

class ProcedureSelectionScreenBloc extends BaseBloc<
    ProcedureSelectionScreenEvent,
    ProcedureSelectionScreenState,
    ProcedureSelectionScreenSR> {
  final GenerateSigningConfigUseCase _generateSigningConfigUseCase;
  final GenerateFlavorsUseCase _generateFlavorsUseCase;
  final GetSigningFingerprintUseCase _getSigningFingerprintUseCase;
  final ClearSwaggerComponentsUseCase _clearSwaggerComponentsUseCase;
  final ClearScreensUseCase _clearScreensUseCase;
  final GetGenerationOutputStream _getGenerationOutputStream;
  final ClearOutputUseCase _clearOutputUseCase;
  final RunProcessUseCase _runProcessUseCase;

  ProcedureSelectionScreenBloc(
    this._generateSigningConfigUseCase,
    this._generateFlavorsUseCase,
    this._getSigningFingerprintUseCase,
    this._clearSwaggerComponentsUseCase,
    this._clearScreensUseCase,
    this._getGenerationOutputStream,
    this._clearOutputUseCase,
    this._runProcessUseCase,
  ) : super(const ProcedureSelectionScreenStateData(config: Config())) {
    on<ProcedureSelectionScreenEventInit>(_onInit);
    on<ProcedureSelectionScreenEventOnProjectOpen>(_onProjectOpen);
    on<ProcedureSelectionScreenEventOnNewProject>(_onNewProject);
    on<ProcedureSelectionScreenEventOnLocaleChange>(_onLocaleChange);
    on<ProcedureSelectionScreenEventOnAndroidSigning>(_onnAndroidSigning);
    on<ProcedureSelectionScreenEventOnGenerateFlavors>(_onGenerateFlavors);
    on<ProcedureSelectionScreenEventOpenProjectInStudio>(_openProjectInStudio);
    on<ProcedureSelectionScreenEventOnFlavorizrOutputClose>(
      _onFlavorizrOutputClosed,
    );
  }

  Future<void> _onInit(
    ProcedureSelectionScreenEventInit event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        config: event.config,
        language: Intl.getCurrentLocale(),
      ),
    );
  }

  Future<void> _onNewProject(
    ProcedureSelectionScreenEventOnNewProject event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    _clearScreensUseCase();
    _clearSwaggerComponentsUseCase();

    emit(
      state.copyWith(
        config: Config(
          projectPath: event.projectPath,
          localVersion: state.config.localVersion,
          remoteVersion: state.config.remoteVersion,
        ),
      ),
    );

    addSr(const ProcedureSelectionScreenSR.onNewProject());
  }

  Future<void> _onProjectOpen(
    ProcedureSelectionScreenEventOnProjectOpen event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    final config = await configSource.getConfig(
      configPath: '${event.projectURI}/.gen_config.json',
    );

    if (config == Config.empty()) {
      addSr(const ProcedureSelectionScreenSR.emptyConfig());
      return;
    }

    final projectName = event.projectURI.split('/').last;
    final projectPath = event.projectURI.replaceAll('/$projectName', '');

    screenRepository
      ..empty()
      ..addAll(screens: config.screens);

    emit(
      state.copyWith(
        config: config.copyWith(
          projectName: projectName,
          projectPath: projectPath,
          projectExists: true,
          localVersion: state.config.localVersion,
          remoteVersion: state.config.remoteVersion,
        ),
      ),
    );

    addSr(const ProcedureSelectionScreenSR.loadFinished());
  }

  Future<void> _onLocaleChange(
    ProcedureSelectionScreenEventOnLocaleChange event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    await S.load(Locale(event.language));

    emit(
      state.copyWith(
        language: event.language,
      ),
    );
  }

  FutureOr<void> _onnAndroidSigning(
    ProcedureSelectionScreenEventOnAndroidSigning event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    showProgress();
    final signingPassword = state.config.getSigningPassword(
      ignoreSetting: true,
    );

    final result = await _generateSigningConfigUseCase(
      params: SingingGeneratorParams(
        projectFolder: event.directory.path,
        signingVars: event.signingVars,
        signingPassword: signingPassword,
        separateFromBrick: true,
      ),
    );
    await hideProgress();
    if (result.success) {
      final fingerprints = await _getSigningFingerprintUseCase(
        projectFolder: event.directory.path,
        password: signingPassword,
      );
      addSr(
        ProcedureSelectionScreenSR.onAndroidSigningCreated(
          fingerprints: fingerprints,
        ),
      );
    } else {
      onFailure(result.error.failure);
      return;
    }
  }

  Future<void> _onGenerateFlavors(
    ProcedureSelectionScreenEventOnGenerateFlavors event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    final outputStream = await _getGenerationOutputStream();

    emit(
      state.copyWith(
        flavorizingDirectory: event.directory,
        flavorizrOutputVisible: true,
        isGenerating: true,
        outputStream: outputStream,
      ),
    );

    final result = await _generateFlavorsUseCase(
      params: FlavorGeneratorParams(
        projectFolder: event.directory.path,
        flavors: event.flavors.toList(),
        separateFromBrick: true,
      ),
    );

    if (result.isError) {
      onFailure(result.error.failure);
    }

    emit(
      state.copyWith(
        isGenerating: false,
      ),
    );
  }

  Future<void> _openProjectInStudio(
    ProcedureSelectionScreenEventOpenProjectInStudio event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    final flavorizingDirectory = state.flavorizingDirectory;

    if (flavorizingDirectory == null) {
      return;
    }

    unawaited(
      _runProcessUseCase(
        workDir: flavorizingDirectory.path,
        commands: [Commands.getOpenAndroidStudioCommand()],
      ),
    );

    add(const ProcedureSelectionScreenEventOnFlavorizrOutputClose());
  }

  Future<void> _onFlavorizrOutputClosed(
    ProcedureSelectionScreenEventOnFlavorizrOutputClose event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    _clearOutputUseCase();

    emit(
      state.copyWith(
        flavorizrOutputVisible: false,
        flavorizingDirectory: null,
        isGenerating: false,
        outputStream: null,
      ),
    );
  }
}
