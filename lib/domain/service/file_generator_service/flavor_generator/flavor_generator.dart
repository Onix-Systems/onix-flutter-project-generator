import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/flavorizing_failure.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/params/flavor_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:process_run/process_run.dart';
import 'package:recase/recase.dart';

///This class generates flavors for the project
class FlavorGenerator
    implements BaseGenerationService<Result<int>, FlavorGeneratorParams> {
  final OutputService _outputService;
  static const flavorizrInjectKey = '#{flavorizer_injection_config}';

  FlavorGenerator(this._outputService);

  @override
  Future<Result<int>> generate(FlavorGeneratorParams params) async {
    try {
      final org = await _getOrg(params.projectFolder);

      if (org.isEmpty) {
        return Result.error(
          failure: FlavorizingFailure(FlavorizingFailureType.cannotGetOrg),
        );
      }

      logger.f('Org: $org');

      final projectPath = params.projectFolder;

      final projectName = projectPath.split('/').last;

      final isIOsEnabled = Directory('$projectPath/ios').existsSync();

      final isAndroidEnabled = Directory('$projectPath/android').existsSync();

      final isMacOsEnabled = Directory('$projectPath/macos').existsSync();

      await _injectFlavors(
        params,
        org,
        isIOsEnabled,
        isAndroidEnabled,
        isMacOsEnabled,
      );

      final isGenerated = _isGenerated(projectPath);

      ///Manipulations with icons
      if (isGenerated) {
        await Directory('$projectPath/flavor_assets').create(recursive: true);

        for (final flavor in params.flavors) {
          await Directory('$projectPath/flavor_assets/$flavor/launcher_icons')
              .create(recursive: true);
          switch (flavor) {
            case 'dev':
            case 'prod':
              var srcFile = File(
                  '$projectPath/assets/launcher_icons/ic_launcher_$flavor.png');
              await srcFile.copy(
                '$projectPath/flavor_assets/$flavor/launcher_icons/ic_launcher.png',
              );

              await srcFile.delete();

              srcFile = File('$projectPath/assets/android12splash_$flavor.png');
              await srcFile.copy(
                  '$projectPath/flavor_assets/$flavor/android12splash.png');

              await srcFile.delete();

            default:
              var srcFile =
                  File('$projectPath/assets/launcher_icons/ic_launcher.png');
              await srcFile.copy(
                '$projectPath/flavor_assets/$flavor/launcher_icons/ic_launcher.png',
              );
              if (flavor == params.flavors.last) {
                await srcFile.delete();
              }

              srcFile = File('$projectPath/assets/android12splash.png');
              await srcFile.copy(
                  '$projectPath/flavor_assets/$flavor/android12splash.png');

              if (flavor == params.flavors.last) {
                await srcFile.delete();
              }
          }
        }
      }

      ///Save main.dart content
      var mainFileContent =
          File('$projectPath/lib/main.dart').readAsStringSync();

      final addFlavorizrProc = await Process.start(
        'flutter',
        ['pub', 'add', '-d', 'flutter_flavorizr'],
        workingDirectory: projectPath,
      );

      await addFlavorizrProc.outLines.forEach((element) {
        logger.f('Flavorizing: $element');
      });

      await addFlavorizrProc.errLines.forEach((element) {
        logger.e('Flavorizing: $element');
      });

      final flavorizrProc = await Process.start(
        'flutter',
        ['pub', 'run', 'flutter_flavorizr'],
        workingDirectory: projectPath,
      );

      await flavorizrProc.outLines.forEach((element) {
        _outputService.add(element);
        logger.f('Flavorizing: $element');
      });

      await flavorizrProc.errLines.forEach((element) {
        _outputService.add(element);
        logger.e('Flavorizing: $element');
      });

      exitCode = await flavorizrProc.exitCode;

      if (exitCode == 0) {
        for (final flavor in params.flavors) {
          await _generateConfigs(
            projectPath: projectPath,
            flavor: flavor,
            isGenerated: isGenerated,
          );

          await Directory(
                  '$projectPath/lib/${isGenerated ? 'app/' : ''}flavors')
              .create(recursive: true);

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

          if (isIOsEnabled) {
            for (final run in ['Debug', 'Profile', 'Release']) {
              final file =
                  File('$projectPath/ios/Flutter/$flavor$run.xcconfig');
              final content = await file.readAsString();
              final writer = file.openWrite()
                ..write(
                  content.replaceAll(
                    'lib/main_$flavor.dart',
                    'lib/${isGenerated ? 'app/' : ''}flavors/main_$flavor.dart',
                  ),
                );
              await writer.flush();
              await writer.close();
            }
          }

          //TODO: Add support for macos
          if (isMacOsEnabled) {
            for (final run in ['Debug', 'Profile', 'Release']) {
              final file =
                  File('$projectPath/macos/Flutter/$flavor$run.xcconfig');
              final content = await file.readAsString();
              final writer = file.openWrite()
                ..write(
                  content.replaceAll(
                    'lib/main_$flavor.dart',
                    'lib/${isGenerated ? 'app/' : ''}flavors/main_$flavor.dart',
                  ),
                );
              await writer.flush();
              await writer.close();
            }
          }
        }

        await Process.run(
          'rm',
          ['-r', 'pages'],
          workingDirectory: '$projectPath/lib',
        );
        await Process.run(
          'rm',
          ['main_dart.xml'],
          workingDirectory: '$projectPath/.idea/runConfigurations',
        );
        if (isGenerated) {
          await Process.run(
            'rm',
            ['ic_launcher.png'],
            workingDirectory: '$projectPath/assets/launcher_icons',
          );
          await Process.run(
            'rm',
            ['app.dart'],
            workingDirectory: '$projectPath/lib',
          );
        }
      } else {
        logger.e(
          'Flavorizing failed with exit code $exitCode',
        );
      }

      return const Result.success(0);
    } catch (e, trace) {
      logger.e(e, stackTrace: trace);
      return Result.error(
        failure: FlavorizingFailure(FlavorizingFailureType.exception),
      );
    }
  }

  Future<void> _injectFlavors(
    FlavorGeneratorParams params,
    String org,
    bool isIOsEnabled,
    bool isAndroidEnabled,
    bool isMacOsEnabled,
  ) async {
    ///START:Flavorizer config injection
    final isFlavorized = params.flavors.isNotEmpty;

    final isGenerated = _isGenerated(params.projectFolder);

    final name = params.projectFolder;

    final projectName = name.split('/').last;

    final pubspecFile = File('$name/pubspec.yaml');
    if (!pubspecFile.existsSync()) return;
    final pubspecFileContent = await pubspecFile.readAsString();
    if (isFlavorized) {
      final flavors = params.flavors.toList();

      final lines = List<String>.empty(growable: true)
        ..add('flavorizr:')
        ..add('  app:')
        ..add('    android:')
        ..add('      flavorDimensions: "flavor-type"')
        ..add('')
        ..add('  flavors:');
      for (final flavor in flavors) {
        final packageSuffix = flavor.toLowerCase() == 'prod' ? '' : '.$flavor';
        final nameSuffix =
            flavor.toLowerCase() == 'prod' ? '' : ' ${flavor.titleCase}';
        lines
          ..add('    $flavor:')
          ..add('      app:')
          ..add('        name: "${projectName.titleCase}$nameSuffix"')
          ..add('');
        if (isAndroidEnabled) {
          lines
            ..add('      android:')
            ..add('        applicationId: "$org.$projectName$packageSuffix"')
            ..add(
              isGenerated
                  ? '        icon: "flavor_assets/$flavor/launcher_icons/ic_launcher.png"'
                  : '',
            )
            ..add('');
        }
        if (isIOsEnabled) {
          lines
            ..add('      ios:')
            ..add('        bundleId: "$org.$projectName$packageSuffix"')
            ..add(
              isGenerated
                  ? '        icon: "flavor_assets/$flavor/launcher_icons/ic_launcher.png"'
                  : '',
            )
            ..add('');
        }
        if (isMacOsEnabled) {
          lines
            ..add('      macos:')
            ..add('        bundleId: "$org.$projectName$packageSuffix"')
            ..add(
              isGenerated
                  ? '        icon: "flavor_assets/$flavor/launcher_icons/ic_launcher.png"'
                  : '',
            )
            ..add('');
        }

        lines.add('');
      }
      final flavorLines = lines.join('\n');

      var flavorContent = '';

      if (isGenerated) {
        flavorContent = pubspecFileContent.replaceAll(
          flavorizrInjectKey,
          flavorLines,
        );
      } else {
        flavorContent = [pubspecFileContent, flavorLines].join('\n');
      }
      pubspecFile.writeAsStringSync(flavorContent);
    } else {
      flavorizrInjectKey.replaceAll(flavorizrInjectKey, '');
      pubspecFile.writeAsStringSync(pubspecFileContent);
    }

    ///END:Flavorizer config injection
  }

  Future<String> _getOrg(String name) async {
    final appBuildGradleFile = File('$name/android/app/build.gradle');
    var pbxProjFile = File('$name/ios/Runner.xcodeproj/project.pbxproj');

    if (!pbxProjFile.existsSync()) {
      pbxProjFile = File('$name/macos/Runner.xcodeproj/project.pbxproj');
    }

    if (appBuildGradleFile.existsSync()) {
      final appBuildGradleContent = await appBuildGradleFile.readAsString();
      final appBuildGradleContentLines = appBuildGradleContent.split('\n');

      final applicationIdLine = appBuildGradleContentLines
          .firstWhereOrNull((element) => element.contains('applicationId = '));

      if (applicationIdLine != null) {
        final lines = applicationIdLine
            .split('applicationId = ')
            .last
            .replaceAll('"', '')
            .split('.');

        return lines.sublist(0, lines.length - 1).join('.');
      }
    }

    if (pbxProjFile.existsSync()) {
      final pbxProjContent = await pbxProjFile.readAsString();
      final pbxProjContentLines = pbxProjContent.split('\n');

      final applicationIdLines = pbxProjContentLines
          .where((element) => element.contains('PRODUCT_BUNDLE_IDENTIFIER = '))
          .map(
            (e) => e
                .replaceFirst('.RunnerTests', '')
                .replaceLast(';', '')
                .split('PRODUCT_BUNDLE_IDENTIFIER = ')
                .last
                .split('.'),
          )
          .toSet();

      if (applicationIdLines.isEmpty) return '';

      var orgSegments = applicationIdLines.first.toSet();

      for (final org in applicationIdLines) {
        orgSegments = orgSegments.intersection(org.toSet());
      }

      return orgSegments.toList().getRange(0, orgSegments.length - 1).join('.');
    }

    return '';
  }

  bool _isGenerated(String projectFolder) {
    final pubspecFile = File('$projectFolder/pubspec.yaml');

    return pubspecFile.existsSync() &&
        pubspecFile.readAsStringSync().contains('#generated with mason');
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
