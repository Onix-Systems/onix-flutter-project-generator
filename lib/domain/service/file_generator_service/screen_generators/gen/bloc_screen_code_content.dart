import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/screen_code_content.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class BlocScreenCodeContent extends ScreenCodeContent {
  @override
  String createScreen({
    required bool isGoRouter,
    required String screenName,
    required String projectName,
  }) {
    final screenClassName = screenName.pascalCase;
    final screenClassImport = screenName.snakeCase;
    final codeLines = List<String>.empty(growable: true);
    final blocClassType = '${screenClassName}ScreenBloc';

    /// Add imports
    codeLines.add('import \'package:flutter/material.dart\';');
    if (!isGoRouter) {
      codeLines.add('import \'package:auto_route/annotations.dart\';');
    }

    codeLines
      ..add("import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';")
      ..add("import 'package:get_it/get_it.dart';")
      ..add(
          'import \'package:$projectName/presentation/screen/${screenClassImport}_screen/bloc/${screenClassImport}_screen_imports.dart\';')
      ..addNewLine();

    /// Add annotation in AutoRoute navigation used
    if (!isGoRouter) {
      codeLines.add('@RoutePage()');
    }

    /// Add screen widget code
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
      ..add('extends BaseState<')
      ..add('${screenClassName}ScreenState, ')
      ..add('$blocClassType, ')
      ..add('${screenClassName}ScreenSR, ')
      ..add('${screenClassName}Screen> {')
      ..add('@override')
      ..add(
        '$blocClassType createBloc() => GetIt.I.get<$blocClassType>();',
      )
      ..add('@override')
      ..add('Widget buildWidget(BuildContext context) {')
      ..add('return srObserver(')
      ..add('context: context,')
      ..add('child: Scaffold(')
      ..add('body: SizedBox.expand(')
      ..add('child: blocConsumer(')
      ..add('builder: (state) => const Center(')
      ..add('child: Text(\'$screenClassName screen\'),')
      ..add('),')
      ..add('listener: (context, state) {},')
      ..add('),),),')
      ..add('onSR: _onSingleResult,')
      ..add(' );}')
      ..addNewLine()

      /// Add SR callback handler
      ..add(
        'void _onSingleResult(BuildContext context, ${screenClassName}ScreenSR singleResult) {',
      )
      ..add('singleResult.when(')
      ..add('loadFinished: () {')
      ..add('},);}')
      ..addNewLine()
      ..add('}')
      ..addNewLine();
    return codeLines.join('\n');
  }
}
