import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/utils/platforms_list.dart';
import 'package:process_run/utils/process_result_extension.dart';
import 'package:recase/recase.dart';

import '../../data/model/local/colored_line.dart';
import 'app_models.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  String projectPath;

  AppBloc({required this.projectPath})
      : super(
            Data(projectPath: projectPath, platforms: const PlatformsList())) {
    on<Init>((event, emit) => _init(event, emit));
    on<TabChange>((event, emit) => _tabChange(event, emit));
    on<ProjectNameChange>((event, emit) => _projectNameChange(event, emit));
    on<ProjectCheck>((event, emit) => _projectCheck(event, emit));
    on<ProjectPathChange>((event, emit) => _projectPathChange(event, emit));
    on<OrganizationChange>((event, emit) => _organizationChange(event, emit));
    on<FlavorizeChange>((event, emit) => _flavorizeChange(event, emit));
    on<FlavorsChange>((event, emit) => _flavorsChange(event, emit));
    on<RouterChange>((event, emit) => _routerChange(event, emit));
    on<LocalizationChange>((event, emit) => _localizationChange(event, emit));
    on<ThemingChange>((event, emit) => _themingChange(event, emit));
    on<GenerateSigningKeyChange>(
        (event, emit) => _generateSigningKeyChange(event, emit));
    on<UseSonarChange>((event, emit) => _useSonarChange(event, emit));
    on<IntegrateDevicePreviewChange>(
        (event, emit) => _integrateDevicePreviewChange(event, emit));
    on<SigningVarsChange>((event, emit) => _signingVarsChange(event, emit));
    on<PlatformsChange>((event, emit) => _platformsChange(event, emit));
    on<GenerateProject>((event, emit) => _generateProject(event, emit));
    on<GenerateComplete>((event, emit) => _generateComplete(event, emit));
    on<OnGenerateScreensWithProject>(
        (event, emit) => _onGenerateScreensWithProject(event, emit));
    on<OnGenerateRepositoriesWithProject>(
        (event, emit) => _onGenerateRepositoriesWithProject(event, emit));
    on<ScreenProjectChange>((event, emit) => _screenProjectChange(event, emit));
    on<EntityProjectChange>((event, emit) => _entityProjectChange(event, emit));
    on<ScreenAdd>((event, emit) => _screenAdd(event, emit));
    on<EntityAdd>((event, emit) => _entityAdd(event, emit));
    on<ScreenDelete>((event, emit) => _screenDelete(event, emit));
    on<EntityDelete>((event, emit) => _entityDelete(event, emit));
    on<StateUpdate>((event, emit) => _stateUpdate(event, emit));
    on<ScreensGenerate>((event, emit) => _screensGenerate(event, emit));
    on<EntitiesGenerate>((event, emit) => _entitiesGenerate(event, emit));
    on<ErrorClear>((event, emit) => _errorClear(event, emit));
    add(const ProjectCheck());
  }

  FutureOr<void> _init(Init event, Emitter<AppState> emit) {}

  FutureOr<void> _tabChange(TabChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(tab: event.tabIndex));
  }

  FutureOr<void> _projectPathChange(
      ProjectPathChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(projectPath: event.projectPath));
  }

  FutureOr<void> _projectNameChange(
      ProjectNameChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(projectName: event.projectName.snakeCase));
    add(const ProjectCheck());
  }

  FutureOr<void> _projectCheck(
      ProjectCheck event, Emitter<AppState> emit) async {
    var projectExists =
        await Directory('${state.projectPath}/${state.projectName}').exists();
    var projectIsClean = false;
    if (projectExists) {
      try {
        File file =
            File('${state.projectPath}/${state.projectName}/pubspec.yaml');
        String content = await file.readAsString();
        if (content.contains('#generated with mason')) {
          projectIsClean = true;
        }
      } catch (e) {
        projectIsClean = false;
      }
    }
    emit(state.copyWith(
        projectExists: projectExists, projectIsClean: projectIsClean));
  }

  FutureOr<void> _organizationChange(
      OrganizationChange event, Emitter<AppState> emit) async {
    var org = event.organization.hostCase();
    logger.d('org: $org');
    emit(state.copyWith(organization: event.organization.hostCase()));
  }

  FutureOr<void> _flavorizeChange(_, Emitter<AppState> emit) async {
    if (state.flavorize) {
      emit(state.copyWith(flavorize: false));
    } else {
      emit(state.copyWith(flavorize: true));
    }
  }

  FutureOr<void> _flavorsChange(
      FlavorsChange event, Emitter<AppState> emit) async {
    var flavors = event.flavors.toLowerCase().trim().split(' ').toSet();
    flavors
      ..remove('dev')
      ..remove('prod');
    emit(state.copyWith(flavors: flavors));
  }

  FutureOr<void> _routerChange(_, Emitter<AppState> emit) async {
    if (state.router == ProjectRouter.goRouter) {
      emit(state.copyWith(router: ProjectRouter.autoRouter));
    } else {
      emit(state.copyWith(router: ProjectRouter.goRouter));
    }
  }

  FutureOr<void> _localizationChange(_, Emitter<AppState> emit) async {
    if (state.localization == ProjectLocalization.intl) {
      emit(state.copyWith(localization: ProjectLocalization.flutter_gen));
    } else {
      emit(state.copyWith(localization: ProjectLocalization.intl));
    }
  }

  FutureOr<void> _themingChange(_, Emitter<AppState> emit) async {
    if (state.theming == ProjectTheming.manual) {
      emit(state.copyWith(theming: ProjectTheming.theme_tailor));
    } else {
      emit(state.copyWith(theming: ProjectTheming.manual));
    }
  }

  FutureOr<void> _generateSigningKeyChange(_, Emitter<AppState> emit) async {
    if (state.generateSigningKey) {
      emit(state.copyWith(generateSigningKey: false));
    } else {
      emit(state.copyWith(generateSigningKey: true));
    }
  }

  FutureOr<void> _useSonarChange(_, Emitter<AppState> emit) async {
    if (state.useSonar) {
      emit(state.copyWith(useSonar: false));
    } else {
      emit(state.copyWith(useSonar: true));
    }
  }

  FutureOr<void> _integrateDevicePreviewChange(
      _, Emitter<AppState> emit) async {
    if (state.integrateDevicePreview) {
      emit(state.copyWith(integrateDevicePreview: false));
    } else {
      emit(state.copyWith(integrateDevicePreview: true));
    }
  }

  FutureOr<void> _signingVarsChange(
      SigningVarsChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(signingVars: event.signingVars));
  }

  FutureOr<void> _platformsChange(
      PlatformsChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(platforms: event.platforms));
  }

  FutureOr<void> _generateProject(
      GenerateProject event, Emitter<AppState> emit) async {
    logger.d('generateProject');
    emit(state.copyWith(generatingState: GeneratingState.generating));
    if (!state.projectExists && state.projectName.isNotEmpty) {
      var configFile = await File('${state.projectPath}/config.json').create();
      await configFile.writeAsString(jsonEncode({
        'withUI': true,
        'signingVars': state.signingVars,
        'project_name_dirt': state.projectName,
        'project_org': state.organization,
        'flavorizr': state.flavorize,
        'flavors': state.flavors.toList(),
        'navigation': state.router.name,
        'localization': state.localization.name,
        'use_keytool': state.generateSigningKey,
        'use_sonar': state.useSonar,
        'device_preview': state.integrateDevicePreview,
        'platforms': state.platforms.toString(),
        'theme_generate': state.theming.name == 'theme_tailor',
      }).toString());

      event.outputStreamController
          .add(ColoredLine(line: '{#info}Getting mason & brick...'));

      var mainProcess =
          await Process.start('zsh', [], workingDirectory: state.projectPath);

      mainProcess.log(event.outputStreamController);
      mainProcess.stdin.writeln('source \$HOME/.zshrc');
      mainProcess.stdin.writeln('source \$HOME/.bash_profile');
      mainProcess.stdin.writeln('dart pub global activate mason_cli');
      mainProcess.stdin.writeln('mason cache clear');

      mainProcess.stdin.writeln(
          'mason add -g flutter_clean_base --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template --git-path flutter_clean_base');
      // mainProcess.stdin.writeln(
      //     'mason add -g flutter_clean_entity --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template --git-path flutter_clean_entity');
      mainProcess.stdin.writeln(
          'mason make flutter_clean_base -c config.json --on-conflict overwrite');

      var exitCode = await mainProcess.exitCode;
      configFile.delete();

      if (state.generateScreensWithProject && state.screens.isNotEmpty) {
        add(ScreensGenerate(
            outputStreamController: event.outputStreamController));
      } else if (state.generateEntitiesWithProject &&
          state.entities.isNotEmpty) {
        add(EntitiesGenerate(
            outputStreamController: event.outputStreamController));
      } else {
        emit(state.copyWith(
            projectExists: true, generatingState: GeneratingState.waiting));
      }
    }
  }

  FutureOr<void> _generateComplete(
      GenerateComplete event, Emitter<AppState> emit) async {
    add(const ProjectCheck());
    emit(state.copyWith(generatingState: GeneratingState.init));
  }

  FutureOr<void> _onGenerateScreensWithProject(
      OnGenerateScreensWithProject event, Emitter<AppState> emit) async {
    emit(state.copyWith(
        generateScreensWithProject: event.generateScreensWithProject));
  }

  FutureOr<void> _onGenerateRepositoriesWithProject(
      OnGenerateRepositoriesWithProject event, Emitter<AppState> emit) async {
    emit(state.copyWith(
        generateEntitiesWithProject: event.generateRepositoriesWithProject));
  }

  FutureOr<void> _screenProjectChange(
      ScreenProjectChange event, Emitter<AppState> emit) async {
    var path = event.screenProjectPath.split('/');
    var projectName = path.last;
    var projectPath = path.sublist(0, path.length - 1).join('/');

    emit(state.copyWith(projectPath: projectPath, projectName: projectName));
  }

  FutureOr<void> _entityProjectChange(
      EntityProjectChange event, Emitter<AppState> emit) async {
    var path = event.entityProjectPath.split('/');
    var projectName = path.last;
    var projectPath = path.sublist(0, path.length - 1).join('/');

    emit(state.copyWith(projectPath: projectPath, projectName: projectName));
  }

  FutureOr<void> _screenAdd(ScreenAdd event, Emitter<AppState> emit) async {
    var screens = state.screens.toList();
    if (!state.generateScreensWithProject && state.projectExists) {
      try {
        File file = File(
            '${state.projectPath}/${state.projectName}/lib/core/router/app_router.dart');
        String content = await file.readAsString();

        if (content.contains('${event.screen.name.pascalCase}Screen')) {
          emit(state.copyWith(
              screenError:
                  'Screen ${event.screen.name.pascalCase}Screen already exists'));
          return;
        }
      } catch (e) {
        logger.e(e);
      }
    }
    screens.add(event.screen);
    emit(state.copyWith(screens: screens.toSet()));
  }

  FutureOr<void> _entityAdd(EntityAdd event, Emitter<AppState> emit) async {
    var entities = state.entities.toList();
    if (!state.generateEntitiesWithProject && state.projectExists) {
      // try {
      //   File file = File(
      //       '${state.projectPath}/${state
      //           .projectName}/lib/core/router/app_router.dart');
      //   String content = await file.readAsString();
      //
      //   if (content.contains('${event.screen.name.pascalCase}Screen')) {
      //     emit(state.copyWith(
      //         screenError:
      //         'Screen ${event.screen.name.pascalCase}Screen already exists'));
      //     return;
      //   }
      // } catch (e) {
      //   logger.e(e);
      // }
    }
    entities.add(event.entity);
    emit(state.copyWith(entities: entities.toSet()));
  }

  FutureOr<void> _screenDelete(
      ScreenDelete event, Emitter<AppState> emit) async {
    var screens = state.screens.toList();
    screens.remove(event.screen);
    emit(state.copyWith(screens: screens.toSet()));
  }

  FutureOr<void> _entityDelete(
      EntityDelete event, Emitter<AppState> emit) async {
    var entities = state.entities.toList();
    entities.remove(event.entity);
    emit(state.copyWith(entities: entities.toSet()));
  }

  FutureOr<void> _stateUpdate(_, Emitter<AppState> emit) async {
    emit(state.copyWith(stateUpdate: DateTime.now().millisecondsSinceEpoch));
  }

  FutureOr<void> _screensGenerate(
      ScreensGenerate event, Emitter<AppState> emit) async {
    emit(state.copyWith(generatingState: GeneratingState.generating));

    var mainProcess = await Process.start('zsh', [],
        workingDirectory: '${state.projectPath}/${state.projectName}');

    mainProcess.log(event.outputStreamController);

    if (!state.generateScreensWithProject) {
      event.outputStreamController
          .add(ColoredLine(line: '{#info}Getting mason & brick...'));

      mainProcess.stdin.writeln('source \$HOME/.zshrc');
      mainProcess.stdin.writeln('source \$HOME/.bash_profile');
      mainProcess.stdin.writeln('dart pub global activate mason_cli');
      mainProcess.stdin.writeln('mason cache clear');
    }

    mainProcess.stdin.writeln(
        'mason add -g flutter_clean_screen --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template --git-path flutter_clean_screen');

    for (var screen in state.screens) {
      if (screen != state.screens.last) {
        mainProcess.stdin.writeln(
            'mason make flutter_clean_screen --build false --screen_name ${screen.name} --use_bloc ${screen.bloc} --on-conflict overwrite');
      } else {
        mainProcess.stdin.writeln(
            'mason make flutter_clean_screen --build true --screen_name ${screen.name} --use_bloc ${screen.bloc} --on-conflict overwrite');
      }
    }

    var exitCode = await mainProcess.exitCode;
    event.outputStreamController
        .add(ColoredLine(line: '{#info}Screens generated!'));

    if (state.generateEntitiesWithProject && state.entities.isNotEmpty) {
      add(EntitiesGenerate(
          outputStreamController: event.outputStreamController));
      emit(state.copyWith(screens: {}, generateScreensWithProject: false));
    } else {
      emit(state.copyWith(
          generatingState: GeneratingState.waiting,
          screens: {},
          generateScreensWithProject: false));
    }
  }

  FutureOr<void> _entitiesGenerate(
      EntitiesGenerate event, Emitter<AppState> emit) async {
    emit(state.copyWith(generatingState: GeneratingState.generating));

    var mainProcess = await Process.start('zsh', [],
        workingDirectory: '${state.projectPath}/${state.projectName}');

    mainProcess.log(event.outputStreamController);

    if (!state.generateEntitiesWithProject) {
      event.outputStreamController
          .add(ColoredLine(line: '{#info}Getting mason & brick...'));

      mainProcess.stdin.writeln('source \$HOME/.zshrc');
      mainProcess.stdin.writeln('source \$HOME/.bash_profile');
      mainProcess.stdin.writeln('dart pub global activate mason_cli');
      mainProcess.stdin.writeln('mason cache clear');
    }

    mainProcess.stdin.writeln(
        'mason add -g flutter_clean_entity --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template --git-path flutter_clean_entity');

    for (var entity in state.entities) {
      if (entity != state.entities.last) {
        mainProcess.stdin.writeln(
            'mason make flutter_clean_entity --build false --entity_name ${entity.name} --gen_request ${entity.generateRequest} --gen_response ${entity.generateResponse} --gen_repository ${entity.generateRepository} --on-conflict overwrite');
      } else {
        mainProcess.stdin.writeln(
            'mason make flutter_clean_entity --build true --entity_name ${entity.name} --gen_request ${entity.generateRequest} --gen_response ${entity.generateResponse} --gen_repository ${entity.generateRepository} --on-conflict overwrite');
      }
    }

    var exitCode = await mainProcess.exitCode;
    event.outputStreamController
        .add(ColoredLine(line: '{#info}Entities generated!'));

    emit(state.copyWith(
        generatingState: GeneratingState.waiting,
        entities: {},
        generateScreensWithProject: false));
  }

  FutureOr<void> _errorClear(_, Emitter<AppState> emit) async {
    emit(state.copyWith(screenError: ''));
  }
}

extension MyCase on String {
  String hostCase() {
    Iterable<String> strings = split('-');

    strings = strings.map((e) => e.dotCase);

    return strings.join('-');
  }
}

extension Logging on Process {
  void log(StreamController<ColoredLine> outputStreamController) {
    this
      ..outLines.asBroadcastStream().listen((event) {
        if (event.contains('Installing flutter_clean_') ||
            event.contains('Making flutter_clean_')) {
          outputStreamController.add(ColoredLine(line: '{#progress}$event'));
        } else {
          outputStreamController.add(ColoredLine(line: event));
        }
        if (event.contains('with exit code')) {
          kill();
        }
      })
      ..errLines.asBroadcastStream().listen((event) {
        outputStreamController.add(ColoredLine(line: '{#error}$event'));
      });
  }
}
