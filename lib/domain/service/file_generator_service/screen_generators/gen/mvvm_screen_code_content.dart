import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/screen_code_content.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class MvvmScreenCodeContent extends ScreenCodeContent {
  @override
  String createScreen({
    required ScreenGeneratorParams params,
  }) {
    final screenClassName = params.normalizedScreenName.pascalCase;
    final screenClassImport = params.normalizedScreenName.snakeCase;
    final codeLines = List<String>.empty(growable: true);

    ///Add imports
    if (!params.isGoRouter) {
      codeLines.add("import 'package:auto_route/annotations.dart';");
    }
    codeLines
      ..add("import 'package:flutter/material.dart';")
      ..add("import 'package:onix_flutter_mvvm/onix_flutter_mvvm.dart';")
      ..add(
        "import 'package:${params.projectName}/presentation/screen/${screenClassImport}_screen/view_model/${screenClassImport}_view_model.dart';",
      )
      ..addNewLine();

    ///Add annotation in AutoRoute navigation used
    if (!params.isGoRouter) {
      codeLines.add('@RoutePage()');
    }

    ///Add screen widget code
    codeLines
      ..add('class ${screenClassName}Screen extends StatefulWidget {')
      ..add('const ${screenClassName}Screen({super.key});')
      ..addNewLine()
      ..add('@override')
      ..add(
        'State<${screenClassName}Screen> createState() => _${screenClassName}State();',
      )
      ..add('}')
      ..add(
        'class _${screenClassName}State extends ViewModelWidget<${screenClassName}Screen, ${screenClassName}ViewModel> {',
      )
      ..addNewLine()
      ..add('@override')
      ..add(
          '${screenClassName}ViewModel createVm() => ${screenClassName}ViewModel();')
      ..addNewLine()
      ..add('@override')
      ..add('Widget build(BuildContext context) {')
      ..add('return const Scaffold(')
      ..add("body: Center(child: Text('$screenClassName screen'),),")
      ..add(');')
      ..add('}')
      ..addNewLine()
      ..add('@override')
      ..add('void onError(Exception error) {')
      ..add('// TODO: process error')
      ..add('}')
      ..addNewLine()
      ..add('}')
      ..addNewLine();

    return codeLines.join('\n');
  }
}