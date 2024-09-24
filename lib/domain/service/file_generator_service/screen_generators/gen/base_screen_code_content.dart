import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class BaseScreenCodeContent {
  final _routesDeclarationSuffix = '//{routes declaration end}';
  final _navigatorRoutesSuffix = '//{routes end}';
  final _navigatorImportsSuffix = '//{imports end}';

  String createScreenNavigationGoRoute({
    required String input,
    required String screenName,
    required bool isLastDeclaration,
  }) {
    String output = input;
    final coda = isLastDeclaration ? ';' : ',';
    output = output.replaceAll(_routesDeclarationSuffix,
        '${screenName.camelCase}(\'/${screenName.snakeCase}\')$coda\n$_routesDeclarationSuffix');
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
              _navigatorRoutesSuffix, '$goRouteContent$_navigatorRoutesSuffix')
          .replaceAll(_navigatorImportsSuffix,
              'import \'package:$projectName/presentation/screen/${screenClassImport}_screen/${screenClassImport}_screen.dart\';\n$_navigatorImportsSuffix');
    } else {
      final autoRouteContent = _buildAutoRouteContent(
        isInitialScreen,
        screenName,
      );
      output = output
          .replaceAll(_navigatorRoutesSuffix,
              '$autoRouteContent\n$_navigatorRoutesSuffix')
          .replaceAll(_navigatorImportsSuffix,
              'import \'package:$projectName/presentation/screen/${screenClassImport}_screen/${screenClassImport}_screen.dart\';$_navigatorImportsSuffix');
    }

    return output;
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

  String createStatefulScreen({
    required bool isGoRouter,
    required String screenName,
  }) {
    final screenClassName = screenName.pascalCase;
    final codeLines = List<String>.empty(growable: true);

    ///Add imports
    if (isGoRouter) {
      codeLines.add('import \'package:go_router/go_router.dart\';');
    } else {
      codeLines.add('import \'package:auto_route/annotations.dart\';');
    }
    codeLines.add('import \'package:flutter/material.dart\';');
    codeLines.addNewLine();

    ///Add annotation in AutoRoute navigation used
    if (!isGoRouter) {
      codeLines.add('@RoutePage()');
    }

    ///Add screen widget code
    codeLines.add('class ${screenClassName}Screen extends StatefulWidget {');
    codeLines.add('const ${screenClassName}Screen({super.key});');
    codeLines.addNewLine();
    codeLines.add('@override');
    codeLines.add(
        'State<${screenClassName}Screen> createState() => _${screenClassName}State();');
    codeLines.add('}');
    codeLines.add(
        'class _${screenClassName}State extends State<${screenClassName}Screen> {');
    codeLines.add('@override');
    codeLines.add('Widget build(BuildContext context) {');
    codeLines.add('return const Scaffold(');
    codeLines.add('body: Center(child: Text(\'$screenClassName screen\'),),');
    codeLines.add(');');
    codeLines.add('}');
    codeLines.add('}');
    codeLines.addNewLine();

    return codeLines.join('\n');
  }

  String createStatelessScreen({
    required bool isGoRouter,
    required String screenName,
  }) {
    final screenClassName = screenName.pascalCase;
    final codeLines = List<String>.empty(growable: true);

    ///Add imports
    if (isGoRouter) {
      codeLines.add('import \'package:go_router/go_router.dart\';');
    } else {
      codeLines.add('import \'package:auto_route/annotations.dart\';');
    }
    codeLines.add('import \'package:flutter/material.dart\';');
    codeLines.addNewLine();

    ///Add annotation in AutoRoute navigation used
    if (!isGoRouter) {
      codeLines.add('@RoutePage()');
    }

    ///Add screen widget code
    codeLines.add('class ${screenClassName}Screen extends StatelessWidget {');
    codeLines.add('const ${screenClassName}Screen({super.key});');
    codeLines.addNewLine();
    codeLines.add('@override');
    codeLines.add('Widget build(BuildContext context) {');
    codeLines.add('return const Scaffold(');
    codeLines.add('body: Center(child: Text(\'$screenClassName screen\'),),');
    codeLines.add(');');
    codeLines.add('}');
    codeLines.add('}');
    codeLines.addNewLine();

    return codeLines.join('\n');
  }
}
