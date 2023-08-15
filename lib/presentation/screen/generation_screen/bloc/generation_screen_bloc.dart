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

import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/extension/logging_extension.dart';

class GenerationScreenBloc extends BaseBloc<GenerationScreenEvent,
    GenerationScreenState, GenerationScreenSR> {
  static const String gitRef = '--git-ref ${AppConsts.gitBranch}';

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

      var configFile =
          await File('${state.config.projectPath}/config.json').create();

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

      await configFile.writeAsString(jsonEncode({
        'signing_password': genPass,
        'project_name_dirt': state.config.projectName,
        'project_org': state.config.organization,
        'flavorizr': state.config.flavorize,
        'flavors': flavors.toList(),
        'navigation': state.config.router.name,
        'localization': state.config.localization.name,
        'use_keytool': state.config.generateSigningKey,
        'use_sonar': state.config.useSonar,
        'device_preview': state.config.integrateDevicePreview,
        'platforms': state.config.platformsList.toString().replaceAll(' ', ''),
        'theme_generate': state.config.theming.name == 'theme_tailor',
      }).toString());

      outputService.add('{#info}Getting mason & brick...');

      var mainProcess = await startProcess(
          workingDirectory: state.config.projectPath, activateMason: true);

      mainProcess.stdin.writeln(
          'mason add -g flutter_clean_base --git-url ${AppConsts.gitUri} --git-path bricks/flutter_clean_base ${gitRef.isNotEmpty ? gitRef : ''}');
      mainProcess.stdin.writeln(
          'mason make flutter_clean_base -c config.json --on-conflict overwrite');

      await mainProcess.exitCode;
      configFile.delete();

      if (state.config.generateSigningKey) {
        outputService.add('{info}Keystore password: $genPass');

        var signingProcess = await startProcess(
            workingDirectory:
                '${state.config.projectPath}/${state.config.projectName}/android/app/signing');

        signingProcess.stdin.writeln(
            'keytool -genkey -v -keystore upload-keystore.jks -alias upload -keyalg RSA -keysize 2048 -validity 10000 -keypass $genPass -storepass $genPass -dname "CN=${state.config.signingVars[0]}, OU=${state.config.signingVars[1]}, O=${state.config.signingVars[2]}, L=${state.config.signingVars[3]}, S=${state.config.signingVars[4]}, C=${state.config.signingVars[5]}"');
      }
    }

    await _generateScreens();

    await _generateDataComponents();

    emit(state.copyWith(
        generatingState: GeneratingState.waiting,
        config: state.config.copyWith(projectExists: true)));

    await state.config.saveConfig(
        projectPath: '${state.config.projectPath}/${state.config.projectName}');
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

        if (screen == state.config.screens.last) {
          var mainProcess = await startProcess(
              workingDirectory:
                  '${state.config.projectPath}/${state.config.projectName}');

          mainProcess.stdin.writeln(AppConsts.buildCmd);

          mainProcess.stdin.writeln('dart format .');

          mainProcess.stdin.writeln('echo "Complete with exit code: 0"');

          outputService.add('{#info}Complete with exit code: 0');
          await mainProcess.exitCode;
        }
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
        if (source.dataComponents
            .where((component) => !component.exists)
            .isNotEmpty) {
          needToGenerateSources = true;
          break;
        }
      }
    }

    if (needToGenerateDataComponents || needToGenerateSources) {
      if (needToGenerateDataComponents) {
        for (final component
            in state.config.dataComponents.where((e) => !e.exists)) {
          await fileGeneratorService.generateComponent(
            projectPath: state.config.projectPath,
            projectName: state.config.projectName,
            dataComponent: component,
          );
        }
      }

      if (needToGenerateSources) {
        final sources = state.config.sources
            .where((source) => source.dataComponents
                .where((entity) => !entity.exists)
                .isNotEmpty)
            .toList();
        for (var source in sources) {
          for (final component in source.dataComponents.where((e) =>
              !e.exists &&
              !source.paths.any((path) => path.methods.any((method) => method
                  .innerEnums
                  .any((innerEnum) => innerEnum.name == e.name))))) {
            await fileGeneratorService.generateComponent(
              projectPath: state.config.projectPath,
              projectName: state.config.projectName,
              dataComponent: component,
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
      outputService.add('{#info}Generating entities!');

      var mainProcess = await startProcess(
          workingDirectory:
              '${state.config.projectPath}/${state.config.projectName}');

      mainProcess.stdin.writeln(AppConsts.buildCmd);

      mainProcess.stdin
          .writeln('flutter pub run import_sorter:main --no-comments');

      mainProcess.stdin.writeln('dart format .');

      mainProcess.stdin.writeln('echo "Complete with exit code: 0"');

      outputService.add('{#info}Complete with exit code: 0');
      await mainProcess.exitCode;

      outputService.add('{#info}Entities generated!');

      for (var source in state.config.sources) {
        source.exists = true;
        sourceRepository.modifySource(source, source.name);
        for (var component in source.dataComponents) {
          component.exists = true;
          sourceRepository.modifyDataComponentInSource(
              source, component, component.name);
        }
      }

      for (var component in state.config.dataComponents) {
        component.exists = true;
      }
    }
  }

  FutureOr<void> _openProject(GenerationScreenEventOpenProject event,
      Emitter<GenerationScreenState> emit) async {
    var mainProcess = await startProcess(
        workingDirectory:
            '${state.config.projectPath}/${state.config.projectName}');

    mainProcess.stdin.writeln('open -na \'Android Studio.app\' .');

    await mainProcess.exitCode;
  }

  Future<Process> startProcess(
      {required String workingDirectory,
      bool activateMason = false,
      bool exitOnSucceeded = false}) async {
    var mainProcess =
        await Process.start('zsh', [], workingDirectory: workingDirectory);

    mainProcess.log(exitOnSucceeded: exitOnSucceeded);
    mainProcess.stdin.writeln('source \$HOME/.zshrc');
    mainProcess.stdin.writeln('source \$HOME/.bash_profile');

    if (activateMason) {
      mainProcess.stdin.writeln('dart pub global activate mason_cli');
      mainProcess.stdin.writeln('mason cache clear');
    }

    return mainProcess;
  }
}
