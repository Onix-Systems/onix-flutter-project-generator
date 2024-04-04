import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:onix_flutter_bricks/core/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/extension/string_parser_extension.dart';
import 'package:onix_flutter_bricks/util/process_starter.dart';
import 'package:recase/recase.dart';

class GenerationScreenBloc extends BaseBloc<GenerationScreenEvent,
    GenerationScreenState, GenerationScreenSR> {
  final GenerateDocumentationUseCase _generateDocumentationUseCase;
  final GenerateScreensUseCase _generateScreensUseCase;
  final GenerateDataComponentsUseCase _generateDataComponentsUseCase;

  ///output commands
  final ClearOutputUseCase _clearOutputUseCase;
  final AddOutputMessageUseCase _addOutputMessageUseCase;

  GenerationScreenBloc(
    this._generateDocumentationUseCase,
    this._generateScreensUseCase,
    this._generateDataComponentsUseCase,
    this._clearOutputUseCase,
    this._addOutputMessageUseCase,
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
      String genPass = '';

      if (state.config.generateSigningKey) {
        if (state.config.signingVars[6].isEmpty) {
          genPass = List.generate(20, (index) {
            return AppConsts.signingKeyPassChars[(Random.secure()
                .nextInt(AppConsts.signingKeyPassChars.length))];
          }).join();
        } else {
          genPass = state.config.signingVars[6];
        }
      }

      var flavors = <String>{};

      if (state.config.flavors.isNotEmpty) {
        flavors = state.config.flavors.flavorStringToSet();

        for (var flavor in flavors) {
          if (flavor.isEmpty || flavor == ' ') {
            flavors.remove(flavor);
          }
        }

        flavors
          ..remove('dev')
          ..remove('prod');
      }

      var configFile = File('${state.config.projectPath}/config.json');

      if (configFile.existsSync()) {
        configFile.deleteSync();
      }

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
      }).toString());

      _addOutputMessageUseCase(message: '{#info}Getting mason & brick...');
      final brickZip = File('${state.config.projectPath}/brick.zip');

      if (brickZip.existsSync()) {
        brickZip.deleteSync();
      }

      final brickFolder = Directory('${state.config.projectPath}/bricks');

      if (brickFolder.existsSync()) {
        brickFolder.deleteSync(recursive: true);
      }

      final gitGetBrickProcess = await ProcessStarter.start(
          workingDirectory: state.config.projectPath);

      gitGetBrickProcess.stdin.writeln(
        'curl -L https://github.com/Onix-Systems/onix-flutter-project-generator/archive/refs/heads/main.zip --output brick.zip && unzip -qq brick.zip -d bricks && rm brick.zip',
      );

      gitGetBrickProcess.stdin.writeln('echo "Complete with exit code: 0"');
      await gitGetBrickProcess.exitCode;

      var mainProcess = await ProcessStarter.start(
          workingDirectory: state.config.projectPath);

      mainProcess.stdin
          .writeln('dart pub global activate mason_cli && mason cache clear');

      mainProcess.stdin.writeln(
        'mason add -g flutter_clean_base --path \'${state.config.projectPath}/bricks/onix-flutter-project-generator-main/bricks/flutter_clean_base\'',
      );

      mainProcess.stdin.writeln(
          'mason make flutter_clean_base -c config.json --on-conflict overwrite');

      await mainProcess.exitCode;

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

      if (state.config.generateSigningKey) {
        await FileGeneratorService().generateSigning(
          projectPath: state.config.projectPath,
          projectName: state.config.projectName,
          signingVars: state.config.signingVars,
          genPass: genPass,
        );
      }
    }

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

    await _buildProject();

    await _generateDocumentation();

    await state.config.saveConfig(
        projectPath: '${state.config.projectPath}/${state.config.projectName}');

    if (!state.config.projectExists && state.config.firebaseAuth) {
      var process = await Process.start(
          'osascript',
          [
            '-e',
            '''tell application "Terminal"
  set T to do script "cd '${state.config.projectPath}/${state.config.projectName}' && flutterfire config"
	set targetWindow to window 1
	activate targetWindow
	set custom title of targetWindow to "flutterfire"
	delay 2
	repeat
		delay 1
		if not busy of T then exit repeat
	end repeat
	close (every window whose name contains "flutterfire")
end tell'''
          ],
          workingDirectory:
              '${state.config.projectPath}/${state.config.projectName}');

      process.stdout
          .transform(utf8.decoder)
          .listen((event) => _addOutputMessageUseCase(message: event));

      await process.exitCode;
    }

    emit(state.copyWith(
      generatingState: GeneratingState.waiting,
      config: state.config.copyWith(
        sources: sourceRepository.sources,
        dataComponents: dataComponentRepository.dataComponents,
        screens: screenRepository.screens,
      ),
    ));
  }

  FutureOr<void> _openProject(GenerationScreenEventOpenProject event,
      Emitter<GenerationScreenState> emit) async {
    var mainProcess = await ProcessStarter.start(
        workingDirectory:
            '${state.config.projectPath}/${state.config.projectName}');

    mainProcess.stdin.writeln('open -a \'Android Studio.app\' .');

    await mainProcess.exitCode;
  }

  Future<void> _buildProject() async {
    final buildProcess = await ProcessStarter.start(
        workingDirectory:
            '${state.config.projectPath}/${state.config.projectName}');

    buildProcess.stdin.writeln(AppConsts.buildCmd);

    buildProcess.stdin.writeln('dart run import_sorter:main --no-comments');

    buildProcess.stdin.writeln('dart format .');

    buildProcess.stdin.writeln('echo "Complete with exit code: 0"');

    await buildProcess.exitCode;
  }

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
      flavors: allFlavors,
      platforms: state.config.platformsList.asList(),
      commands: state.config.platformsList.asPlatformCommandsList(),
    );

    await _generateDocumentationUseCase(params: params);
  }
}
