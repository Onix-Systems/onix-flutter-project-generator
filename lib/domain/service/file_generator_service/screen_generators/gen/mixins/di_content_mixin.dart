import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:recase/recase.dart';

mixin DIContentMixin on ScreenGenerationService {
  final _importsSuffix = '//{imports end}';

  Future<void> createScreenDIContent({
    required ScreenGeneratorParams params,
  }) async {
    var stateManagement = params.screen.stateVariant.name.toLowerCase();
    var stateVariant = params.screen.stateVariant.name;

    if (stateManagement.startsWith('riverpod')) {
      stateManagement = 'riverpod';
    }

    if (stateManagement.startsWith('cubit')) {
      stateManagement = 'bloc';
    }

    if (stateManagement.startsWith('signals')) {
      stateManagement = 'signals';
      stateVariant = 'Signals';
    }

    final diFolderPath = params.archType.getDiPath();

    final diFile = File(
      '${params.projectRootPath}/$diFolderPath/$stateManagement.dart',
    );

    var output = '';

    final diSuffix = '//{$stateManagement end}';

    if (!diFile.existsSync()) {
      await diFile.create(recursive: true);
      output = '''
//@formatter:off
${stateManagement == 'riverpod' ? "import 'package:flutter_riverpod/flutter_riverpod.dart';" : ''}
import 'package:get_it/get_it.dart';
//{imports end}

void register${stateManagement.titleCase}(GetIt getIt) {
  $diSuffix
}''';
    } else {
      output = await diFile.readAsString();
    }

    final screenName = params.normalizedScreenName;

    final projectName = params.projectName;

    if (stateManagement == 'riverpod') {
      output = output
          .replaceFirst(_importsSuffix,
              "import 'package:$projectName/presentation/screen/${screenName}_screen/riverpod/${screenName}_screen_imports.dart';\n$_importsSuffix")
          .replaceFirst(diSuffix,
              'getIt.registerSingleton<StateNotifierProvider<${screenName.pascalCase}ScreenProvider, ${screenName.pascalCase}ScreenState>>(StateNotifierProvider<${screenName.pascalCase}ScreenProvider, ${screenName.pascalCase}ScreenState>((ref) => ${screenName.pascalCase}ScreenProvider(),),);\n$diSuffix');

      output = '''
$output
      
      StateNotifierProvider<${screenName.pascalCase}ScreenProvider, ${screenName.pascalCase}ScreenState> ${screenName.snakeCase}ScreenProvider() =>
    GetIt.I.get<StateNotifierProvider<${screenName.pascalCase}ScreenProvider, ${screenName.pascalCase}ScreenState>>();
      ''';
    } else {
      output = output
          .replaceFirst(_importsSuffix,
              "import 'package:$projectName/presentation/screen/${screenName}_screen/$stateManagement/${screenName}_screen_${stateVariant.toLowerCase()}.dart';\n$_importsSuffix")
          .replaceFirst(diSuffix,
              'getIt.registerFactory<${screenName.pascalCase}Screen${stateVariant.pascalCase}>(${screenName.pascalCase}Screen${stateVariant.pascalCase}.new);\n$diSuffix');
    }
    await diFile.writeAsString(output);

    final diInjectionFile = File(
      '${params.projectRootPath}/$diFolderPath/injection.dart',
    );

    var injectionOutput = await diInjectionFile.readAsString();

    if (injectionOutput
        .contains('register${stateManagement.titleCase}(getIt);')) {
      return;
    }

    injectionOutput = injectionOutput
        .replaceFirst(
      '}',
      '  register${stateManagement.titleCase}(getIt);\n}',
    )
        .replaceFirst('void initializeDi(GetIt getIt) {', '''
${params.archType.getDiImportPrefix(projectName)}/$stateManagement.dart';

void initializeDi(GetIt getIt) {
''');

    await diInjectionFile.writeAsString(injectionOutput);
  }
}
