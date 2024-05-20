import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/params/docs_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/params/signing_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/styles_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/params/fastlane_generation_params.dart';
import 'package:onix_flutter_bricks/domain/usecase/docs_generation/generate_documentation_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/fastlane/generate_fastlane_files_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_data_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_screens_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_signing_config_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/add_output_message_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/get_generation_output_stream_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_osascript_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/styles/generate_styles_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/commands.dart';
import 'package:onix_flutter_bricks/util/extension/config_file_extension.dart';
import 'package:onix_flutter_bricks/util/extension/flavor_extension.dart';
import 'package:onix_flutter_bricks/util/extension/output/output_message_extension.dart';
import 'package:onix_flutter_bricks/util/extension/project_config_extension.dart';
import 'package:onix_flutter_bricks/util/extension/project_config_extension.dart';
import 'package:onix_flutter_bricks/util/flavors_util.dart';
import 'package:recase/recase.dart';

class GenerationScreenBloc extends BaseBloc<GenerationScreenEvent,
    GenerationScreenState, GenerationScreenSR> {
  ///generators
  final GenerateSigningConfigUseCase _generateSigningConfigUseCase;
  final GenerateDocumentationUseCase _generateDocumentationUseCase;
  final GenerateScreensUseCase _generateScreensUseCase;
  final GenerateDataComponentsUseCase _generateDataComponentsUseCase;
  final GenerateStylesUseCase _generateStylesUseCase;
  final GenerateFastlaneFilesUseCase _generateFastlaneFilesUseCase;

  ///process runners
  final RunProcessUseCase _runProcessUseCase;
  final RunOsaScriptProcessUseCase _osaScriptProcessUseCase;

  ///output commands
  final AddOutputMessageUseCase _addOutputMessageUseCase;
  final GetGenerationOutputStream _getGenerationOutputStream;

  GenerationScreenBloc(
    this._generateDocumentationUseCase,
    this._generateScreensUseCase,
    this._generateDataComponentsUseCase,
    this._addOutputMessageUseCase,
    this._runProcessUseCase,
    this._osaScriptProcessUseCase,
    this._generateSigningConfigUseCase,
    this._generateStylesUseCase,
    this._getGenerationOutputStream,
    this._generateFastlaneFilesUseCase,
  ) : super(const GenerationScreenStateData(config: Config())) {
    on<GenerationScreenEventInit>(_onInit);
    on<GenerationScreenEventGenerateProject>(_onGenerateProject);
    on<GenerationScreenEventOpenProject>(_openProject);
  }

  FutureOr<void> _onInit(
    GenerationScreenEventInit event,
    Emitter<GenerationScreenState> emit,
  ) async {
    final outputStream = await _getGenerationOutputStream();
    emit(
      state.copyWith(
        config: event.config,
        outputStream: outputStream,
        isModify: event.isModify,
      ),
    );
    add(const GenerationScreenEventGenerateProject());
  }

  FutureOr<void> _onGenerateProject(
    GenerationScreenEventGenerateProject event,
    Emitter<GenerationScreenState> emit,
  ) async {
    emit(state.copyWith(generatingState: GeneratingState.generating));

    if (!state.config.projectExists) {
      ///get password for signing generation (Android)
      String signingPassword = state.config.getSigningPassword();

      ///parse flavor string to Set<String>
      var flavors = state.config.getFlavorsAsSet();

      ///create config file, clear old possible copy
      var configFile = File('${state.config.projectPath}/config.json');
      if (configFile.existsSync()) {
        configFile.deleteSync();
      }

      ///create a new configuration file
      configFile.createSync();
      await configFile.saveJsonConfig(
        config: state.config,
        flavors: flavors.toList(),
        signingPassword: signingPassword,
      );

      _addOutputMessageUseCase(
        message: 'Getting mason & brick...'.toInfoMessage(),
      );

      ///create brick archive file
      final brickZip = File('${state.config.projectPath}/brick.zip');
      if (brickZip.existsSync()) {
        brickZip.deleteSync();
      }

      ///get brick target folder
      final brickFolder = Directory('${state.config.projectPath}/bricks');
      if (brickFolder.existsSync()) {
        brickFolder.deleteSync(recursive: true);
      }

      ///get brick code from repo
      await _runProcessUseCase(
        workDir: state.config.projectPath,
        commands: [
          Commands.getDownloadBrickCodeCommand(
            masonBrickBranch: state.config.branch,
          ),
          Commands.getCompletedWithCode0Command(),
        ],
      );

      ///run Mason command to build a brick
      await _runProcessUseCase(
        workDir: state.config.projectPath,
        commands: [
          Commands.getMasonActivateCommand(),
          Commands.getMasonAddBrickCommand(
            projectPath: state.config.projectPath,
            masonBrickBranch: state.config.branch,
          ),
          Commands.getMasonMakeBrickCommand(),
        ],
      );

      ///clear temporary brick files
      configFile.delete();
      brickFolder.deleteSync(recursive: true);

      if (!state.config.graphql) {
        await Directory(
                '${state.config.projectPath}/${state.config.projectName}/lib/core/arch/data/remote/clients/graph_ql')
            .delete(recursive: true);
        await Directory(
                '${state.config.projectPath}/${state.config.projectName}/lib/data/source/remote/auth')
            .delete(recursive: true);
      }

      ///generate Anroid signing key if configured
      if (state.config.generateSigningKey) {
        await _generateSigningConfigUseCase(
          params: SingingGeneratorParams(
            projectPath: state.config.projectPath,
            projectName: state.config.projectName,
            signingVars: state.config.signingVars,
            signingPassword: signingPassword,
          ),
        );
      }
    }

    ///generate styles if added
    if (!state.config.projectExists || state.config.styles.isNotEmpty) {
      await _generateStylesUseCase(
        params: StylesGeneratorParams(
          projectName: state.config.projectName,
          projectPath: state.config.projectPath,
          styles: state.config.styles,
          theming: state.config.theming,
          projectExists: state.config.projectExists,
          useScreenUtil: state.config.platformsList.mobile,
        ),
      );
    }

    ///generating screens
    bool hasScreensToGenerate =
        state.config.screens.where((element) => !element.exists).isNotEmpty;
    if (hasScreensToGenerate) {
      await _generateScreensUseCase(config: state.config);
    }

    ///generating data components
    await _generateDataComponentsUseCase(config: state.config);

    ///build project
    await _runProcessUseCase(
      workDir: '${state.config.projectPath}/${state.config.projectName}',
      commands: [
        Commands.getBuildRunnerBuildCommand(),
        Commands.getDartImportSortCommand(),
        Commands.getDartFormatCommand(),
        Commands.getCompletedWithCode0Command(),
      ],
    );

    ///generate project documentation
    await _generateDocumentation();

    await _generateFastlane();

    ///save project configuration
    await state.config.saveConfig(
        projectPath: '${state.config.projectPath}/${state.config.projectName}');

    /// run osascript
    if (!state.config.projectExists && state.config.firebaseAuth) {
      await _osaScriptProcessUseCase(
        workDir: '${state.config.projectPath}/${state.config.projectName}',
      );
    }

    ///finish generation
    emit(state.copyWith(
      generatingState: GeneratingState.waiting,
      config: state.config.copyWith(
        sources: sourceRepository.sources,
        dataComponents: dataComponentRepository.dataComponents,
        screens: screenRepository.screens,
      ),
    ));
  }

  ///when user tap on "Open Android Studio"
  FutureOr<void> _openProject(
    GenerationScreenEventOpenProject event,
    Emitter<GenerationScreenState> emit,
  ) async {
    await _runProcessUseCase(
      workDir: '${state.config.projectPath}/${state.config.projectName}',
      commands: [Commands.getOpenAndroidStudioCommand()],
    );
  }

  ///generating project base documentation files
  Future<void> _generateDocumentation() async {
    final params = DocsGenerationParams(
      projectName: state.config.projectName,
      projectPath: state.config.projectPath,
      organization: state.config.organization,
      flavorize: state.config.flavorize,
      flavors: FlavorsUtil.joinFlavors(
        flavorize: state.config.flavorize,
        selectedFlavors: state.config.flavors,
      ),
      platforms: state.config.platformsList.asList(),
      commands: state.config.platformsList.asPlatformCommandsList(),
    );

    await _generateDocumentationUseCase(
      params: params,
      isModify: state.isModify,
    );
  }

  /// Generating project fastlane files
  Future<void> _generateFastlane() async {
    final params = FastlaneGenerationParams(
      projectName: state.config.projectName,
      projectPath: state.config.projectPath,
      organization: state.config.organization,
      flavors: FlavorsUtil.joinFlavors(
        flavorize: state.config.flavorize,
        selectedFlavors: state.config.flavors,
      ),
      platforms: state.config.platformsList.asList(),
    );

    await _generateFastlaneFilesUseCase(params, isModify: state.isModify);
  }
}
