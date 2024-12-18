import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/mixins/view_model_content_mixin.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/mvvm_screen_code_content.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';

class MvvmScreenGenerator extends ScreenGenerationService
    with ViewModelContentMixin {
  final _screenCodeContent = MvvmScreenCodeContent();

  @override
  Future<bool> generate(ScreenGeneratorParams params) async {
    final screenName = params.normalizedScreenName;

    final screenPath =
        '${params.projectRootPath}/lib/presentation/screen/${screenName}_screen';
    await Directory(screenPath).create(recursive: true);

    ///Create screen files and BLoC files for a screen
    await _createFiles(params, screenPath);

    ///Add screen configuration to Navigation Router file
    await _createRoutes(params);

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

    var screenContent = '';

    screenContent = _screenCodeContent.createScreen(
      params: params,
    );

    if (screenContent.isEmpty) {
      return;
    }

    await screenFile.writeAsString(screenContent);

    ///Write ViewModel file
    final viewModelFile = await File(
      '$screenPath/view_model/${screenName}_view_model.dart',
    ).create(recursive: true);
    final viewModelFileContent = createViewModelContent(
      projectName: params.projectName,
      screenName: screenName,
      stateManagement: params.screen.stateVariant,
    );
    await viewModelFile.writeAsString(viewModelFileContent);

    ///Write ViewModel model file
    final viewModelModelFile = await File(
      '$screenPath/view_model/${screenName}_model.dart',
    ).create(recursive: true);
    final viewModelModelFileContent = createViewModelModelContent(
      screenName: screenName,
    );
    await viewModelModelFile.writeAsString(viewModelModelFileContent);
  }
}
