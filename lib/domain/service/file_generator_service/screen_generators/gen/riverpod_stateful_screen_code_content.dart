import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/screen_code_content.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class RiverpodStatefulScreenCodeContent extends ScreenCodeContent {
  @override
  String createScreen({
    required ScreenGeneratorParams params,
  }) {
    final screenClassName = params.normalizedScreenName.pascalCase;
    final codeLines = List<String>.empty(growable: true);

    ///Add imports
    if (!params.isGoRouter) {
      codeLines.add("import 'package:auto_route/annotations.dart';");
    }
    codeLines
      ..add("import 'package:flutter/material.dart';")
      ..add("import 'package:flutter_riverpod/flutter_riverpod.dart';")
      ..add(
          "${params.archType.getDiImportPrefix(params.projectName)}/riverpod.dart';")
      ..addNewLine();

    ///Add annotation in AutoRoute navigation used
    if (!params.isGoRouter) {
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
