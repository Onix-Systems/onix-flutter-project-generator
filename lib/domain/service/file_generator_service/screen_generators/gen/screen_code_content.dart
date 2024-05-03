import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class ScreenCodeContent {
  final _navigatorConstsSuffix = '//{consts end}';
  final _navigatorGettersSuffix = '//{getters end}';
  final _navigatorRoutesSuffix = '//{routes end}';
  final _navigatorImportsSuffix = '//{imports end}';
  final _diBlocSuffix = '//{bloc end}';

  String createScreenDIContent({
    required String input,
    required String screenName,
    required String projectName,
    required ScreenStateManager stateManagement,
  }) {
    String output = input;
    output
        .replaceFirst(_navigatorImportsSuffix,
            'import \'package:$projectName/presentation/screen/${screenName}_screen/bloc/${screenName}_screen_${stateManagement.name}.dart\';$_navigatorImportsSuffix')
        .replaceFirst(_diBlocSuffix,
            'getIt.registerFactory<${screenName.pascalCase}Screen${stateManagement.name.pascalCase}>(${screenName.pascalCase}Screen${stateManagement.name.pascalCase}.new);$_diBlocSuffix');
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

    ///Declare initial route
    if (isInitialScreen) {
      output = output.replaceAll('static const _initialLocation = \'/\'',
          'static const _initialLocation = \'/$screenName\'');
    }
    if (router == ProjectRouter.goRouter) {
      output = output
          .replaceAll(_navigatorConstsSuffix,
              'static const _${screenName.camelCase} = \'/$screenName\';\n$_navigatorConstsSuffix')
          .replaceAll(_navigatorGettersSuffix,
              'static String get ${screenName.camelCase}Screen => \'${screenName.pascalCase}Screen\';\n$_navigatorGettersSuffix')
          .replaceAll(_navigatorRoutesSuffix,
              '${_buildGoRouteContent(screenName)}$_navigatorRoutesSuffix')
          .replaceAll(_navigatorImportsSuffix,
              'import \'package:$projectName/presentation/screen/${screenName}_screen/${screenName}_screen.dart\';\n$_navigatorImportsSuffix');
    } else {
      output
          .replaceAll(_navigatorRoutesSuffix,
              '${_buildAutoRouteContent(isInitialScreen, screenName)}//{routes end}')
          .replaceAll(_navigatorImportsSuffix,
              'import \'package:$projectName/presentation/screen/${screenName}_screen/${screenName}_screen.dart\';$_navigatorImportsSuffix');
    }

    return output;
  }

  String _buildGoRouteContent(String screenName) {
    final codeLines = List<String>.empty(growable: true);
    codeLines.add('GoRoute(');
    codeLines.add('path: _${screenName.camelCase},');
    codeLines.add('name: ${screenName.camelCase}Screen,');
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

  String createBlocImportsContent({
    required String screenName,
    required ScreenStateManager stateManagement,
  }) {
    final codeLines = List<String>.empty(growable: true);
    codeLines
        .add('export \'${screenName}_screen_${stateManagement.name}.dart\';');
    codeLines.add('export \'${screenName}_screen_models.dart\';');
    codeLines.addNewLine();
    return codeLines.join('\n');
  }

  String createBlocContent({
    required String projectName,
    required String screenName,
    required ScreenStateManager stateManagement,
  }) {
    ///Declare BLoC classes names
    final stateManagementSuffix = stateManagement.name.pascalCase;
    final className = '${screenName.pascalCase}Screen$stateManagementSuffix';
    final eventName = stateManagement == ScreenStateManager.bloc
        ? '${screenName.pascalCase}ScreenEvent'
        : '';
    final stateName = '${screenName.pascalCase}ScreenState';
    final srName = '${screenName.pascalCase}ScreenSR';
    final initFunctionName =
        stateManagement == ScreenStateManager.bloc ? '_onInit' : 'init';
    final codeLines = List<String>.empty(growable: true);

    ///Create BLoC class code
    codeLines.add('import \'dart:async\';');
    codeLines.addNewLine();
    codeLines.add(
        'import \'package:$projectName/core/arch/bloc/base_${stateManagement.name}.dart\';');
    codeLines.add('import \'package:flutter_bloc/flutter_bloc.dart\';');
    codeLines.add(
        'import \'package:$projectName/presentation/screen/${screenName}_screen/bloc/${screenName}_screen_imports.dart\';');
    codeLines.addNewLine();
    codeLines.add(
        'class $className extends Base$stateManagementSuffix<$eventName, $stateName, $srName> {');
    codeLines.add('$className() : super($stateName()) {');
    if (stateManagement == ScreenStateManager.bloc) {
      codeLines.add('on<${screenName.pascalCase}ScreenEventInit>(_onInit);');
      codeLines.add('add(const ${screenName.pascalCase}ScreenEvent.init());');
    }
    codeLines.add('}');
    codeLines.addNewLine();
    codeLines.add('FutureOr<void> $initFunctionName (');
    if (stateManagement == ScreenStateManager.bloc) {
      codeLines.add('${screenName.pascalCase}ScreenEventInit event,');
      codeLines.add('Emitter<${screenName.pascalCase}ScreenState> emit,');
    }
    codeLines.add(') {');
    if (stateManagement == ScreenStateManager.cubit) {
      codeLines.add('emit(state.copyWith(isLoading: false));');
    }
    codeLines.add('}');
    codeLines.addNewLine();
    codeLines.add('}');
    return codeLines.join('\n');
  }

  String creatBlocModels({
    required String screenName,
    required ScreenStateManager stateManagement,
  }) {
    final screenModelName = screenName.pascalCase;
    final codeLines = List<String>.empty(growable: true);
    codeLines
        .add('import \'package:freezed_annotation/freezed_annotation.dart\';');
    codeLines.addNewLine();
    codeLines.add('part \'${screenName}_screen_models.freezed.dart\';');

    ///If BLoC - add Event model
    if (stateManagement == ScreenStateManager.bloc) {
      codeLines.add('@freezed');
      codeLines.add(
          'class ${screenModelName}ScreenEvent with _\$${screenModelName}ScreenEvent {');
      codeLines.add(
          'const factory ${screenModelName}ScreenEvent.init() = ${screenModelName}ScreenEventInit;');
      codeLines.add('}');
    }
    codeLines.addNewLine();

    ///Add SR events
    codeLines.add('@freezed');
    codeLines.add(
        'class ${screenModelName}ScreenSR with _\$${screenModelName}ScreenSR {');
    codeLines.add(
        'const factory ${screenModelName}ScreenSR.loadFinished() = _LoadFinished;');
    codeLines.add('}');
    codeLines.addNewLine();

    ///Add BLoC State
    if (stateManagement == ScreenStateManager.bloc) {
      codeLines.add('class ${screenModelName}ScreenState {}');
    } else {
      codeLines.add('@freezed');
      codeLines.add(
          'class ${screenModelName}ScreenState with _\$${screenModelName}ScreenState{');
      codeLines.add('const factory ${screenModelName}ScreenState({');
      codeLines.add('@Default(true) bool isLoading,');
      codeLines.add('}) = _${screenName.pascalCase}ScreenState;');
      codeLines.add('}');
    }
    codeLines.addNewLine();
    return codeLines.join('\n');
  }

  String createNoStateManagementScreen({
    required bool isGoRouter,
    required String screenName,
  }) {
    final screenClassName = screenName.pascalCase;
    final codeLines = List<String>.empty(growable: true);

    ///Add imports
    if (isGoRouter) {
      codeLines.add('import \'package:go_router/go_router.dart\';');
    } else {
      codeLines.add('import \'package:auto_route/auto_route.dart\';');
    }
    codeLines.add('import \'package:flutter/material.dart\';');
    codeLines.addNewLine();

    ///Add annotation in AutoRoute navigation used
    if (!isGoRouter) {
      codeLines.add('@RoutePage()');
    }

    ///Add screen widget code
    codeLines.add('class ${screenClassName}Screen extends StatelessWidget {');
    codeLines
        .add('const ${screenClassName}Screen({Key? key}) : super(key: key);');
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

  String createStateManagementScreen({
    required bool isGoRouter,
    required String screenName,
    required String projectName,
    required ScreenStateManager stateManagement,
  }) {
    final screenClassName = screenName.pascalCase;
    final codeLines = List<String>.empty(growable: true);

    ///Add imports
    if (isGoRouter) {
      codeLines.add('import \'package:go_router/go_router.dart\';');
    } else {
      codeLines.add('import \'package:auto_route/auto_route.dart\';');
    }
    codeLines.add('import \'package:flutter/material.dart\';');
    codeLines.add(
        'import \'package:$projectName/presentation/screen/${screenName}_screen/bloc/${screenName}_screen_imports.dart\';');
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
    codeLines.add(
        'extends Base${stateManagement == ScreenStateManager.cubit ? 'Cubit' : ''}State<');
    codeLines.add('${screenClassName}ScreenState, ');
    codeLines
        .add('${screenClassName}Screen${stateManagement.name.pascalCase}, ');
    codeLines.add('${screenClassName}ScreenSR, ');
    codeLines.add('${screenClassName}Screen> {');
    codeLines.add('@override');
    codeLines.add('Widget buildWidget(BuildContext context) {');
    codeLines.add('return srObserver(');
    codeLines.add('context: context,');
    codeLines.add('child: Scaffold(');
    codeLines.add('body: SizedBox.expand(');
    codeLines.add('child: blocConsumer(');
    codeLines.add('stateListener: (state) => const Center(');
    codeLines.add('child: Text(\'$screenClassName screen\'),');
    codeLines.add('),');
    codeLines.add('listenDelegate: (context, state) {},');
    codeLines.add('),),),');
    codeLines.add('onSR: _onSingleResult,');
    codeLines.add(' );}');
    codeLines.addNewLine();

    ///Add SR callback handler
    codeLines.add(
        'void _onSingleResult(BuildContext context, ${screenClassName}ScreenSR singleResult) {');
    codeLines.add('singleResult.when(');
    codeLines.add('loadFinished: () {');
    codeLines.add('},);}');
    codeLines.addNewLine();
    codeLines.add('}');
    codeLines.addNewLine();
    return codeLines.join('\n');
  }
}
