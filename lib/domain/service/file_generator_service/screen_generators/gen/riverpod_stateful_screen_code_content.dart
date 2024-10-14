import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/screen_code_content.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class RiverpodStatefulScreenCodeContent extends ScreenCodeContent {
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
      codeLines.add("import 'package:auto_route/annotations.dart';");
    }
    codeLines
      ..add("import 'package:flutter/material.dart';")
      ..add("import 'package:flutter_riverpod/flutter_riverpod.dart';")
      ..add("import 'package:$projectName/core/di/riverpod.dart';")
      ..addNewLine();

    ///Add annotation in AutoRoute navigation used
    if (!isGoRouter) {
      codeLines.add('@RoutePage()');
    }

    ///Add screen widget code
    codeLines
      ..add('class ${screenClassName}Screen extends ConsumerStatefulWidget {')
      ..add('const ${screenClassName}Screen({super.key});')
      ..addNewLine()
      ..add('@override')
      ..add(
        'ConsumerState<${screenClassName}Screen> createState() => _${screenClassName}State();',
      )
      ..add('}')
      ..add(
        'class _${screenClassName}State extends ConsumerState<${screenClassName}Screen> {',
      )
      ..add('@override')
      ..add('Widget build(BuildContext context) {')
      ..add('return const Scaffold(')
      ..add("body: Center(child: Text('$screenClassName screen'),),")
      ..add(');')
      ..add('}')
      ..add('}')
      ..addNewLine();

    return codeLines.join('\n');
  }
}
