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
    String output = input;
    final coda = isLastDeclaration ? ';' : ',';
    output = output.replaceAll(routesDeclarationSuffix,
        '${screenName.camelCase}(\'/${screenName.snakeCase}\')$coda\n$routesDeclarationSuffix');
    return output;
  }

  String createScreenNavigationContent({
    required String input,
    required String screenName,
    required String projectName,
    required bool isInitialScreen,
    required ProjectRouter router,
  }) {
    String output = input;
    final screenClassImport = screenName.snakeCase;

    ///Declare initial route
    if (isInitialScreen) {
      output = output.replaceAll('static const _initialLocation = \'/\'',
          'static const _initialLocation = \'/${screenName.snakeCase}\'');
    }
    if (router == ProjectRouter.goRouter) {
      final goRouteContent = _buildGoRouteContent(screenName);
      output = output
          .replaceAll(
              navigatorRoutesSuffix, '$goRouteContent$navigatorRoutesSuffix')
          .replaceAll(navigatorImportsSuffix,
              'import \'package:$projectName/presentation/screen/${screenClassImport}_screen/${screenClassImport}_screen.dart\';\n$navigatorImportsSuffix');
    } else {
      final autoRouteContent = _buildAutoRouteContent(
        isInitialScreen,
        screenName,
      );
      output = output
          .replaceAll(navigatorRoutesSuffix,
              '$autoRouteContent\n$navigatorRoutesSuffix')
          .replaceAll(navigatorImportsSuffix,
              'import \'package:$projectName/presentation/screen/${screenClassImport}_screen/${screenClassImport}_screen.dart\';$navigatorImportsSuffix');
    }

    return output;
  }

  String _buildAutoRouteContent(
    bool isInitialScreen,
    String screenName,
  ) {
    final codeLines = List<String>.empty(growable: true);
    codeLines.add('AdaptiveRoute(');
    codeLines.add('page: ${screenName.pascalCase}Route.page,');
    codeLines.add('path: \'/${screenName.camelCase}Screen\',');
    codeLines.add(isInitialScreen ? 'initial: true,' : '');
    codeLines.add('),');
    return codeLines.join('\n');
  }

  String _buildGoRouteContent(String screenName) {
    final codeLines = List<String>.empty(growable: true);
    codeLines.add('GoRoute(');
    codeLines.add('path: AppRoute.${screenName.camelCase}.routePath,');
    codeLines.add('name: AppRoute.${screenName.camelCase}.name,');
    codeLines.add('builder: (context, state) =>');
    codeLines.add('const ${screenName.pascalCase}Screen(),');
    codeLines.add(' ),');
    return codeLines.join('\n');
  }

  String createScreen({
    required bool isGoRouter,
    required String screenName,
    required String projectName,
  });
}
