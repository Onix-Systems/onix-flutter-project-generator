import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/bloc_screen_code_content.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/mixins/bloc_content_mixin.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/mixins/di_content_mixin.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';

class BlocScreenGenerator extends ScreenGenerationService
    with DIContentMixin, BlocContentMixin {
  final _screenCodeContent = BlocScreenCodeContent();

  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! ScreenGeneratorParams) {
      return false;
    }

    final screenName = params.normalizedScreenName;

    final screenPath =
        '${params.projectPath}/${params.projectName}/lib/presentation/screen/${screenName}_screen';
    await Directory(screenPath).create(recursive: true);

    if (params.screen.stateVariant != const StatelessStateManagementVariant()) {
      await Directory('$screenPath/bloc').create(recursive: true);
    }

    ///Create screen files and BLoC files for a screen
    await _createFiles(params, screenPath);

    ///Add screen configuration to Navigation Router file
    await _createRoutes(params);

    if (params.screen.stateVariant != const StatelessStateManagementVariant()) {
      ///Add DI configuration for state management
      await _createDI(params);
    }
    return true;
  }

  Future<void> _createRoutes(ScreenGeneratorParams params) async {
    final screenName = params.normalizedScreenName;
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
    final screenName = params.normalizedScreenName;
    String content = await diFile.readAsString();
    final diOutputContent = createScreenDIContent(
      input: content,
      screenName: screenName,
      projectName: params.projectName,
      stateManagement: params.screen.stateVariant,
    );
    await diFile.writeAsString(diOutputContent);
  }

  Future<void> _createFiles(
    ScreenGeneratorParams params,
    String screenPath,
  ) async {
    final screenName = params.normalizedScreenName;
    final screenFile =
        await File('$screenPath/${screenName}_screen.dart').create();

    ///Write screen file
    final screenContent = _screenCodeContent.createScreen(
      isGoRouter: params.router == ProjectRouter.goRouter,
      screenName: screenName,
      projectName: params.projectName,
    );
    await screenFile.writeAsString(screenContent);

    ///Write BLoC imports file
    var importsFile =
        await File('$screenPath/bloc/${screenName}_screen_imports.dart')
            .create();
    final importsContent = createBlocImportsContent(
      screenName: screenName,
      stateManagement: params.screen.stateVariant,
    );
    await importsFile.writeAsString(importsContent);

    ///Write BLoC models file
    var modelsFile =
        await File('$screenPath/bloc/${screenName}_screen_models.dart')
            .create();
    final modelsContent = createBlocModels(
      screenName: screenName,
      stateManagement: params.screen.stateVariant,
    );
    await modelsFile.writeAsString(modelsContent);

    ///Write BLoC file
    var blocFile = await File(
            '$screenPath/bloc/${screenName}_screen_${params.screen.stateVariant.name.toLowerCase()}.dart')
        .create();
    final blocFileContent = createBlocContent(
      projectName: params.projectName,
      screenName: screenName,
      stateManagement: params.screen.stateVariant,
    );
    await blocFile.writeAsString(blocFileContent);
  }
}
