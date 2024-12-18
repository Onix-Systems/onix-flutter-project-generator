import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

mixin ViewModelContentMixin on ScreenGenerationService {
  String createViewModelContent({
    required String projectName,
    required String screenName,
    required StateManagementVariant stateManagement,
  }) {
    ///Declare Provider classes names

    final screenClassImport = screenName.snakeCase;
    final screenModelName = screenName.pascalCase;
    final className = '$screenModelName${stateManagement.name}';

    final codeLines = List<String>.empty(growable: true)

      ///Create ViewModel class code
      ..add("import 'dart:async';")
      ..addNewLine()
      ..add("import 'package:onix_flutter_mvvm/onix_flutter_mvvm.dart';")
      ..add(
        "import 'package:$projectName/presentation/screen/${screenClassImport}_screen/view_model/${screenClassImport}_model.dart';",
      )
      ..addNewLine()
      ..add(
        'class $className extends ViewModel<${screenName.pascalCase}Model> {',
      )
      ..add('$className() : super(${screenName.pascalCase}Model()) {')
      ..addNewLine()
      ..add('init();')
      ..add('}')
      ..addNewLine()
      ..add('void init() {')
      ..add('// Add your initialization code here')
      ..add('notifyListeners();')
      ..add('}')
      ..add('}')
      ..addNewLine();

    return codeLines.join('\n');
  }

  String createViewModelModelContent({
    required String screenName,
  }) {
    final codeLines = List<String>.empty(growable: true)
      ..addNewLine()
      ..add('class ${screenName.pascalCase}Model {')
      ..addNewLine()
      ..add('${screenName.pascalCase}Model();')
      ..addNewLine()
      ..add('}')
      ..addNewLine();

    return codeLines.join('\n');
  }
}
