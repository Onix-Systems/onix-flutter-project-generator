import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/bloc_screen_code_content.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/mixins/bloc_content_mixin.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/mixins/di_content_mixin.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';

class BlocScreenGenerator extends ScreenGenerationService
    with DIContentMixin, BlocContentMixin {
  final _screenCodeContent = BlocScreenCodeContent();

  @override
  Future<bool> generate(ScreenGeneratorParams params) async {
    final screenName = params.normalizedScreenName;

    final screenPath =
        '${params.projectRootPath}/lib/presentation/screen/${screenName}_screen';
    await Directory(screenPath).create(recursive: true);

    if (params.screen.stateVariant is! StatelessStateManagementVariant) {
      await Directory('$screenPath/bloc').create(recursive: true);
    }

    ///Create screen files and BLoC files for a screen
    await _createFiles(params, screenPath);

    ///Add screen configuration to Navigation Router file
    await _createRoutes(params);

    if (params.screen.stateVariant is! StatelessStateManagementVariant &&
        params.screen.stateVariant is! StatefulStateManagementVariant) {
      ///Add DI configuration for state management
      await createScreenDIContent(params: params);
    }
    return true;
  }

  Future<void> _createRoutes(ScreenGeneratorParams params) async {
    final screenName = params.normalizedScreenName;
    if (params.router == ProjectRouter.goRouter) {
      final routesFile =
          File('${params.projectRootPath}/lib/app/router/app_route.dart');
      final routesContent = routesFile.readAsStringSync();
      //Generate routes enum for GoRouter
      final appRoutesContent = _screenCodeContent.createScreenNavigationGoRoute(
        input: routesContent,
        screenName: screenName,
        isLastDeclaration: params.lastScreenItem,
      );
      await routesFile.writeAsString(appRoutesContent);
    }

    final routerFile =
        File('${params.projectRootPath}/lib/app/router/app_router.dart');
    final routerContent = routerFile.readAsStringSync();

    ///Create Navigator screen declarations
    final filledRouterContent =
        _screenCodeContent.createScreenNavigationContent(
      input: routerContent,
      screenName: screenName,
      projectName: params.projectName,
      isInitialScreen: params.screen.initial,
      router: params.router,
    );

    await routerFile.writeAsString(filledRouterContent);
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
      params: params,
    );
    await screenFile.writeAsString(screenContent);

    ///Write BLoC imports file
    final importsFile =
        await File('$screenPath/bloc/${screenName}_screen_imports.dart')
            .create();
    final importsContent = createBlocImportsContent(
      screenName: screenName,
      stateManagement: params.screen.stateVariant,
    );
    await importsFile.writeAsString(importsContent);

    ///Write BLoC models file
    final modelsFile =
        await File('$screenPath/bloc/${screenName}_screen_models.dart')
            .create();
    final modelsContent = createBlocModels(
      screenName: screenName,
      stateManagement: params.screen.stateVariant,
    );
    await modelsFile.writeAsString(modelsContent);

    ///Write BLoC file
    final blocFile = await File(
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
