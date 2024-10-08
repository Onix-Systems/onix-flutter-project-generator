import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/screen_code_content.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class StatelessScreenCodeContent extends ScreenCodeContent {
  @override
  String createScreen({
    required bool isGoRouter,
    required String screenName,
    required String projectName,
  }) {
    final screenClassName = screenName.pascalCase;
    final codeLines = List<String>.empty(growable: true);

    ///Add imports
    if (!isGoRouter) {
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
