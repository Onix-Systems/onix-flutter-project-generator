import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

mixin BlocContentMixin on ScreenGenerationService {
  String createBlocImportsContent({
    required String screenName,
    required StateManagementVariant stateManagement,
  }) {
    final screenClassImport = screenName.snakeCase;
    final codeLines = List<String>.empty(growable: true)
      ..add(
        'export \'${screenClassImport}_screen_${stateManagement.name.toLowerCase()}.dart\';',
      )
      ..add('export \'${screenClassImport}_screen_models.dart\';')
      ..addNewLine();
    return codeLines.join('\n');
  }

  String createBlocContent({
    required String projectName,
    required String screenName,
    required StateManagementVariant stateManagement,
  }) {
    ///Declare BLoC classes names
    final stateManagementSuffix = stateManagement.name;
    final screenClassImport = screenName.snakeCase;
    final className = '${screenName.pascalCase}Screen$stateManagementSuffix';
    final eventName = stateManagement == const BlocStateManagementVariant()
        ? '${screenName.pascalCase}ScreenEvent, '
        : '';
    final stateName = '${screenName.pascalCase}ScreenState';
    final srName = '${screenName.pascalCase}ScreenSR';
    final initFunctionName =
        stateManagement == const BlocStateManagementVariant()
            ? '_onInit'
            : 'init';
    final codeLines = List<String>.empty(growable: true)

      ///Create BLoC class code
      ..add('import \'dart:async\';')
      ..addNewLine()
      ..add("import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';");
    if (stateManagement == const BlocStateManagementVariant()) {
      codeLines.add('import \'package:flutter_bloc/flutter_bloc.dart\';');
    }
    codeLines
      ..add(
        'import \'package:$projectName/presentation/screen/${screenClassImport}_screen/bloc/${screenClassImport}_screen_imports.dart\';',
      )
      ..addNewLine()
      ..add(
          'class $className extends Base$stateManagementSuffix<$eventName$stateName, $srName> {');

    final defaultStatePrefix =
        stateManagement == const BlocStateManagementVariant() ? '' : 'const ';
    final constructorSuffix =
        stateManagement == const BlocStateManagementVariant() ? ' {' : ';';
    codeLines.add(
        '$className() : super($defaultStatePrefix$stateName())$constructorSuffix');
    if (stateManagement == const BlocStateManagementVariant()) {
      codeLines
        ..add('on<${screenName.pascalCase}ScreenEventInit>(_onInit);')
        ..add('add(const ${screenName.pascalCase}ScreenEvent.init());')
        ..add('}');
    }
    codeLines
      ..addNewLine()
      ..addNewLine()
      ..add('void $initFunctionName (');
    if (stateManagement == const BlocStateManagementVariant()) {
      codeLines
        ..add('${screenName.pascalCase}ScreenEventInit event,')
        ..add('Emitter<${screenName.pascalCase}ScreenState> emit,');
    }
    codeLines.add(') {');
    if (stateManagement == const CubitStateManagementVariant()) {
      codeLines.add('emit(state.copyWith(isLoading: false));');
    }
    codeLines
      ..add('}')
      ..addNewLine()
      ..add('}');
    return codeLines.join('\n');
  }

  String createBlocModels({
    required String screenName,
    required StateManagementVariant stateManagement,
  }) {
    final screenModelName = screenName.pascalCase;
    final screenClassImport = screenName.snakeCase;
    final codeLines = List<String>.empty(growable: true)
      ..add('import \'package:freezed_annotation/freezed_annotation.dart\';')
      ..addNewLine()
      ..add('part \'${screenClassImport}_screen_models.freezed.dart\';');

    ///If BLoC - add Event model
    if (stateManagement == const BlocStateManagementVariant()) {
      codeLines
        ..add('@freezed')
        ..add(
          'class ${screenModelName}ScreenEvent with _\$${screenModelName}ScreenEvent {',
        )
        ..add(
          'const factory ${screenModelName}ScreenEvent.init() = ${screenModelName}ScreenEventInit;',
        )
        ..add('}');
    }
    codeLines
      ..addNewLine()

      ///Add SR events
      ..add('@freezed')
      ..add(
        'class ${screenModelName}ScreenSR with _\$${screenModelName}ScreenSR {',
      )
      ..add(
        'const factory ${screenModelName}ScreenSR.loadFinished() = _LoadFinished;',
      )
      ..add('}')
      ..addNewLine();

    ///Add BLoC State
    if (stateManagement == const BlocStateManagementVariant()) {
      codeLines.add('class ${screenModelName}ScreenState {}');
    } else {
      codeLines
        ..add('@freezed')
        ..add(
          'class ${screenModelName}ScreenState with _\$${screenModelName}ScreenState{',
        )
        ..add('const factory ${screenModelName}ScreenState({')
        ..add('@Default(true) bool isLoading,')
        ..add('}) = _${screenName.pascalCase}ScreenState;')
        ..add('}');
    }
    codeLines.addNewLine();
    return codeLines.join('\n');
  }
}
