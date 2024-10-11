import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

mixin RiverpodContentMixin on ScreenGenerationService {
  String createRiverpodImportsContent({
    required String screenName,
    required StateManagementVariant stateManagement,
  }) {
    final screenClassImport = screenName.snakeCase;
    final codeLines = List<String>.empty(growable: true)
      ..add(
        "export '${screenClassImport}_screen_provider.dart';",
      )
      ..add("export '${screenClassImport}_screen_state.dart';")
      ..addNewLine();
    return codeLines.join('\n');
  }

  String createRiverpodContent({
    required String projectName,
    required String screenName,
    required StateManagementVariant stateManagement,
  }) {
    final screenClassImport = screenName.snakeCase;

    final codeLines = List<String>.empty(growable: true)
      ..add("import 'package:flutter_riverpod/flutter_riverpod.dart';")
      ..add(
        "import 'package:$projectName/presentation/screen/${screenClassImport}_screen/riverpod/$screenClassImport\_screen_state.dart';",
      )
      ..addNewLine()
      ..add(
          'class ${screenName.pascalCase}ScreenProvider extends StateNotifier<${screenName.pascalCase}ScreenState> {')
      ..add('MainScreenProvider() : super(const MainScreenState());')
      ..addNewLine()
      ..add('void increment() {')
      ..add('state = state.copyWith(count: state.count + 1);')
      ..add('}')
      ..add('}');

    return codeLines.join('\n');
  }

  String createRiverpodState({
    required String screenName,
    required StateManagementVariant stateManagement,
  }) {
    final screenModelName = screenName.pascalCase;
    final screenClassImport = screenName.snakeCase;
    final codeLines = List<String>.empty(growable: true)
      ..add("import 'package:freezed_annotation/freezed_annotation.dart';")
      ..addNewLine()
      ..add("part '${screenClassImport}_screen_state.freezed.dart';")
      ..addNewLine()
      ..add("@freezed")
      ..add(
          "class ${screenModelName}ScreenState with _\$${screenModelName}ScreenState {")
      ..add("const factory ${screenModelName}ScreenState({")
      ..add("@Default(0) int count,")
      ..add("}) = _${screenModelName}ScreenState;")
      ..add("}")
      ..addNewLine();
    return codeLines.join('\n');
  }
}
