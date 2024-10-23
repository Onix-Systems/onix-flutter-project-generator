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
    final codeLines = List<String>.empty(growable: true)

      ///Add imports
      ..add("import 'package:flutter/material.dart';");
    if (!isGoRouter) {
      codeLines.add("import 'package:auto_route/annotations.dart';");
    }

    codeLines
      ..add("import 'package:get_it/get_it.dart';")
      ..add(
        "import 'package:onix_flutter_provider/onix_flutter_provider.dart';",
      )
      ..add(
        "import 'package:$projectName/presentation/screen/${screenClassImport}_screen/provider/${screenClassImport}_screen_provider.dart';",
      )
      ..addNewLine();

    ///Add annotation in AutoRoute navigation used
    if (!isGoRouter) {
      codeLines.add('@RoutePage()');
    }

    ///Add screen widget code
    codeLines
      ..add('class ${screenClassName}Screen extends StatefulWidget {')
      ..add('const ${screenClassName}Screen({')
      ..add('super.key,')
      ..add('});')
      ..addNewLine()
      ..add('@override')
      ..add(
        'State<${screenClassName}Screen> createState() => _${screenClassName}ScreenState();',
      )
      ..add('}')
      ..addNewLine()

      ///Add screen widget state code
      ..add('class _${screenClassName}ScreenState')
      ..add('extends BaseProviderState<')
      ..add('${screenClassName}ScreenProvider, ')
      ..add('${screenClassName}Screen> {')
      ..add('@override')
      ..add(
        '${screenClassName}ScreenProvider createProvider() => GetIt.I<${screenClassName}ScreenProvider>();',
      )
      ..addNewLine()
      ..add('@override')
      ..add('Widget buildWidget(BuildContext context) {')
      ..add('return Scaffold(')
      ..add('body: SizedBox.expand(')
      ..add('child: providerConsumer(')
      ..add('stateListener: (provider) => const Center(')
      ..add("child: Text('$screenClassName screen'),")
      ..add('),')
      ..add('),),);}}')
      ..addNewLine();

    return codeLines.join('\n');
  }
}
