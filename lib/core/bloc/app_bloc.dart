import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/config/config.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/entity_entity.dart';
import 'package:onix_flutter_bricks/data/model/local/screen/screen_entity.dart';
import 'package:onix_flutter_bricks/data/model/local/source/source_entity.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source_impl.dart';
import 'package:onix_flutter_bricks/data/model/local/platforms_list/platforms_list.dart';
import 'package:onix_flutter_bricks/utils/extensions/logging.dart';
import 'package:recase/recase.dart';

import 'app_models.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  String projectPath;

  final ConfigSource _configSource = ConfigSourceImpl();

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
    on<ProjectChange>((event, emit) => _projectChange(event, emit));
    on<ScreenAdd>((event, emit) => _screenAdd(event, emit));
    on<EntityAdd>((event, emit) => _entityAdd(event, emit));
    on<SourceAdd>((event, emit) => _sourceAdd(event, emit));
    on<ScreenDelete>((event, emit) => _screenDelete(event, emit));
    on<EntityDelete>((event, emit) => _entityDelete(event, emit));
    on<SourceDelete>((event, emit) => _sourceDelete(event, emit));
    on<StateUpdate>((event, emit) => _stateUpdate(event, emit));
    on<ScreensGenerate>((event, emit) => _screensGenerate(event, emit));
    on<EntitiesGenerate>((event, emit) => _entitiesGenerate(event, emit));
    on<ErrorClear>((event, emit) => _errorClear(event, emit));
    on<OpenProject>((event, emit) => _openProject(event, emit));
    add(const Init());
    add(const ProjectCheck());
  }

  FutureOr<void> _init(_, Emitter<AppState> emit) {
    logger.d('init');
    emit(
      state.copyWith(
        sources: {
          SourceEntity(
            name: 'time',
            exists: true,
            entities: [EntityEntity(name: 'time', exists: true)],
          )
        },
        entities: {
          EntityEntity(name: 'auth', exists: true),
        },
        screens: {
          ScreenEntity(name: 'splash', exists: true),
          ScreenEntity(name: 'home', exists: true)
        },
      ),
    );
  }

  FutureOr<void> _tabChange(TabChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(tab: event.tabIndex));
    add(const ProjectCheck());
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

        final config = await _configSource.getConfig(
          configPath:
              '${state.projectPath}/${state.projectName}/.gen_config.json',
        );

        if (config != Config.empty()) {
          emit(state.copyWith(
            projectExists: projectExists,
            projectIsClean: projectIsClean,
            screens: config.screens.toSet(),
            entities: config.entities.toSet(),
            sources: config.sources.toSet(),
          ));
        }

        logger.d('config: $config');

        return;
      } catch (e) {
        logger.e(e);
        projectIsClean = false;
      }
    }
    emit(state.copyWith(
      projectExists: projectExists,
      projectIsClean: projectIsClean,
      sources: {
        SourceEntity(
          name: 'time',
          exists: true,
          entities: [EntityEntity(name: 'time', exists: true)],
        )
      },
      entities: {
        EntityEntity(name: 'auth', exists: true),
      },
      screens: {
        ScreenEntity(name: 'splash', exists: true),
        ScreenEntity(name: 'home', exists: true)
      },
    ));
  }

  FutureOr<void> _organizationChange(
      OrganizationChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(organization: event.organization.hostCase()));
  }

  FutureOr<void> _flavorizeChange(_, Emitter<AppState> emit) async {
    emit(state.copyWith(flavorize: !state.flavorize));
  }

  FutureOr<void> _flavorsChange(
      FlavorsChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(flavors: event.flavors));
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
    emit(state.copyWith(generateSigningKey: !state.generateSigningKey));
  }

  FutureOr<void> _useSonarChange(_, Emitter<AppState> emit) async {
    emit(state.copyWith(useSonar: !state.useSonar));
  }

  FutureOr<void> _integrateDevicePreviewChange(
      _, Emitter<AppState> emit) async {
    emit(state.copyWith(integrateDevicePreview: !state.integrateDevicePreview));
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

    String genPass = '';

    if (state.generateSigningKey) {
      if (state.signingVars[6].isEmpty) {
        var chars =
            'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

        genPass = List.generate(20, (index) {
          return chars[(Random.secure().nextInt(chars.length))];
        }).join();
      } else {
        genPass = state.signingVars[6];
      }
    }

    if (!state.projectExists && state.projectName.isNotEmpty) {
      var configFile = await File('${state.projectPath}/config.json').create();

      var flavors = state.flavors
          .toLowerCase()
          .trim()
          .replaceAll(RegExp(' +'), ' ')
          .split(' ')
          .toSet();

      for (var flavor in flavors) {
        if (flavor.isEmpty || flavor == ' ') {
          flavors.remove(flavor);
        }
      }

      flavors
        ..remove('dev')
        ..remove('prod');

      await configFile.writeAsString(jsonEncode({
        'withUI': true,
        'signing_password': genPass,
        'project_name_dirt': state.projectName,
        'project_org': state.organization,
        'flavorizr': state.flavorize,
        'flavors': flavors.toList(),
        'navigation': state.router.name,
        'localization': state.localization.name,
        'use_keytool': state.generateSigningKey,
        'use_sonar': state.useSonar,
        'device_preview': state.integrateDevicePreview,
        'platforms': state.platforms.toString(),
        'theme_generate': state.theming.name == 'theme_tailor',
      }).toString());

      outputService.add('{#info}Getting mason & brick...');

      var mainProcess = await startProcess(workingDirectory: state.projectPath);

      mainProcess.stdin.writeln(
          //GitHub
          //  'mason add -g flutter_clean_base --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template --git-path flutter_clean_base');
          //GitLab
          'mason add -g flutter_clean_base --git-url git@gitlab.onix.ua:onix-systems/flutter-project-generator.git --git-path bricks/flutter_clean_base');

      mainProcess.stdin.writeln(
          'mason make flutter_clean_base -c config.json --on-conflict overwrite');

      var exitCode = await mainProcess.exitCode;
      configFile.delete();

      if (state.generateSigningKey) {
        outputService.add('{info}Keystore password: $genPass');

        var signingProcess = await startProcess(
            activateMason: false,
            workingDirectory:
                '${state.projectPath}/${state.projectName}/android/app/signing');

        signingProcess.stdin.writeln(
            'keytool -genkey -v -keystore upload-keystore.jks -alias upload -keyalg RSA -keysize 2048 -validity 10000 -keypass $genPass -storepass $genPass -dname "CN=${state.signingVars[0]}, OU=${state.signingVars[1]}, O=${state.signingVars[2]}, L=${state.signingVars[3]}, S=${state.signingVars[4]}, C=${state.signingVars[5]}"');

        var exitCode = await signingProcess.exitCode;
      }

      if (state.generateScreensWithProject && state.screens.isNotEmpty) {
        add(const ScreensGenerate());
      } else if (state.generateEntitiesWithProject &&
          state.entities.isNotEmpty) {
        add(const EntitiesGenerate());
      } else {
        Config.saveConfig(state);
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

  FutureOr<void> _projectChange(
      ProjectChange event, Emitter<AppState> emit) async {
    var path = event.projectPath.split('/');
    var projectName = path.last;
    var projectPath = path.sublist(0, path.length - 1).join('/');

    emit(state.copyWith(projectPath: projectPath, projectName: projectName));
  }

  FutureOr<void> _screenAdd(ScreenAdd event, Emitter<AppState> emit) async {
    var screens = state.screens.toList();
    if (state.screens
        .where((element) => element.name == event.screen.name)
        .isNotEmpty) {
      emit(state.copyWith(
          screenError: '${event.screen.name.pascalCase}Screen already exists'));
      return;
    }
    if (!state.generateScreensWithProject && state.projectExists) {
      try {
        File file = File(
            '${state.projectPath}/${state.projectName}/lib/core/router/app_router.dart');
        String content = await file.readAsString();

        if (content.contains('${event.screen.name.pascalCase}Screen')) {
          emit(state.copyWith(
              screenError:
                  '${event.screen.name.pascalCase}Screen already exists'));
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
    if (state.entities
        .where((element) => element.name == event.entity.name)
        .isNotEmpty) {
      emit(state.copyWith(
          entityError:
              'Entity ${event.entity.name.pascalCase} already exists'));
      return;
    } else {
      for (var source in state.sources) {
        for (var entity in source.entities) {
          if (entity.name == event.entity.name) {
            emit(state.copyWith(
                entityError:
                    'Entity ${event.entity.name.pascalCase} already exists in ${source.name.titleCase}Source'));
            return;
          }
        }
      }
    }

    if (event.source == null) {
      var entities = state.entities.toList();

      entities.add(event.entity);
      emit(state.copyWith(entities: entities.toSet()));
    } else {
      var entities = event.source?.entities.toList() ?? [];
      entities.add(event.entity);
      var sources = state.sources.toList();
      sources.firstWhere((source) => source == event.source).entities =
          entities;
      emit(state.copyWith(sources: sources.toSet()));
      add(const StateUpdate());
    }
  }

  FutureOr<void> _sourceAdd(SourceAdd event, Emitter<AppState> emit) async {
    if (state.sources
        .where((element) => element.name == event.source.name)
        .isNotEmpty) {
      emit(state.copyWith(
          entityError: '${event.source.name.pascalCase}Source already exists'));
      return;
    }

    var sources = state.sources.toList();

    sources.add(event.source);
    emit(state.copyWith(sources: sources.toSet()));
  }

  FutureOr<void> _screenDelete(
      ScreenDelete event, Emitter<AppState> emit) async {
    var screens = state.screens.toList();
    screens.remove(event.screen);
    emit(state.copyWith(screens: screens.toSet()));
  }

  FutureOr<void> _entityDelete(
      EntityDelete event, Emitter<AppState> emit) async {
    if (event.source == null) {
      var entities = state.entities.toList();
      entities.remove(event.entity);
      emit(state.copyWith(entities: entities.toSet()));
    } else {
      var entities = event.source?.entities.toList() ?? [];
      entities.remove(event.entity);
      var sources = state.sources.toList();
      sources.firstWhere((source) => source == event.source).entities =
          entities;
      emit(state.copyWith(sources: sources.toSet()));
      add(const StateUpdate());
    }
    add(const StateUpdate());
  }

  FutureOr<void> _sourceDelete(
      SourceDelete event, Emitter<AppState> emit) async {
    var sources = state.sources.toList();
    sources.remove(event.source);
    emit(state.copyWith(sources: sources.toSet()));
  }

  FutureOr<void> _stateUpdate(_, Emitter<AppState> emit) async {
    emit(state.copyWith(stateUpdate: DateTime.now().millisecondsSinceEpoch));
  }

  FutureOr<void> _screensGenerate(
      ScreensGenerate event, Emitter<AppState> emit) async {
    if (state.screens.where((element) => !element.exists).isNotEmpty) {
      emit(state.copyWith(generatingState: GeneratingState.generating));
      var mainProcess = await startProcess(
          workingDirectory: '${state.projectPath}/${state.projectName}');

      //GitHub
      //mainProcess.stdin.writeln(
      //    'mason add -g flutter_clean_screen --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template --git-path flutter_clean_screen');

      //GitLab
      mainProcess.stdin.writeln(
          'mason add -g flutter_clean_base --git-url git@gitlab.onix.ua:onix-systems/flutter-project-generator.git --git-path bricks/flutter_clean_screen');

      logger.d('Generating screens... ${state.screens}');

      for (var screen in state.screens.where((element) => !element.exists)) {
        logger.d('Generating screen ${screen.name}...');
        mainProcess.stdin.writeln(
            'mason make flutter_clean_screen --build ${screen == state.screens.last} --screen_name ${screen.name} --use_bloc ${screen.bloc} --on-conflict overwrite');
      }

      var exitCode = await mainProcess.exitCode;

      outputService.add('{#info}Screens generated!');
    }

    if (state.generateEntitiesWithProject && state.entities.isNotEmpty) {
      add(const EntitiesGenerate());
    } else {
      Config.saveConfig(state);
      emit(state.copyWith(
          generatingState: GeneratingState.waiting,
          screens: {},
          generateScreensWithProject: false));
    }
  }

  FutureOr<void> _entitiesGenerate(
      EntitiesGenerate event, Emitter<AppState> emit) async {
    var needToGenerateEntities =
        state.entities.where((entity) => !entity.exists).isNotEmpty;

    var needToGenerateSources =
        state.sources.where((source) => !source.exists).isNotEmpty;

    if (!needToGenerateSources) {
      for (var source in state.sources) {
        if (source.entities.where((entity) => !entity.exists).isNotEmpty) {
          needToGenerateSources = true;
          break;
        }
      }
    }

    if (needToGenerateEntities || needToGenerateSources) {
      emit(state.copyWith(generatingState: GeneratingState.generating));

      var mainProcess = await startProcess(
          workingDirectory: '${state.projectPath}/${state.projectName}');
      //GitHub
      // mainProcess.stdin.writeln(
      //     'mason add -g flutter_clean_entity --git-url https://github.com/OnixFlutterTeam/flutter_clean_mason_template --git-path flutter_clean_entity');

      //GitLab
      mainProcess.stdin.writeln(
          'mason add -g flutter_clean_base --git-url git@gitlab.onix.ua:onix-systems/flutter-project-generator.git --git-path bricks/flutter_clean_entity');
      if (needToGenerateEntities) {
        var entities = state.entities
            .where((entity) => !entity.exists)
            .map((e) => jsonEncode(e.toJson()))
            .join(', ');

        var build = !needToGenerateSources;

        mainProcess.stdin.writeln(
            'mason make flutter_clean_entity --build $build --entities \'$entities\' --source_name \'\' --source_exists false --repository_exists false --on-conflict overwrite');
      }

      if (needToGenerateSources) {
        for (var source in state.sources) {
          if (source.entities.where((entity) => !entity.exists).isEmpty) {
            continue;
          }

          var entities = source.entities
              .where((entity) => !entity.exists)
              .map((e) => jsonEncode(e.toJson()))
              .join(', ');

          mainProcess.stdin.writeln(
              'mason make flutter_clean_entity --build true --entities \'$entities\' --source_name ${source.name} --source_exists ${source.exists} --repository_exists ${source.entities.length > 1} --on-conflict overwrite');
        }
      }

      var exitCode = await mainProcess.exitCode;
      outputService.add('{#info}Entities generated!');
      outputService.add('{#info}Exit code: $exitCode');
    }

    Config.saveConfig(state);
    emit(state.copyWith(
        generatingState: GeneratingState.waiting,
        entities: {},
        sources: {},
        generateEntitiesWithProject: false));
  }

  FutureOr<void> _errorClear(_, Emitter<AppState> emit) async {
    emit(state.copyWith(screenError: ''));
  }

  FutureOr<void> _openProject(OpenProject event, Emitter<AppState> emit) async {
    var mainProcess = await startProcess(
        activateMason: false,
        workingDirectory: '${state.projectPath}/${state.projectName}');

    mainProcess.stdin.writeln(
        'open -a "Android Studio" "${state.projectPath}/${state.projectName}"');
  }

  Future<Process> startProcess(
      {required String workingDirectory, bool activateMason = true}) async {
    var mainProcess =
        await Process.start('zsh', [], workingDirectory: workingDirectory);

    mainProcess.log();
    mainProcess.stdin.writeln('source \$HOME/.zshrc');
    mainProcess.stdin.writeln('source \$HOME/.bash_profile');

    if (activateMason) {
      mainProcess.stdin.writeln('dart pub global activate mason_cli');
      mainProcess.stdin.writeln('mason cache clear');
    }

    return mainProcess;
  }
}

extension MyCase on String {
  String hostCase() {
    Iterable<String> strings = split('-');

    strings = strings.map((e) => e.dotCase);

    return strings.join('-');
  }
}
