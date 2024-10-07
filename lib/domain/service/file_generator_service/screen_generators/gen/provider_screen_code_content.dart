import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/screen_code_content.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class ProviderScreenCodeContent extends ScreenCodeContent {
  @override
  String createScreen({
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
        'import \'package:$projectName/presentation/screen/${screenClassImport}_screen/provider/${screenClassImport}_screen_provider.dart\';');
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
    codeLines.add('${screenClassName}Screen> {');
    codeLines.add('@override');
    codeLines.add('Widget buildWidget(BuildContext context) {');
    codeLines.add('return Scaffold(');
    codeLines.add('body: SizedBox.expand(');
    codeLines.add('child: providerConsumer(');
    codeLines.add('stateListener: (provider) => const Center(');
    codeLines.add('child: Text(\'$screenClassName screen\'),');
    codeLines.add('),');
    codeLines.add('),),);}}');
    codeLines.addNewLine();

    return codeLines.join('\n');
  }
}
