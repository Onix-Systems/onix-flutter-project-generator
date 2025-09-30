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
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/commands.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:onix_flutter_bricks/util/extension/output/output_message_extension.dart';
import 'package:onix_flutter_bricks/util/flavors_util.dart';
import 'package:recase/recase.dart';

class GenerationScreenBloc extends BaseBloc<GenerationScreenEvent,
    GenerationScreenState, GenerationScreenSR> {
  final ConfigService _configService;
  Config get _config => _configService.config;

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
  final RunOsaScriptProcessUseCase _runOsaScriptProcessUseCase;

  ///output commands
  final AddOutputMessageUseCase _addOutputMessageUseCase;
  final GetGenerationOutputStream _getGenerationOutputStream;

  GenerationScreenBloc({
    required ConfigService configService,
    required GenerateDocumentationUseCase generateDocumentationUseCase,
    required GenerateScreensUseCase generateScreensUseCase,
    required AddOutputMessageUseCase addOutputMessageUseCase,
    required RunProcessUseCase runProcessUseCase,
    required RunOsaScriptProcessUseCase runOsaScriptProcessUseCase,
    required GenerateSigningConfigUseCase generateSigningConfigUseCase,
    required GenerateStylesUseCase generateStylesUseCase,
    required GetGenerationOutputStream getGenerationOutputStream,
    required GenerateFastlaneFilesUseCase generateFastlaneFilesUseCase,
    required CreateSwaggerComponentsUseCase createSwaggerComponentsUseCase,
    required GenerateGitCliffFilesUseCase generateGitCliffFilesUseCase,
  })  : _configService = configService,
        _generateDocumentationUseCase = generateDocumentationUseCase,
        _generateScreensUseCase = generateScreensUseCase,
        _addOutputMessageUseCase = addOutputMessageUseCase,
        _runProcessUseCase = runProcessUseCase,
        _runOsaScriptProcessUseCase = runOsaScriptProcessUseCase,
        _generateSigningConfigUseCase = generateSigningConfigUseCase,
        _generateStylesUseCase = generateStylesUseCase,
        _generateFastlaneFilesUseCase = generateFastlaneFilesUseCase,
        _createSwaggerComponentsUseCase = createSwaggerComponentsUseCase,
        _generateGitCliffFilesUseCase = generateGitCliffFilesUseCase,
        _getGenerationOutputStream = getGenerationOutputStream,
        super(const GenerationScreenStateData()) {
    on<GenerationScreenEventInit>(_onInit);
    on<GenerationScreenEventGenerateProject>(_onGenerateProject);
    on<GenerationScreenEventOpenProject>(_openProject);
  }

  Future<void> _onInit(
    GenerationScreenEventInit event,
    Emitter<GenerationScreenState> emit,
  ) async {
    final outputStream = await _getGenerationOutputStream();

    emit(
      state.copyWith(
        outputStream: outputStream,
      ),
    );
    add(const GenerationScreenEventGenerateProject());
  }

  Future<void> _onGenerateProject(
    GenerationScreenEventGenerateProject event,
    Emitter<GenerationScreenState> emit,
  ) async {
    emit(state.copyWith(generatingState: GeneratingState.generating));

    if (!_config.projectExists) {
      ///get password for signing generation (Android)
      final signingPassword = _configService.getSigningPassword();

      final signingVars = _config.signingVars.toList()..last = signingPassword;

      _configService.updateWith(
        signingVars: signingVars,
      );

      ///parse flavor string to Set<String>
      final flavors = _configService.getFlavorsAsSet();

      ///create config file, clear old possible copy
      final configFile = File('${_config.projectPath}/config.json');
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
      final brickZip = File('${_config.projectPath}/brick.zip');
      if (brickZip.existsSync()) {
        brickZip.deleteSync();
      }

      ///get brick target folder
      final brickFolder = Directory('${_config.projectPath}/bricks');
      if (brickFolder.existsSync()) {
        brickFolder.deleteSync(recursive: true);
      }

      ///get brick code from repo
      await _runProcessUseCase(
        workDir: _config.projectPath,
        commands: [
          Commands.getDownloadBrickCodeCommand(
            masonBrickBranch: _config.branchConfig.branch,
          ),
          Commands.getCompletedWithCode0Command(),
        ],
      );

      ///run Mason command to build a brick
      await _runProcessUseCase(
        workDir: _config.projectPath,
        commands: [
          Commands.getMasonActivateCommand(),
          Commands.getMasonAddBrickCommand(
            projectPath: _config.projectPath,
            masonBrickBranch: _config.branchConfig.branch,
            brickArch: _config.arch.name,
          ),
          Commands.getMasonMakeBrickCommand(
            brickArch: _config.arch.name,
          ),
        ],
      );

      ///clear temporary brick files
      await configFile.delete();
      brickFolder.deleteSync(recursive: true);

      if (!_config.graphql) {
        await Directory(
          '${_config.projectRootPath}/${_config.arch.getGraphQlPath()}',
        ).delete(recursive: true);

        await Directory(
          '${_config.projectRootPath}/lib/data/source/remote/auth',
        ).delete(recursive: true);
      }

      ///generate Android signing key if configured
      if (_config.generateSigningKey) {
        await _generateSigningConfigUseCase(
          params: SingingGeneratorParams(
            projectFolder: _config.projectRootPath,
            signingVars: _config.signingVars,
          ),
        );
      }
    }

    ///generate styles if added
    if (!_config.projectExists || _config.styles.isNotEmpty) {
      await _generateStylesUseCase(
        params: StylesGeneratorParams(
          projectName: _config.projectName,
          projectPath: _config.projectPath,
          styles: _config.styles,
          theming: _config.theming,
          projectExists: _config.projectExists,
          useScreenUtil: _config.platformsList.mobile && _config.useScreenUtil,
        ),
      );
    }

    final newScreensExists =
        _config.screens.where((screen) => !screen.exists).isNotEmpty;

    ///generating screens
    if (newScreensExists || !_config.projectExists) {
      await _generateScreensUseCase(
        config: _config,
      );
    } else {
      final routerFile = File(
        '${_config.projectRootPath}/lib/app/router/app_router.dart',
      );
      var routerContent = routerFile.readAsStringSync();

      if (_config.router == ProjectRouter.goRouter) {
        final routerLines = routerContent.split('\n');

        final initialLocationIndex = routerLines.indexWhere(
          (element) => element.contains('static const _initialLocation'),
        );

        final initialScreen =
            _config.screens.firstWhereOrNull((element) => element.initial);

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
            _config.screens.firstWhereOrNull((element) => element.initial);

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
      projectName: _config.projectName,
      projectRootPath: _config.projectRootPath,
      arch: _config.arch,
      projectExists: _config.projectExists,
    );

    ///build project
    await _runProcessUseCase(
      workDir: _config.projectRootPath,
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
        projectName: _config.projectName,
        projectPath: _config.projectPath,
      ),
    );

    ///save project configuration
    await _configService.saveConfigFile(
      projectPath: _config.projectRootPath,
    );

    /// run osascript
    if (!_config.projectExists && _config.firebaseAuth) {
      await _runOsaScriptProcessUseCase(
        workDir: _config.projectRootPath,
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
      workDir: _config.projectRootPath,
      commands: [Commands.getOpenAndroidStudioCommand()],
    );
  }

  ///generating project base documentation files
  Future<void> _generateDocumentation() async {
    final params = DocsGenerationParams(
      projectName: _config.projectName,
      projectPath: _config.projectPath,
      organization: _config.organization,
      flavorize: _config.flavorize,
      flavors: FlavorsUtil.joinFlavors(
        flavorize: _config.flavorize,
        selectedFlavors: _config.flavors,
      ),
      platforms: _config.platformsList.asList(),
      commands: _config.platformsList.asPlatformCommandsList(),
    );

    await _generateDocumentationUseCase(
      params: params,
      isModify: _config.projectExists,
    );
  }

  /// Generating project fastlane files
  Future<void> _generateFastlane() async {
    final params = FastlaneGenerationParams(
      projectName: _config.projectName,
      projectPath: _config.projectPath,
      organization: _config.organization,
      flavors: FlavorsUtil.joinFlavors(
        flavorize: _config.flavorize,
        selectedFlavors: _config.flavors,
      ),
      platforms: _config.platformsList.asList(),
    );

    await _generateFastlaneFilesUseCase(
      params,
      isModify: _config.projectExists,
    );
  }
}
