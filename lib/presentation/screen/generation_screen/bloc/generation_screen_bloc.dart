import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/docs_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/generate_styles.dart';
import 'package:onix_flutter_bricks/domain/usecase/docs_generation/generate_documentation_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_data_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_screens_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/add_output_message_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/clear_output_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_osascript_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_process_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/commands.dart';
import 'package:onix_flutter_bricks/util/extension/flavor_extension.dart';
import 'package:onix_flutter_bricks/util/extension/project_config_extension.dart';
import 'package:recase/recase.dart';

class GenerationScreenBloc extends BaseBloc<GenerationScreenEvent,
    GenerationScreenState, GenerationScreenSR> {
  final GenerateDocumentationUseCase _generateDocumentationUseCase;
  final GenerateScreensUseCase _generateScreensUseCase;
  final GenerateDataComponentsUseCase _generateDataComponentsUseCase;

  ///process runners
  final RunProcessUseCase _runProcessUseCase;
  final RunOsaScriptProcessUseCase _osaScriptProcessUseCase;

  ///output commands
  final ClearOutputUseCase _clearOutputUseCase;
  final AddOutputMessageUseCase _addOutputMessageUseCase;

  GenerationScreenBloc(
    this._generateDocumentationUseCase,
    this._generateScreensUseCase,
    this._generateDataComponentsUseCase,
    this._clearOutputUseCase,
    this._addOutputMessageUseCase,
    this._runProcessUseCase,
    this._osaScriptProcessUseCase,
  ) : super(const GenerationScreenStateData(config: Config())) {
    on<GenerationScreenEventInit>(_onInit);
    on<GenerationScreenEventGenerateProject>(_onGenerateProject);
    on<GenerationScreenEventOpenProject>(_openProject);
  }

  FutureOr<void> _onInit(
    GenerationScreenEventInit event,
    Emitter<GenerationScreenState> emit,
  ) {
    _clearOutputUseCase();
    emit(state.copyWith(config: event.config));
    add(const GenerationScreenEventGenerateProject());
  }

  FutureOr<void> _onGenerateProject(
    GenerationScreenEventGenerateProject event,
    Emitter<GenerationScreenState> emit,
  ) async {
    emit(state.copyWith(generatingState: GeneratingState.generating));

    if (!state.config.projectExists) {
      ///get password for signing generation (Android)
      String genPass = state.config.getSigningPassword();

      ///parse flavor string to Set<String>
      var flavors = state.config.getFlavorsAsSet();

      ///create config file, clear old possible copy
      var configFile = File('${state.config.projectPath}/config.json');
      if (configFile.existsSync()) {
        configFile.deleteSync();
      }

      ///create a new configuration file
      configFile.createSync();

      await configFile.writeAsString(jsonEncode({
        'signing_password': genPass,
        'project_name_dirt': state.config.projectName,
        'project_org': state.config.organization,
        'flavorizr': state.config.flavorize,
        'flavors': flavors.toList(),
        'navigation': state.config.router.name,
        'localization': state.config.localization.name.snakeCase,
        'use_keytool': state.config.generateSigningKey,
        'use_sonar': state.config.useSonar,
        'graphql': state.config.graphql,
        'firebase_auth': state.config.firebaseAuth,
        'platforms': state.config.platformsList.toString().replaceAll(' ', ''),
        'theme_generate': state.config.theming.name == 'themeTailor',
        'branch': state.config.branch,
      }).toString());

      _addOutputMessageUseCase(message: '{#info}Getting mason & brick...');

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
        await FileGeneratorService().generateSigning(
          projectPath: state.config.projectPath,
          projectName: state.config.projectName,
          signingVars: state.config.signingVars,
          genPass: genPass,
        );
      }
    }

    ///generate styles if added
    if (!state.config.projectExists || state.config.styles.isNotEmpty) {
      await GenerateStyles().call(
        projectName: state.config.projectName,
        projectPath: state.config.projectPath,
        styles: state.config.styles,
        theming: state.config.theming,
        projectExists: state.config.projectExists,
        useScreenUtil: state.config.platformsList.mobile,
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
  FutureOr<void> _openProject(GenerationScreenEventOpenProject event,
      Emitter<GenerationScreenState> emit) async {
    await _runProcessUseCase(
      workDir: '${state.config.projectPath}/${state.config.projectName}',
      commands: [Commands.getOpenAndroidStudioCommand()],
    );
  }

  ///generating project base documentation files
  Future<void> _generateDocumentation() async {
    final Set<String> allFlavors = {};
    if (state.config.flavorize) {
      final customFlavors = state.config.flavors.flavorStringToSet();
      allFlavors.addAll(AppConsts.defaultFlavors);
      allFlavors.addAll(customFlavors);
    }
    final params = DocsGenerationParams(
      projectName: state.config.projectName,
      projectPath: state.config.projectPath,
      organization: state.config.organization,
      flavors: allFlavors,
      platforms: state.config.platformsList.asList(),
      commands: state.config.platformsList.asPlatformCommandsList(),
    );

    await _generateDocumentationUseCase(params: params);
  }
}
