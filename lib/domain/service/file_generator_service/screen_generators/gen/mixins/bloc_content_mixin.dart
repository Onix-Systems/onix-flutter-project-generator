import 'package:onix_flutter_bricks/domain/entity/state_management/state_managemet_variant.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

mixin BlocContentMixin on ScreenGenerationService {
  String createBlocImportsContent({
    required String screenName,
    required StateManagementVariant stateManagement,
  }) {
    final screenClassImport = screenName.snakeCase;
    final codeLines = List<String>.empty(growable: true);
    codeLines.add(
        'export \'${screenClassImport}_screen_${stateManagement.name.toLowerCase()}.dart\';');
    codeLines.add('export \'${screenClassImport}_screen_models.dart\';');
    codeLines.addNewLine();
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
    final codeLines = List<String>.empty(growable: true);

    ///Create BLoC class code
    codeLines.add('import \'dart:async\';');
    codeLines.addNewLine();
    codeLines.add(
        'import \'package:$projectName/core/arch/bloc/base_${stateManagement.name.toLowerCase()}.dart\';');
    if (stateManagement == const BlocStateManagementVariant()) {
      codeLines.add('import \'package:flutter_bloc/flutter_bloc.dart\';');
    }
    codeLines.add(
        'import \'package:$projectName/presentation/screen/${screenClassImport}_screen/bloc/${screenClassImport}_screen_imports.dart\';');
    codeLines.addNewLine();
    codeLines.add(
        'class $className extends Base$stateManagementSuffix<$eventName$stateName, $srName> {');

    final defaultStatePrefix =
        stateManagement == const BlocStateManagementVariant() ? '' : 'const ';
    final constructorSuffix =
        stateManagement == const BlocStateManagementVariant() ? ' {' : ';';
    codeLines.add(
        '$className() : super($defaultStatePrefix$stateName())$constructorSuffix');
    if (stateManagement == const BlocStateManagementVariant()) {
      codeLines.add('on<${screenName.pascalCase}ScreenEventInit>(_onInit);');
      codeLines.add('add(const ${screenName.pascalCase}ScreenEvent.init());');
      codeLines.add('}');
    }
    codeLines.addNewLine();

    codeLines.addNewLine();
    codeLines.add('FutureOr<void> $initFunctionName (');
    if (stateManagement == const BlocStateManagementVariant()) {
      codeLines.add('${screenName.pascalCase}ScreenEventInit event,');
      codeLines.add('Emitter<${screenName.pascalCase}ScreenState> emit,');
    }
    codeLines.add(') {');
    if (stateManagement == const CubitStateManagementVariant()) {
      codeLines.add('emit(state.copyWith(isLoading: false));');
    }
    codeLines.add('}');
    codeLines.addNewLine();
    codeLines.add('}');
    return codeLines.join('\n');
  }

  String createBlocModels({
    required String screenName,
    required StateManagementVariant stateManagement,
  }) {
    final screenModelName = screenName.pascalCase;
    final screenClassImport = screenName.snakeCase;
    final codeLines = List<String>.empty(growable: true);
    codeLines
        .add('import \'package:freezed_annotation/freezed_annotation.dart\';');
    codeLines.addNewLine();
    codeLines.add('part \'${screenClassImport}_screen_models.freezed.dart\';');

    ///If BLoC - add Event model
    if (stateManagement == const BlocStateManagementVariant()) {
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
    if (stateManagement == const BlocStateManagementVariant()) {
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
}
