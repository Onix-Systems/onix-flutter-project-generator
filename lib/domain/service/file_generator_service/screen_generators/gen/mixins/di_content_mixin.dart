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
    var stateManagement = params.screen.stateVariant.name.toLowerCase();

    if (stateManagement.startsWith('riverpod')) {
      stateManagement = 'riverpod';
    }

    final diFile = File(
        '${params.projectPath}/${params.projectName}/lib/core/di/$stateManagement.dart');
    final screenName = params.normalizedScreenName;
    var output = await diFile.readAsString();

    final diSuffix = '//{$stateManagement end}';

    final projectName = params.projectName;

    if (diSuffix == _diRiverpodSuffix) {
      output = output
          .replaceFirst(_importsSuffix,
              "import 'package:$projectName/presentation/screen/${screenName}_screen/$stateManagement/${screenName}_screen_imports.dart';\n$_importsSuffix")
          .replaceFirst(diSuffix,
              'getIt.registerSingleton<StateNotifierProvider<${screenName.pascalCase}ScreenProvider, ${screenName.pascalCase}ScreenState>>(StateNotifierProvider<${screenName.pascalCase}ScreenProvider, ${screenName.pascalCase}ScreenState>((ref) => ${screenName.pascalCase}ScreenProvider(),),);\n$diSuffix');

      output = '''$output
      
      StateNotifierProvider<${screenName.pascalCase}ScreenProvider, ${screenName.pascalCase}ScreenState> ${screenName.snakeCase}ScreenProvider() =>
    GetIt.I.get<StateNotifierProvider<${screenName.pascalCase}ScreenProvider, ${screenName.pascalCase}ScreenState>>();
      ''';
    } else {
      output = output
          .replaceFirst(_importsSuffix,
              "import 'package:$projectName/presentation/screen/${screenName}_screen/$stateManagement/${screenName}_screen_${stateManagement.toLowerCase()}.dart';\n$_importsSuffix")
          .replaceFirst(diSuffix,
              'getIt.registerFactory<${screenName.pascalCase}Screen${stateManagement.pascalCase}>(${screenName.pascalCase}Screen${stateManagement.pascalCase}.new);\n$diSuffix');
    }
    await diFile.writeAsString(output);
  }
}
