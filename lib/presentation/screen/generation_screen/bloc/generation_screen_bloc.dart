import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/service/config_service/config_service.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/params/docs_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/params/fastlane_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/params/signing_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/styles_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/git_cliff_service/params/git_cliff_params.dart';
import 'package:onix_flutter_bricks/domain/usecase/docs_generation/generate_documentation_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/fastlane/generate_fastlane_files_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_screens_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_signing_config_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/git_cliff/generate_git_cliff_files_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/add_output_message_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/get_generation_output_stream_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_osascript_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/styles/generate_styles_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/create_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/commands.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:onix_flutter_bricks/util/extension/output/output_message_extension.dart';
import 'package:onix_flutter_bricks/util/flavors_util.dart';
import 'package:recase/recase.dart';

class GenerationScreenBloc extends BaseBloc<GenerationScreenEvent,
    GenerationScreenState, GenerationScreenSR> {
  final ConfigService _configService;
  Config get config => _configService.config;

  ///generators
  final GenerateSigningConfigUseCase _generateSigningConfigUseCase;
  final GenerateDocumentationUseCase _generateDocumentationUseCase;
  final GenerateScreensUseCase _generateScreensUseCase;

  final GenerateStylesUseCase _generateStylesUseCase;
  final GenerateFastlaneFilesUseCase _generateFastlaneFilesUseCase;
  final CreateSwaggerComponentsUseCase _createSwaggerComponentsUseCase;
  final GenerateGitCliffFilesUseCase _generateGitCliffFilesUseCase;

  ///process runners
  final RunProcessUseCase _runProcessUseCase;
  final RunOsaScriptProcessUseCase _osaScriptProcessUseCase;

  ///output commands
  final AddOutputMessageUseCase _addOutputMessageUseCase;
  final GetGenerationOutputStream _getGenerationOutputStream;

  final GetSwaggerComponentsUseCase _getComponentsUseCase;

  GenerationScreenBloc(
    this._configService,
    this._generateDocumentationUseCase,
    this._generateScreensUseCase,
    this._addOutputMessageUseCase,
    this._runProcessUseCase,
    this._osaScriptProcessUseCase,
    this._generateSigningConfigUseCase,
    this._generateStylesUseCase,
    this._getGenerationOutputStream,
    this._generateFastlaneFilesUseCase,
    this._createSwaggerComponentsUseCase,
    this._generateGitCliffFilesUseCase,
    this._getComponentsUseCase,
  ) : super(const GenerationScreenStateData()) {
    on<GenerationScreenEventInit>(_onInit);
    on<GenerationScreenEventGenerateProject>(_onGenerateProject);
    on<GenerationScreenEventOpenProject>(_openProject);
  }

  Future<void> _onInit(
    GenerationScreenEventInit event,
    Emitter<GenerationScreenState> emit,
  ) async {
    final outputStream = await _getGenerationOutputStream();

    final components = _getComponentsUseCase();

    emit(
      state.copyWith(
        outputStream: outputStream,
        isModify: event.isModify,
        components: components,
      ),
    );
    add(const GenerationScreenEventGenerateProject());
  }

  Future<void> _onGenerateProject(
    GenerationScreenEventGenerateProject event,
    Emitter<GenerationScreenState> emit,
  ) async {
    emit(state.copyWith(generatingState: GeneratingState.generating));

    if (!config.projectExists) {
      ///get password for signing generation (Android)
      final signingPassword = _configService.getSigningPassword();

      ///parse flavor string to Set<String>
      final flavors = _configService.getFlavorsAsSet();

      ///create config file, clear old possible copy
      final configFile = File('${config.projectPath}/config.json');
      if (configFile.existsSync()) {
        configFile.deleteSync();
      }

      ///create a new configuration file
      configFile.createSync();
      await _configService.saveJsonConfig(
        file: configFile,
        flavors: flavors.toList(),
        signingPassword: signingPassword,
      );

      _addOutputMessageUseCase(
        message: 'Getting mason & brick...'.toInfoMessage(),
      );

      ///create brick archive file
      final brickZip = File('${config.projectPath}/brick.zip');
      if (brickZip.existsSync()) {
        brickZip.deleteSync();
      }

      ///get brick target folder
      final brickFolder = Directory('${config.projectPath}/bricks');
      if (brickFolder.existsSync()) {
        brickFolder.deleteSync(recursive: true);
      }

      ///get brick code from repo
      await _runProcessUseCase(
        workDir: config.projectPath,
        commands: [
          Commands.getDownloadBrickCodeCommand(
            masonBrickBranch: config.branchConfig.branch,
          ),
          Commands.getCompletedWithCode0Command(),
        ],
      );

      ///run Mason command to build a brick
      await _runProcessUseCase(
        workDir: config.projectPath,
        commands: [
          Commands.getMasonActivateCommand(),
          Commands.getMasonAddBrickCommand(
            projectPath: config.projectPath,
            masonBrickBranch: config.branchConfig.branch,
            brickArch: config.arch.name,
          ),
          Commands.getMasonMakeBrickCommand(
            brickArch: config.arch.name,
          ),
        ],
      );

      ///clear temporary brick files
      await configFile.delete();
      brickFolder.deleteSync(recursive: true);

      if (!config.graphql) {
        await Directory(
          '${config.projectRootPath}/${config.arch.getGraphQlPath()}',
        ).delete(recursive: true);

        await Directory(
          '${config.projectRootPath}/lib/data/source/remote/auth',
        ).delete(recursive: true);
      }

      ///generate Android signing key if configured
      if (config.generateSigningKey) {
        await _generateSigningConfigUseCase(
          params: SingingGeneratorParams(
            projectFolder: config.projectRootPath,
            signingVars: config.signingVars,
            signingPassword: signingPassword,
          ),
        );
      }
    }

    ///generate styles if added
    if (!config.projectExists || config.styles.isNotEmpty) {
      await _generateStylesUseCase(
        params: StylesGeneratorParams(
          projectName: config.projectName,
          projectPath: config.projectPath,
          styles: config.styles,
          theming: config.theming,
          projectExists: config.projectExists,
          useScreenUtil: config.platformsList.mobile && config.useScreenUtil,
        ),
      );
    }

    final newScreensExists =
        config.screens.where((screen) => !screen.exists).isNotEmpty;

    ///generating screens
    if (newScreensExists || !config.projectExists) {
      await _generateScreensUseCase(
        config: config,
      );
    } else {
      final routerFile = File(
        '${config.projectRootPath}/lib/app/router/app_router.dart',
      );
      var routerContent = routerFile.readAsStringSync();

      if (config.router == ProjectRouter.goRouter) {
        final routerLines = routerContent.split('\n');

        final initialLocationIndex = routerLines.indexWhere(
          (element) => element.contains('static const _initialLocation'),
        );

        final initialScreen =
            config.screens.firstWhereOrNull((element) => element.initial);

        if (initialScreen != null) {
          final initialScreenName = initialScreen.name.snakeCase;

          routerLines[initialLocationIndex] =
              "static const _initialLocation = '/$initialScreenName';";

          routerContent = routerLines.join('\n');
        }
      } else {
        final routerLines = routerContent.split('\n')
          ..removeWhere(
            (element) => element.contains('initial: true,'),
          );

        routerContent = routerLines.join('\n');

        final initialScreen =
            config.screens.firstWhereOrNull((element) => element.initial);

        if (initialScreen != null) {
          final initialScreenName = initialScreen.name.snakeCase;

          routerContent = routerContent.replaceFirst(
            "path: '/${initialScreenName}Screen',",
            "path: '/${initialScreenName}Screen',\ninitial: true,",
          );
        }
      }

      await routerFile.writeAsString(routerContent);
    }

    ///generating data components//TODO
    ///await _generateDataComponentsUseCase(config: state.config);

    await _createSwaggerComponentsUseCase(
      projectName: config.projectName,
      projectRootPath: config.projectRootPath,
      arch: config.arch,
    );

    ///build project
    await _runProcessUseCase(
      workDir: config.projectRootPath,
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

    await _generateGitCliffFilesUseCase(
      GitCliffParams(
        projectName: config.projectName,
        projectPath: config.projectPath,
      ),
    );

    ///save project configuration
    await _configService.saveConfig(
      projectPath: config.projectRootPath,
    );

    /// run osascript
    if (!config.projectExists && config.firebaseAuth) {
      await _osaScriptProcessUseCase(
        workDir: config.projectRootPath,
      );
    }

    _addOutputMessageUseCase(
      message: List.generate(10, (index) => '-').join().toInfoMessage(),
    );
    _addOutputMessageUseCase(
      message: 'Project generation completed.'.toInfoMessage(),
    );
    _addOutputMessageUseCase(
      message: 'Don\'t forget to run "Optimize imports" after project opened.'
          .toInfoMessage(),
    );
    _addOutputMessageUseCase(
      message: List.generate(10, (index) => '-').join().toInfoMessage(),
    );

    ///finish generation
    emit(
      state.copyWith(
        generatingState: GeneratingState.waiting,
      ),
    );
  }

  ///when user tap on "Open Android Studio"
  Future<void> _openProject(
    GenerationScreenEventOpenProject event,
    Emitter<GenerationScreenState> emit,
  ) async {
    await _runProcessUseCase(
      workDir: config.projectRootPath,
      commands: [Commands.getOpenAndroidStudioCommand()],
    );
  }

  ///generating project base documentation files
  Future<void> _generateDocumentation() async {
    final params = DocsGenerationParams(
      projectName: config.projectName,
      projectPath: config.projectPath,
      organization: config.organization,
      flavorize: config.flavorize,
      flavors: FlavorsUtil.joinFlavors(
        flavorize: config.flavorize,
        selectedFlavors: config.flavors,
      ),
      platforms: config.platformsList.asList(),
      commands: config.platformsList.asPlatformCommandsList(),
    );

    await _generateDocumentationUseCase(
      params: params,
      isModify: state.isModify,
    );
  }

  /// Generating project fastlane files
  Future<void> _generateFastlane() async {
    final params = FastlaneGenerationParams(
      projectName: config.projectName,
      projectPath: config.projectPath,
      organization: config.organization,
      flavors: FlavorsUtil.joinFlavors(
        flavorize: config.flavorize,
        selectedFlavors: config.flavors,
      ),
      platforms: config.platformsList.asList(),
    );

    await _generateFastlaneFilesUseCase(params, isModify: state.isModify);
  }
}
