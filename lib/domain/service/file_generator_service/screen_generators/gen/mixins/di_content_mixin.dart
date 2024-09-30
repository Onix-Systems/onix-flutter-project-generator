import 'package:onix_flutter_bricks/domain/entity/state_management/state_managemet_variant.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:recase/recase.dart';

mixin DIContentMixin on ScreenGenerationService {
  final _importsSuffix = '//{imports end}';
  final _diBlocSuffix = '//{bloc end}';
  final _diProviderSuffix = '//{provider end}';

  String createScreenDIContent({
    required String input,
    required String screenName,
    required String projectName,
    required StateManagementVariant stateManagement,
  }) {
    String output = input;

    final diSuffix = stateManagement == const ProviderStateManagementVariant()
        ? _diProviderSuffix
        : _diBlocSuffix;

    final folder = stateManagement == const ProviderStateManagementVariant()
        ? 'provider'
        : 'bloc';

    output = output
        .replaceFirst(_importsSuffix,
            'import \'package:$projectName/presentation/screen/${screenName}_screen/$folder/${screenName}_screen_${stateManagement.name.toLowerCase()}.dart\';\n$_importsSuffix')
        .replaceFirst(diSuffix,
            'getIt.registerFactory<${screenName.pascalCase}Screen${stateManagement.name}>(${screenName.pascalCase}Screen${stateManagement.name}.new);\n$_diBlocSuffix');
    return output;
  }
}
