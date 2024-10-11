import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:recase/recase.dart';

mixin DIContentMixin on ScreenGenerationService {
  final _importsSuffix = '//{imports end}';
  final _diRiverpodSuffix = '//{riverpod end}';

  Future<void> createScreenDIContent({
    required ScreenGeneratorParams params,
  }) async {
    final diFile = File(
        '${params.projectPath}/${params.projectName}/lib/core/di/riverpod.dart');
    final screenName = params.normalizedScreenName;
    var output = await diFile.readAsString();

    final stateManagement = params.screen.stateVariant;

    final diSuffix = '//{${stateManagement.name.toLowerCase()} end}';

    final folder = stateManagement.name.toLowerCase();

    final projectName = params.projectName;

    output = output.replaceFirst(_importsSuffix,
        "import 'package:$projectName/presentation/screen/${screenName}_screen/$folder/${screenName}_screen_${stateManagement.name.toLowerCase()}.dart';\n$_importsSuffix");

    if (diSuffix == _diRiverpodSuffix) {
      output = output.replaceFirst(diSuffix,
          'getIt.registerSingleton<StateNotifierProvider<${screenName.pascalCase}ScreenProvider, ${screenName.pascalCase}ScreenState>>(StateNotifierProvider<${screenName.pascalCase}ScreenProvider, ${screenName.pascalCase}ScreenState>((ref) => ${screenName.pascalCase}ScreenProvider(),),);\n$diSuffix');
    } else {
      output = output.replaceFirst(diSuffix,
          'getIt.registerFactory<${screenName.pascalCase}Screen${stateManagement.name}>(${screenName.pascalCase}Screen${stateManagement.name}.new);\n$diSuffix');
    }
    await diFile.writeAsString(output);
  }
}
