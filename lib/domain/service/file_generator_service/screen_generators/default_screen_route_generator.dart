import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/default_screen_route_generator_params.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';

class DefaultScreenRouteGenerator
    implements BaseGenerationService<bool, DefaultScreenRouteGeneratorParams> {
  @override
  Future<bool> generate(DefaultScreenRouteGeneratorParams params) async {
    ///Add default configuration to Navigation Router file
    await _createDefaultRoute(params);

    return true;
  }

  Future<void> _createDefaultRoute(
      DefaultScreenRouteGeneratorParams params) async {
    if (params.router == ProjectRouter.goRouter) {
      final routesFile = File(
          '${params.projectPath}/${params.projectName}/lib/app/router/app_route.dart');
      String routesContent = routesFile.readAsStringSync();
      //Generate routes enum for GoRouter
      final appRoutesContent = routesContent.replaceAll(
          '//{routes declaration end}',
          'root(\'/\');\n//{routes declaration end}');
      routesFile.writeAsString(appRoutesContent);
    }
  }
}
