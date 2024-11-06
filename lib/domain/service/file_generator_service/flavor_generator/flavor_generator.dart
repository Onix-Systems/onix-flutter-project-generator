import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/app/extension/process_extension.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/flavorizing_failure.dart';
import 'package:onix_flutter_bricks/domain/entity/platforms_list/platforms_list.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/mixins/flavor_generator_utils_mixin.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/mixins/flavor_injector_mixin.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/params/flavor_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

///This class generates flavors for the project
class FlavorGenerator
    extends BaseGenerationService<Result<int>, FlavorGeneratorParams>
    with FlavorInjectorMixin, FlavorGeneratorUtilsMixin {
  final OutputService _outputService;
  static const flavorizrInjectKey = '#{flavorizer_injection_config}';

  FlavorGenerator(this._outputService);

  @override
  Future<Result<int>> generate(FlavorGeneratorParams params) async {
    try {
      final projectPath = params.projectFolder;

      final projectName = projectPath.split('/').last;

      final pubspecFile = File('$projectPath/pubspec.yaml');

      ///Check if project is already flavorized
      if (pubspecFile.readAsStringSync().contains('flavorizr:')) {
        _outputService.add('{#info}Already flavorized');
        await Future.delayed(const Duration(seconds: 1));
        return Result.error(
          failure: FlavorizingFailure(FlavorizingFailureType.alreadyFlavorized),
        );
      }

      final configFile = File('$projectPath/.gen_config.json');

      final isGenerated = configFile.existsSync();

      ArchType? archType;

      if (isGenerated) {
        final configString = configFile.readAsStringSync();
        final configMap = jsonDecode(configString) as Map<String, dynamic>;
        archType = configMap['arch'] != null
            ? ArchType.values.firstWhereOrNull(
                (element) => element.name == configMap['arch'],
              )
            : null;
      }

      _outputService.add('{#info}Arch type: ${archType?.name ?? 'unknown'}');

      final org = await getOrg(params.projectFolder);

      if (org.isEmpty) {
        return Result.error(
          failure: FlavorizingFailure(FlavorizingFailureType.cannotGetOrg),
        );
      }

      _outputService.add('{#info}Org: $org');

      final isIOsEnabled = Directory('$projectPath/ios').existsSync();

      final isAndroidEnabled = Directory('$projectPath/android').existsSync();

      final isMacOsEnabled = Directory('$projectPath/macos').existsSync();

      final platforms = PlatformsList(
        android: isAndroidEnabled,
        ios: isIOsEnabled,
        macos: isMacOsEnabled,
      );

      await injectFlavors(
        params: params,
        org: org,
        platformsList: platforms,
        isGenerated: isGenerated,
      );

      ///Manipulations with icons
      if (isGenerated) {
        await Directory('$projectPath/flavor_assets').create(recursive: true);

        for (final flavor in params.flavors) {
          await copyIcons(projectPath, flavor, params);
        }
      }

      ///Save main.dart content before flavorizr breaks it
      var mainFileContent =
          File('$projectPath/lib/main.dart').readAsStringSync();

      final addFlavorizrProc = await Process.start(
        'flutter',
        ['pub', 'add', '-d', 'flutter_flavorizr'],
        workingDirectory: projectPath,
      );

      await addFlavorizrProc.toOutputService(_outputService);

      final flavorizrProc = await Process.start(
        'flutter',
        ['pub', 'run', 'flutter_flavorizr'],
        workingDirectory: projectPath,
      );

      await flavorizrProc.toOutputService(_outputService);

      exitCode = await flavorizrProc.exitCode;

      if (exitCode == 0) {
        for (final flavor in params.flavors) {
          ///Generate AndroidStudio configs
          await _generateConfigs(
            projectPath: projectPath,
            flavor: flavor,
            isGenerated: isGenerated,
          );

          await Directory(
            '$projectPath/lib/${isGenerated ? 'app/' : ''}flavors',
          ).create(recursive: true);

          mainFileContent = mainFileContent.replaceAll(
            'void main()',
            'Future<void> mainApp() async',
          );

          mainFileContent = mainFileContent.replaceAll(
            'Future<void> main()',
            'Future<void> mainApp()',
          );

          if (!isGenerated) {
            mainFileContent =
                ["import 'app.dart';", mainFileContent].join('\n');
            mainFileContent = mainFileContent.replaceAll(
              'runApp(const MyApp());',
              'runApp(const App());',
            );

            var appContent =
                await File('$projectPath/lib/app.dart').readAsString();

            appContent = appContent
                .replaceAll(
                  'MyHomePage()',
                  'const MyApp()',
                )
                .replaceAll(
                  "import 'pages/my_home_page.dart';",
                  "import 'main.dart';",
                );
            await File('$projectPath/lib/app.dart').writeAsString(appContent);
          }

          await File('$projectPath/lib/main.dart')
              .writeAsString(mainFileContent);

          await Process.run(
            'mv',
            [
              '$projectPath/lib/main_$flavor.dart',
              '$projectPath/lib/${isGenerated ? 'app/' : ''}flavors/main_$flavor.dart',
            ],
          );

          var mainFlavorFileContent = File(
            '$projectPath/lib/${isGenerated ? 'app/' : ''}flavors/main_$flavor.dart',
          ).readAsStringSync();

          mainFlavorFileContent = mainFlavorFileContent
              .replaceAll(
                "import 'flavors.dart';",
                "import 'package:$projectName/flavors.dart';",
              )
              .replaceAll(
                "import 'main.dart' as runner;",
                "import 'package:$projectName/main.dart' as runner;",
              )
              .replaceAll(
                'runner.main()',
                'runner.mainApp()',
              );

          await File(
            '$projectPath/lib/${isGenerated ? 'app/' : ''}flavors/main_$flavor.dart',
          ).writeAsString(mainFlavorFileContent);

          for (final platform in platforms.asList()) {
            if (platform == 'android') continue;

            await correctApple(
              projectPath: projectPath,
              flavor: flavor,
              isGenerated: isGenerated,
              platform: platform,
            );
          }
        }

        await clean(
          projectPath: projectPath,
          isGenerated: isGenerated,
        );

        _outputService.add('{#info}Flavorizing finished');

        await createFlavorBannerWidget(
          projectPath: projectPath,
          projectName: projectName,
          isGenerated: isGenerated,
          archType: archType,
        );
      } else {
        _outputService.add(
          '{#error}Flavorizing failed with exit code $exitCode',
        );
      }

      return const Result.success(0);
    } catch (e, trace) {
      logger.e(e, stackTrace: trace);
      _outputService.add('{#error}$e');
      return Result.error(
        failure: FlavorizingFailure(FlavorizingFailureType.exception),
      );
    }
  }

  Future<void> _generateConfigs({
    required String projectPath,
    required String flavor,
    required bool isGenerated,
  }) async {
    final flavorConfigFile = await File(
      '$projectPath/.idea/runConfigurations/$flavor.xml',
    ).create();

    final flavorConfigFileContent = '''
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="$flavor" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="buildFlavor" value="$flavor" />
    <option name="filePath" value="\$PROJECT_DIR\$/lib/${isGenerated ? 'app/' : ''}flavors/main_$flavor.dart" />
    ${isGenerated ? '''
    <method v="2">
        <option name="RunConfigurationTask" enabled="true" run_configuration_name="make-$flavor" run_configuration_type="MAKEFILE_TARGET_RUN_CONFIGURATION" />
    </method>''' : ''}
  </configuration>
</component>
''';

    await flavorConfigFile.writeAsString(flavorConfigFileContent);

    if (isGenerated) {
      final makeFlavorConfigFile = await File(
        '$projectPath/.idea/runConfigurations/make-$flavor.xml',
      ).create();

      final makeFlavorConfigFileContent = '''
<component name="ProjectRunConfigurationManager">
    <configuration default="false" name="make-$flavor" type="MAKEFILE_TARGET_RUN_CONFIGURATION" factoryName="Makefile">
        <makefile filename="\$PROJECT_DIR\$/Makefile" target="$flavor" workingDirectory="" arguments="">
            <envs />
        </makefile>
        <method v="2" />
    </configuration>
</component>
      ''';

      await makeFlavorConfigFile.writeAsString(makeFlavorConfigFileContent);

      final makeFile = File('$projectPath/Makefile');

      final makeFileContent = await makeFile.readAsString();

      await makeFile.writeAsString('''
${makeFileContent.startsWith(r'''
ROOT_DIR = $(shell pwd)
ASSETS_DIR = assets
''') ? '' : r'''
ROOT_DIR = $(shell pwd)
ASSETS_DIR = assets
'''}\n
$makeFileContent

$flavor:
\t@echo "Building for $flavor"
\t@echo "Copying ${flavor}_assets to \$(ASSETS_DIR)"
\t@cp -r \$(ROOT_DIR)/flavor_assets/$flavor/* \$(ASSETS_DIR)
\tdart run flutter_native_splash:create
''');
    }
  }
}
