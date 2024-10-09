import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

mixin ProviderContentMixin on ScreenGenerationService {
  String createProviderImportsContent({
    required String screenName,
    required StateManagementVariant stateManagement,
  }) {
    final screenClassImport = screenName.snakeCase;
    final codeLines = List<String>.empty(growable: true);
    codeLines.add('export \'${screenClassImport}_screen_provider.dart\';');
    codeLines.add('export \'${screenClassImport}_screen_state.dart\';');
    codeLines.addNewLine();
    return codeLines.join('\n');
  }

  String createProviderContent({
    required String projectName,
    required String screenName,
  }) {
    ///Declare Provider classes names
    final stateManagementSuffix = const ProviderStateManagementVariant().name;
    final screenModelName = screenName.pascalCase;
    final className = '${screenName.pascalCase}Screen$stateManagementSuffix';

    final codeLines = List<String>.empty(growable: true);

    ///Create Provider class code
    codeLines.add('import \'dart:async\';');
    codeLines.addNewLine();
    codeLines.add(
        'import \'package:$projectName/core/arch/provider/base_provider.dart\';');

    codeLines.addNewLine();
    codeLines.add('class $className extends BaseProvider {');

    codeLines.add('${screenModelName}ScreenProvider() : super() {');
    codeLines.add('init();');
    codeLines.add('}');
    codeLines.addNewLine();
    codeLines.add('void init() {');
    codeLines.add('// Add your initialization code here');
    codeLines.add('notifyListeners();');
    codeLines.add('}');
    codeLines.add('}');
    codeLines.addNewLine();

    return codeLines.join('\n');
  }

  String createProviderState({
    required String screenName,
    required String projectName,
  }) {
    final screenModelName = screenName.pascalCase;
    final screenClassImport = screenName.snakeCase;
    final codeLines = List<String>.empty(growable: true);
    codeLines
        .add('import \'package:freezed_annotation/freezed_annotation.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/provider/base_provider.dart\';');

    codeLines.addNewLine();
    codeLines.add('part \'${screenClassImport}_screen_state.freezed.dart\';');

    ///Add Provider State

    codeLines.add('@freezed');
    codeLines.add(
        'class ${screenModelName}ScreenState with _\$${screenModelName}ScreenState implements ProviderState {');
    codeLines.add('const factory ${screenModelName}ScreenState({');
    codeLines.add('@Default(true) bool isLoading,');
    codeLines.add('}) = _${screenName.pascalCase}ScreenState;');
    codeLines.add('}');

    codeLines.addNewLine();
    return codeLines.join('\n');
  }
}
