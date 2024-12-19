import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:recase/recase.dart';

abstract class ScreenCodeContent {
  final routesDeclarationSuffix = '//{routes declaration end}';
  final navigatorRoutesSuffix = '//{routes end}';
  final navigatorImportsSuffix = '//{imports end}';

  String createScreenNavigationGoRoute({
    required String input,
    required String screenName,
    required bool isLastDeclaration,
  }) {
    final output = input.replaceFirst(
        ';\n$routesDeclarationSuffix', ',\n$routesDeclarationSuffix');
    final coda = isLastDeclaration ? ';' : ',';

    return output.replaceAll(
      routesDeclarationSuffix,
      "${screenName.camelCase}('/${screenName.snakeCase}')$coda\n$routesDeclarationSuffix",
    );
  }

  String createScreenNavigationContent({
    required String input,
    required String screenName,
    required String projectName,
    required bool isInitialScreen,
    required ProjectRouter router,
  }) {
    var output = input;
    final screenClassImport = screenName.snakeCase;

    ///Declare initial route
    if (isInitialScreen) {
      output = output.replaceAll(
        "static const _initialLocation = '/'",
        "static const _initialLocation = '/${screenName.snakeCase}'",
      );
    }
    if (router == ProjectRouter.goRouter) {
      final goRouteContent = _buildGoRouteContent(screenName);
      output = output
          .replaceAll(
              navigatorRoutesSuffix, '$goRouteContent$navigatorRoutesSuffix')
          .replaceAll(
            navigatorImportsSuffix,
            "import 'package:$projectName/presentation/screen/${screenClassImport}_screen/${screenClassImport}_screen.dart';\n$navigatorImportsSuffix",
          );
    } else {
      final autoRouteContent = _buildAutoRouteContent(
        isInitialScreen,
        screenName,
      );
      output = output
          .replaceAll(navigatorRoutesSuffix,
              '$autoRouteContent\n$navigatorRoutesSuffix')
          .replaceAll(
            navigatorImportsSuffix,
            "import 'package:$projectName/presentation/screen/${screenClassImport}_screen/${screenClassImport}_screen.dart';$navigatorImportsSuffix",
          );
    }

    return output;
  }

  String _buildAutoRouteContent(
    bool isInitialScreen,
    String screenName,
  ) {
    final codeLines = List<String>.empty(growable: true)
      ..add('AdaptiveRoute(')
      ..add('page: ${screenName.pascalCase}Route.page,')
      ..add("path: '/${screenName.camelCase}Screen',")
      ..add(isInitialScreen ? 'initial: true,' : '')
      ..add('),');
    return codeLines.join('\n');
  }

  String _buildGoRouteContent(String screenName) {
    final codeLines = List<String>.empty(growable: true)
      ..add('GoRoute(')
      ..add('path: AppRoute.${screenName.camelCase}.routePath,')
      ..add('name: AppRoute.${screenName.camelCase}.name,')
      ..add('builder: (context, state) =>')
      ..add('const ${screenName.pascalCase}Screen(),')
      ..add(' ),');
    return codeLines.join('\n');
  }

  String createScreen({
    required ScreenGeneratorParams params,
  });
}
