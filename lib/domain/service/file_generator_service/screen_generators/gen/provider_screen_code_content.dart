import 'package:onix_flutter_bricks/domain/entity/state_management/state_managemet_variant.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class ProviderScreenCodeContent {
  final _routesDeclarationSuffix = '//{routes declaration end}';
  final _navigatorRoutesSuffix = '//{routes end}';
  final _navigatorImportsSuffix = '//{imports end}';
  final _diProviderSuffix = '//{provider end}';

  String createScreenDIContent({
    required String input,
    required String screenName,
    required String projectName,
  }) {
    String output = input;
    output = output
        .replaceFirst(_navigatorImportsSuffix,
            'import \'package:$projectName/presentation/screen/${screenName}_screen/provider/${screenName}_screen_provider.dart\';\n$_navigatorImportsSuffix')
        .replaceFirst(_diProviderSuffix,
            'getIt.registerFactory<${screenName.pascalCase}ScreenProvider>(${screenName.pascalCase}ScreenProvider.new);\n$_diProviderSuffix');
    return output;
  }

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

  String createProviderImportsContent({
    required String screenName,
    required StateManagementVariant stateManagement,
  }) {
    final screenClassImport = screenName.snakeCase;
    final codeLines = List<String>.empty(growable: true);
    codeLines.add('export \'${screenClassImport}_screen_provider.dart\';');
    codeLines.add('export \'${screenClassImport}_screen_state.dart\';');
    codeLines.addNewLine();
    return codeLines.join('\n');
  }

  String createProviderContent({
    required String projectName,
    required String screenName,
  }) {
    ///Declare Provider classes names
    final stateManagementSuffix = const ProviderStateManagementVariant().name;
    final screenClassImport = screenName.snakeCase;
    final screenModelName = screenName.pascalCase;
    final className = '${screenName.pascalCase}Screen$stateManagementSuffix';

    final stateName = '${screenName.pascalCase}ScreenState';

    final codeLines = List<String>.empty(growable: true);

    ///Create Provider class code
    codeLines.add('import \'dart:async\';');
    codeLines.addNewLine();
    codeLines.add(
        'import \'package:$projectName/core/arch/provider/base_provider.dart\';');

    codeLines.add(
        'import \'package:$projectName/presentation/screen/${screenClassImport}_screen/provider/${screenClassImport}_screen_state.dart\';');
    codeLines.addNewLine();
    codeLines.add('class $className extends BaseProvider<$stateName> {');

    codeLines.add(
        '${screenModelName}ScreenProvider() : super(const ${screenModelName}ScreenState()) {');
    codeLines.add('init();');
    codeLines.add('}');
    codeLines.addNewLine();
    codeLines.add('void init() {');
    codeLines.add('// Add your initialization code here');
    codeLines.add('notifyListeners();');
    codeLines.add('}');
    codeLines.add('}');
    codeLines.addNewLine();

    return codeLines.join('\n');
  }

  String createProviderState({
    required String screenName,
    required String projectName,
  }) {
    final screenModelName = screenName.pascalCase;
    final screenClassImport = screenName.snakeCase;
    final codeLines = List<String>.empty(growable: true);
    codeLines
        .add('import \'package:freezed_annotation/freezed_annotation.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/provider/base_provider.dart\';');

    codeLines.addNewLine();
    codeLines.add('part \'${screenClassImport}_screen_state.freezed.dart\';');

    ///Add Provider State

    codeLines.add('@freezed');
    codeLines.add(
        'class ${screenModelName}ScreenState with _\$${screenModelName}ScreenState implements ProviderState {');
    codeLines.add('const factory ${screenModelName}ScreenState({');
    codeLines.add('@Default(true) bool isLoading,');
    codeLines.add('}) = _${screenName.pascalCase}ScreenState;');
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

  String createProviderScreen({
    required bool isGoRouter,
    required String screenName,
    required String projectName,
  }) {
    final screenClassName = screenName.pascalCase;
    final screenClassImport = screenName.snakeCase;
    final codeLines = List<String>.empty(growable: true);

    ///Add imports
    codeLines.add('import \'package:flutter/material.dart\';');
    if (!isGoRouter) {
      codeLines.add('import \'package:auto_route/annotations.dart\';');
    }

    codeLines.add(
        'import \'package:$projectName/core/arch/provider/base_provider_state.dart\';');

    codeLines.add(
        'import \'package:$projectName/presentation/screen/${screenClassImport}_screen/provider/${screenClassImport}_screen_imports.dart\';');
    codeLines.addNewLine();

    ///Add annotation in AutoRoute navigation used
    if (!isGoRouter) {
      codeLines.add('@RoutePage()');
    }

    ///Add screen widget code
    codeLines.add('class ${screenClassName}Screen extends StatefulWidget {');
    codeLines.add('const ${screenClassName}Screen({');
    codeLines.add('super.key,');
    codeLines.add('});');
    codeLines.addNewLine();
    codeLines.add('@override');
    codeLines.add(
        'State<${screenClassName}Screen> createState() => _${screenClassName}ScreenState();');
    codeLines.add('}');
    codeLines.addNewLine();

    ///Add screen widget state code
    codeLines.add('class _${screenClassName}ScreenState');
    codeLines.add('extends BaseProviderState<');
    codeLines.add('${screenClassName}ScreenProvider, ');
    codeLines.add('${screenClassName}ScreenState, ');
    codeLines.add('${screenClassName}Screen> {');
    codeLines.add('@override');
    codeLines.add('Widget buildWidget(BuildContext context) {');
    codeLines.add('return Scaffold(');
    codeLines.add('body: SizedBox.expand(');
    codeLines.add('child: providerConsumer(');
    codeLines.add('stateListener: (state) => const Center(');
    codeLines.add('child: Text(\'$screenClassName screen\'),');
    codeLines.add('),');
    codeLines.add('),),);}}');
    codeLines.addNewLine();

    return codeLines.join('\n');
  }
}
