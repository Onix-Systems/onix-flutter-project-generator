import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/screen_code_content.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:recase/recase.dart';

class ScreenGenerator
    implements BaseGenerationService<bool, ScreenGeneratorParams> {
  final _screenCodeContent = ScreenCodeContent();

  @override
  Future<bool> generate(ScreenGeneratorParams params) async {
    String screenName = params.screen.name.snakeCase;

    if (screenName.endsWith('_screen')) {
      screenName = screenName.substring(0, screenName.length - 7);
    }

    final screenPath =
        '${params.projectPath}/${params.projectName}/lib/presentation/screen/${screenName}_screen';
    await Directory(screenPath).create(recursive: true);

    if (params.screen.stateManager != ScreenStateManager.none) {
      await Directory('$screenPath/bloc').create(recursive: true);
    }

    ///Create screen files and BLoC files for a screen
    await _createFiles(params, screenPath);

    ///Add screen configuration to Navigation Router file
    await _createRoutes(params);

    if (params.screen.stateManager != ScreenStateManager.none) {
      ///Add DI configuration for state management
      await _createDI(params);
    }
    return true;
  }

  Future<void> _createRoutes(ScreenGeneratorParams params) async {
    final screenName = params.screen.name;
    if (params.router == ProjectRouter.goRouter) {
      final routesFile = File(
          '${params.projectPath}/${params.projectName}/lib/app/router/app_route.dart');
      String routesContent = routesFile.readAsStringSync();
      //Generate routes enum for GoRouter
      final appRoutesContent = _screenCodeContent.createScreenNavigationGoRoute(
        input: routesContent,
        screenName: screenName,
        isLastDeclaration: params.lastScreenItem,
      );
      routesFile.writeAsString(appRoutesContent);
    }

    final routerFile = File(
        '${params.projectPath}/${params.projectName}/lib/app/router/app_router.dart');
    String routerContent = routerFile.readAsStringSync();

    ///Create Navigator screen declarations
    final filledRouterContent =
        _screenCodeContent.createScreenNavigationContent(
      input: routerContent,
      screenName: screenName,
      projectName: params.projectName,
      isInitialScreen: params.screen.initial,
      router: params.router,
    );

    routerFile.writeAsString(filledRouterContent);
  }

  Future<void> _createDI(ScreenGeneratorParams params) async {
    var diFile = File(
        '${params.projectPath}/${params.projectName}/lib/core/di/bloc.dart');
    String screenName = params.screen.name.snakeCase;
    String content = await diFile.readAsString();
    final diOutputContent = _screenCodeContent.createScreenDIContent(
      input: content,
      screenName: screenName,
      projectName: params.projectName,
      stateManagement: params.screen.stateManager,
    );
    await diFile.writeAsString(diOutputContent);
  }

  Future<void> _createFiles(
    ScreenGeneratorParams params,
    String screenPath,
  ) async {
    final screenName = params.screen.name.snakeCase;
    final screenFile =
        await File('$screenPath/${screenName}_screen.dart').create();

    switch (params.screen.stateManager) {
      case ScreenStateManager.bloc || ScreenStateManager.cubit:

        ///Write screen file
        final screenContent = _screenCodeContent.createStateManagementScreen(
          isGoRouter: params.router == ProjectRouter.goRouter,
          screenName: screenName,
          projectName: params.projectName,
          stateManagement: params.screen.stateManager,
        );
        await screenFile.writeAsString(screenContent);

        ///Write BLoC imports file
        var importsFile =
            await File('$screenPath/bloc/${screenName}_screen_imports.dart')
                .create();
        final importsContent = _screenCodeContent.createBlocImportsContent(
          screenName: screenName,
          stateManagement: params.screen.stateManager,
        );
        await importsFile.writeAsString(importsContent);

        ///Write BLoC models file
        var modelsFile =
            await File('$screenPath/bloc/${screenName}_screen_models.dart')
                .create();
        final modelsContent = _screenCodeContent.createBlocModels(
          screenName: screenName,
          stateManagement: params.screen.stateManager,
        );
        await modelsFile.writeAsString(modelsContent);

        ///Write BLoC file
        var blocFile = await File(
                '$screenPath/bloc/${screenName}_screen_${params.screen.stateManager.name}.dart')
            .create();
        final blocFileContent = _screenCodeContent.createBlocContent(
          projectName: params.projectName,
          screenName: screenName,
          stateManagement: params.screen.stateManager,
        );
        await blocFile.writeAsString(blocFileContent);

        break;
      case ScreenStateManager.none:

        ///Write screen without state management
        final screenContent = _screenCodeContent.createNoStateManagementScreen(
          isGoRouter: params.router == ProjectRouter.goRouter,
          screenName: screenName,
        );
        await screenFile.writeAsString(screenContent);
        break;
    }
  }
}
