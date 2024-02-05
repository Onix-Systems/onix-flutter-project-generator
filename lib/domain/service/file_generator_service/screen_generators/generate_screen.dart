import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/file_content.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';
import 'package:recase/recase.dart';

class GenerateScreen {
  Future<void> call({
    required String projectPath,
    required String projectName,
    required Screen screen,
    required ProjectRouter router,
    bool build = false,
  }) async {
    var routesFile =
        File('$projectPath/$projectName/lib/app/router/app_router.dart');
    var diFile = File('$projectPath/$projectName/lib/core/di/bloc.dart');

    String screenName = screen.name.snakeCase;

    if (screenName.endsWith('_screen')) {
      screenName = screenName.substring(0, screenName.length - 7);
    }

    final screenPath =
        '$projectPath/$projectName/lib/presentation/screen/${screenName}_screen';
    await Directory(screenPath).create(recursive: true);

    if (screen.stateManager != ScreenStateManager.none) {
      await Directory('$screenPath/bloc').create(recursive: true);
    }

    await _createFiles(
      screenName: screenName,
      screenPath: screenPath,
      projectName: projectName,
      stateManagement: screen.stateManager,
      router: router,
    );

    await _createRoutes(
        screenName: screenName,
        initial: screen.initial,
        router: router,
        routesFile: routesFile,
        projectName: projectName);

    if (screen.stateManager != ScreenStateManager.none) {
      await _createDI(
        projectName: projectName,
        screen: screen,
        diFile: diFile,
      );
    }
  }

  Future<void> _createRoutes({
    required String screenName,
    required ProjectRouter router,
    required File routesFile,
    required String projectName,
    required bool initial,
  }) async {
    String routesContent = routesFile.readAsStringSync();

    if (router == ProjectRouter.goRouter) {
      routesFile.writeAsString(routesContent.replaceAll(
          '''_initialLocation = '/''',
          initial
              ? '''_initialLocation = '/$screenName' '''
              : '''_initialLocation = '/''').replaceAll('//{consts end}',
          '''static const _${screenName.camelCase} = '/$screenName';
      //{consts end}''').replaceAll('//{getters end}',
          '''static String get ${screenName.camelCase}Screen => '${screenName.pascalCase}Screen';
      //{getters end}''').replaceAll('//{routes end}', '''GoRoute(
          path: _${screenName.camelCase},
          name: ${screenName.camelCase}Screen,
          builder: (context, state) =>
              const ${screenName.pascalCase}Screen(),
        ),
        //{routes end}''').replaceAll('//{imports end}',
          '''import 'package:$projectName/presentation/screen/${screenName}_screen/${screenName}_screen.dart';
//{imports end}'''));
    } else {
      routesFile.writeAsString(routesContent.replaceAll(
          '//{routes end}', '''AdaptiveRoute(
      page: ${screenName.pascalCase}Route.page,
      path: '/${screenName.camelCase}Screen',
      ${initial ? '' : 'initial: true'},
    ),
    //{routes end}''').replaceAll('//{imports end}',
          '''import 'package:$projectName/presentation/screen/${screenName}_screen/${screenName}_screen.dart';
//{imports end}'''));
    }
  }

  Future<void> _createDI({
    required String projectName,
    required Screen screen,
    required File diFile,
  }) async {
    String screenName = screen.name.snakeCase;
    String diContent = await diFile.readAsString();

    await diFile.writeAsString(diContent.replaceFirst('//{imports end}',
        '''import 'package:$projectName/presentation/screen/${screenName}_screen/bloc/${screenName}_screen_${screen.stateManager.name}.dart';
//{imports end}''').replaceFirst('//{bloc end}',
        '''getIt.registerFactory<${screenName.pascalCase}Screen${screen.stateManager.name.pascalCase}>(${screenName.pascalCase}Screen${screen.stateManager.name.pascalCase}.new);
//{bloc end}'''));
  }

  Future<void> _createFiles({
    required String screenName,
    required ScreenStateManager stateManagement,
    required String projectName,
    required String screenPath,
    required ProjectRouter router,
  }) async {
    var screenFile =
        await File('$screenPath/${screenName}_screen.dart').create();

    switch (stateManagement) {
      case ScreenStateManager.bloc || ScreenStateManager.cubit:
        await screenFile.writeAsString(FileContent.screenBloc(
          isGoRouter: router == ProjectRouter.goRouter,
          screenName: screenName,
          projectName: projectName,
          stateManagement: stateManagement,
        ));
        var importsFile =
            await File('$screenPath/bloc/${screenName}_screen_imports.dart')
                .create();

        importsFile.writeAsString('''
export '${screenName}_screen_${stateManagement.name}.dart';
export '${screenName}_screen_models.dart';
    ''');

        var modelsFile =
            await File('$screenPath/bloc/${screenName}_screen_models.dart')
                .create();

        await modelsFile.writeAsString(FileContent.models(
            screenName: screenName, stateManagement: stateManagement));

        var blocFile = await File(
                '$screenPath/bloc/${screenName}_screen_${stateManagement.name}.dart')
            .create();

        await blocFile.writeAsString(FileContent.bloc(
            projectName: projectName,
            screenName: screenName,
            stateManagement: stateManagement));
        break;
      case ScreenStateManager.none:
        await screenFile.writeAsString(FileContent.screenNoBloc(
          isGoRouter: router == ProjectRouter.goRouter,
          screenName: screenName,
        ));
        break;
    }
  }
}
