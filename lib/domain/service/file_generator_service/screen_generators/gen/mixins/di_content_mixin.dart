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

    var stateManagement = params.screen.stateVariant.name;

    if (stateManagement.startsWith('Riverpod')) {
      stateManagement = 'riverpod';
    }

    final diSuffix = '//{${stateManagement.toLowerCase()} end}';

    final folder = stateManagement.toLowerCase();

    final projectName = params.projectName;

    if (diSuffix == _diRiverpodSuffix) {
      output = output
          .replaceFirst(_importsSuffix,
              "import 'package:$projectName/presentation/screen/${screenName}_screen/$folder/${screenName}_screen_imports.dart';\n$_importsSuffix")
          .replaceFirst(diSuffix,
              'getIt.registerSingleton<StateNotifierProvider<${screenName.pascalCase}ScreenProvider, ${screenName.pascalCase}ScreenState>>(StateNotifierProvider<${screenName.pascalCase}ScreenProvider, ${screenName.pascalCase}ScreenState>((ref) => ${screenName.pascalCase}ScreenProvider(),),);\n$diSuffix');
    } else {
      output = output
          .replaceFirst(_importsSuffix,
              "import 'package:$projectName/presentation/screen/${screenName}_screen/$folder/${screenName}_screen_${stateManagement.toLowerCase()}.dart';\n$_importsSuffix")
          .replaceFirst(diSuffix,
              'getIt.registerFactory<${screenName.pascalCase}Screen$stateManagement>(${screenName.pascalCase}Screen$stateManagement.new);\n$diSuffix');
    }
    await diFile.writeAsString(output);
  }
}
