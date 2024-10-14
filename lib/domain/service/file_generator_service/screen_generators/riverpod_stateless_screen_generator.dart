import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/mixins/di_content_mixin.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/mixins/riverpod_content_mixin.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/riverpod_stateless_screen_code_content.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';

class RiverpodStatelessScreenGenerator extends ScreenGenerationService
    with DIContentMixin, RiverpodContentMixin {
  final _screenCodeContent = RiverpodStatelessScreenCodeContent();

  @override
  Future<bool> generate(ScreenGeneratorParams params) async {
    final screenName = params.normalizedScreenName;

    final screenPath =
        '${params.projectPath}/${params.projectName}/lib/presentation/screen/${screenName}_screen';
    await Directory(screenPath).create(recursive: true);

    ///Create screen files and Riverpod files for a screen
    await _createFiles(params, screenPath);

    ///Add screen configuration to Navigation Router file
    await _createRoutes(params);

    if (params.screen.stateVariant != const StatelessStateManagementVariant() &&
        params.screen.stateVariant != const StatefulStateManagementVariant()) {
      ///Add DI configuration for state management
      await createScreenDIContent(params: params);
    }

    return true;
  }

  Future<void> _createRoutes(ScreenGeneratorParams params) async {
    final screenName = params.normalizedScreenName;
    if (params.router == ProjectRouter.goRouter) {
      final routesFile = File(
        '${params.projectPath}/${params.projectName}/lib/app/router/app_route.dart',
      );
      final routesContent = routesFile.readAsStringSync();
      //Generate routes enum for GoRouter
      final appRoutesContent = _screenCodeContent.createScreenNavigationGoRoute(
        input: routesContent,
        screenName: screenName,
        isLastDeclaration: params.lastScreenItem,
      );
      await routesFile.writeAsString(appRoutesContent);
    }

    final routerFile = File(
      '${params.projectPath}/${params.projectName}/lib/app/router/app_router.dart',
    );
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

    final screenContent = _screenCodeContent.createScreen(
      isGoRouter: params.router == ProjectRouter.goRouter,
      screenName: screenName,
      projectName: params.projectName,
    );

    if (screenContent.isEmpty) {
      return;
    }

    await screenFile.writeAsString(screenContent);

    ///Write Riverpod imports file
    final importsFile =
        await File('$screenPath/riverpod/${screenName}_screen_imports.dart')
            .create(recursive: true);
    final importsContent = createRiverpodImportsContent(
      screenName: screenName,
      stateManagement: params.screen.stateVariant,
    );
    await importsFile.writeAsString(importsContent);

    ///Write Riverpod state file
    final modelsFile =
        await File('$screenPath/riverpod/${screenName}_screen_state.dart')
            .create();
    final modelsContent = createRiverpodState(
      screenName: screenName,
      stateManagement: params.screen.stateVariant,
    );
    await modelsFile.writeAsString(modelsContent);

    ///Write Riverpod file
    final blocFile = await File(
      '$screenPath/riverpod/${screenName}_screen_provider.dart',
    ).create();
    final blocFileContent = createRiverpodContent(
      projectName: params.projectName,
      screenName: screenName,
      stateManagement: params.screen.stateVariant,
    );
    await blocFile.writeAsString(blocFileContent);
  }
}
