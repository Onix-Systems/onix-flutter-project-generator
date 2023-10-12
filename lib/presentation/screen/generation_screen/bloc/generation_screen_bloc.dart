import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:onix_flutter_bricks/core/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/core/di/services.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';

import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/process_starter.dart';
import 'package:recase/recase.dart';

class GenerationScreenBloc extends BaseBloc<GenerationScreenEvent,
    GenerationScreenState, GenerationScreenSR> {
  GenerationScreenBloc()
      : super(const GenerationScreenStateData(config: Config())) {
    on<GenerationScreenEventInit>(_onInit);
    on<GenerationScreenEventGenerateProject>(_onGenerateProject);
    on<GenerationScreenEventOpenProject>(_openProject);
  }

  FutureOr<void> _onInit(
    GenerationScreenEventInit event,
    Emitter<GenerationScreenState> emit,
  ) {
    outputService.clear();
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
        flavors = state.config.flavors.contains(' ')
            ? state.config.flavors
                .toLowerCase()
                .trim()
                .replaceAll(RegExp(' +'), ' ')
                .split(' ')
                .toSet()
            : {state.config.flavors.toLowerCase()};

        for (var flavor in flavors) {
          if (flavor.isEmpty || flavor == ' ') {
            flavors.remove(flavor);
          }
        }

        flavors
          ..remove('dev')
          ..remove('prod');
      }

      var configFile =
          await File('${state.config.projectPath}/config.json').create();

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
        'platforms': state.config.platformsList.toString().replaceAll(' ', ''),
        'theme_generate': state.config.theming.name == 'themeTailor',
      }).toString());

      outputService.add('{#info}Getting mason & brick...');

      final gitGetBrickProcess = await ProcessStarter.start(
          workingDirectory: state.config.projectPath);

      gitGetBrickProcess.stdin.writeln(
          'curl -L https://github.com/Onix-Systems/onix-flutter-project-generator/archive/refs/heads/main.zip --output brick.zip && unzip -qq brick.zip "onix-flutter-project-generator-main/bricks/*" -d bricks && rm brick.zip');

      gitGetBrickProcess.stdin.writeln('echo "Complete with exit code: 0"');
      await gitGetBrickProcess.exitCode;

      var mainProcess = await ProcessStarter.start(
          workingDirectory: state.config.projectPath);

      mainProcess.stdin
          .writeln('dart pub global activate mason_cli && mason cache clear');

      mainProcess.stdin.writeln(
          'mason add -g flutter_clean_base --path ${state.config.projectPath}/bricks/onix-flutter-project-generator-main/bricks/flutter_clean_base');

      mainProcess.stdin.writeln(
          'mason make flutter_clean_base -c config.json --on-conflict overwrite');

      await mainProcess.exitCode;

      configFile.delete();
      await Directory('${state.config.projectPath}/bricks')
          .delete(recursive: true);

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

    await _generateScreens();

    await _generateDataComponents();

    await _buildProject();

    await state.config.saveConfig(
        projectPath: '${state.config.projectPath}/${state.config.projectName}');

    final gitProcess = await ProcessStarter.start(
        workingDirectory:
            '${state.config.projectPath}/${state.config.projectName}');

    gitProcess.stdin.writeln(
        'git add --all && git commit -m "Initial" && echo "Complete with exit code: 0"');

    await gitProcess.exitCode;

    emit(state.copyWith(
      generatingState: GeneratingState.waiting,
      config: state.config.copyWith(
        sources: sourceRepository.sources,
        dataComponents: dataComponentRepository.dataComponents,
        screens: screenRepository.screens,
      ),
    ));
  }

  Future<void> _generateScreens() async {
    if (state.config.screens.where((element) => !element.exists).isNotEmpty) {
      for (var screen
          in state.config.screens.where((element) => !element.exists)) {
        outputService.add('{#info}Generating screen ${screen.name}...');

        await fileGeneratorService.generateScreen(
          screen: screen,
          projectPath: state.config.projectPath,
          projectName: state.config.projectName,
          router: state.config.router,
        );

        screen.exists = true;
        screenRepository.modifyScreen(screen, screen.name);
      }

      outputService.add('{#info}Screens generated!');
    }
  }

  Future<void> _generateDataComponents() async {
    var needToGenerateDataComponents = state.config.dataComponents
        .where((component) => !component.exists)
        .isNotEmpty;

    var needToGenerateSources =
        state.config.sources.where((source) => !source.exists).isNotEmpty;

    if (!needToGenerateSources) {
      for (var source in state.config.sources) {
        if (source.dataComponentsNames
            .where((component) => !dataComponentRepository
                .getDataComponentByName(dataComponentName: component)!
                .exists)
            .isNotEmpty) {
          needToGenerateSources = true;
          break;
        }
      }
    }

    if (needToGenerateDataComponents || needToGenerateSources) {
      outputService.add('{#info}Generating entities!');
      if (needToGenerateDataComponents) {
        for (final component in state.config.dataComponents) {
          await fileGeneratorService.generateComponent(
            projectPath: state.config.projectPath,
            projectName: state.config.projectName,
            dataComponentName: component.name,
          );
        }
      }

      if (needToGenerateSources) {
        final sources = state.config.sources.where((source) {
          return source.dataComponentsNames.where((entity) {
            return !dataComponentRepository
                .getDataComponentByName(dataComponentName: entity)!
                .exists;
          }).isNotEmpty;
        }).toList();
        for (var source in sources) {
          for (final component in source.dataComponentsNames.where((e) =>
              !dataComponentRepository
                  .getDataComponentByName(dataComponentName: e)!
                  .exists &&
              !source.paths.any((path) => path.methods.any((method) => method
                  .innerEnums
                  .any((innerEnum) => innerEnum.name == e))))) {
            await fileGeneratorService.generateComponent(
              projectPath: state.config.projectPath,
              projectName: state.config.projectName,
              dataComponentName: component,
            );
          }

          if (!source.exists) {
            await fileGeneratorService.generateSource(
              source: source,
              projectPath: state.config.projectPath,
              projectName: state.config.projectName,
            );
          }
        }
      }

      sourceRepository.setAllExists();
      dataComponentRepository.setAllExists();

      outputService.add('{#info}Entities generated!');
    }
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
}
