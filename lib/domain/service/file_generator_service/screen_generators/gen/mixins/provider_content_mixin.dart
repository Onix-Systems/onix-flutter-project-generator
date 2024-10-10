import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

mixin ProviderContentMixin on ScreenGenerationService {
  String createProviderContent({
    required String projectName,
    required String screenName,
  }) {
    ///Declare Provider classes names
    final stateManagementSuffix = const ProviderStateManagementVariant().name;
    final screenModelName = screenName.pascalCase;
    final className = '${screenName.pascalCase}Screen$stateManagementSuffix';

    final codeLines = List<String>.empty(growable: true)

      ///Create Provider class code
      ..add("import 'dart:async';")
      ..addNewLine()
      ..add(
        "import 'package:onix_flutter_provider/onix_flutter_provider.dart';",
      )
      ..addNewLine()
      ..add('class $className extends BaseProvider {')
      ..add('${screenModelName}ScreenProvider() : super() {')
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
}
