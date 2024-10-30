import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/flavorizing_failure.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/params/flavor_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
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

      final name = params.projectFolder;

      final projectName = name.split('/').last;

      final isIOsEnabled = Directory('$name/ios').existsSync();

      final isAndroidEnabled = Directory('$name/android').existsSync();

      final isMacOsEnabled = Directory('$name/macos').existsSync();

      await _injectFlavors(
        params,
        org,
        isIOsEnabled,
        isAndroidEnabled,
        isMacOsEnabled,
      );

      final isGenerated = _isGenerated(name);

      ///Manipulations with icons
      if (isGenerated) {
        await Directory('$name/flavor_assets').create(recursive: true);

        for (final flavor in params.flavors) {
          await Directory('$name/flavor_assets/$flavor/launcher_icons')
              .create(recursive: true);
          switch (flavor) {
            case 'dev':
            case 'prod':
              var srcFile =
                  File('$name/assets/launcher_icons/ic_launcher_$flavor.png');
              await srcFile.copy(
                  '$name/flavor_assets/$flavor/launcher_icons/ic_launcher.png');

              await srcFile.delete();

              srcFile = File('$name/assets/android12splash_$flavor.png');
              await srcFile
                  .copy('$name/flavor_assets/$flavor/android12splash.png');

              await srcFile.delete();

            default:
              var srcFile = File('$name/assets/launcher_icons/ic_launcher.png');
              await srcFile.copy(
                  '$name/flavor_assets/$flavor/launcher_icons/ic_launcher.png');
              if (flavor == params.flavors.last) {
                await srcFile.delete();
              }

              srcFile = File('$name/assets/android12splash.png');
              await srcFile
                  .copy('$name/flavor_assets/$flavor/android12splash.png');

              if (flavor == params.flavors.last) {
                await srcFile.delete();
              }
          }
        }
      }

      ///Save main.dart content
      var mainFileContent = File('$name/lib/main.dart').readAsStringSync();

      final addFlavorizrProc = await Process.start(
        'flutter',
        ['pub', 'add', '-d', 'flutter_flavorizr'],
        workingDirectory: name,
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
        workingDirectory: name,
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
          final makeFlavorFile = await File(
                  '$name/.idea/runConfigurations/${isGenerated ? 'make-' : ''}$flavor.xml')
              .create();

          var makeContent = '';

          if (isGenerated) {
            makeContent = '''
<component name="ProjectRunConfigurationManager">
    <configuration default="false" name="make-$flavor" type="MAKEFILE_TARGET_RUN_CONFIGURATION" factoryName="Makefile">
        <makefile filename="\$PROJECT_DIR\$/Makefile" target="$flavor" workingDirectory="" arguments="">
            <envs />
        </makefile>
        <method v="2" />
    </configuration>
</component>
      ''';
          } else {
            makeContent = '''
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="$flavor" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="buildFlavor" value="$flavor" />
    <option name="filePath" value="\$PROJECT_DIR\$/lib/flavors/main_$flavor.dart" />
  </configuration>
</component>
''';
          }

          await makeFlavorFile.writeAsString(makeContent);

          if (isGenerated) {
            final makeFile = File('$name/Makefile');

            final makeFileContent = await makeFile.readAsString();

            await makeFile.writeAsString('''
$makeFileContent

$flavor:
\t@echo "Building for $flavor"
\t@echo "Copying ${flavor}_assets to \$(ASSETS_DIR)"
\t@cp -r \$(ROOT_DIR)/flavor_assets/$flavor/* \$(ASSETS_DIR)
\tdart run flutter_native_splash:create
''');
          }

          await Directory('$name/lib/${isGenerated ? 'app/' : ''}flavors')
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
                'runApp(const MyApp());', 'runApp(const App());');

            var appContent = await File('$name/lib/app.dart').readAsString();

            appContent = appContent
                .replaceAll(
                  'MyHomePage()',
                  'const MyApp()',
                )
                .replaceAll(
                    "import 'pages/my_home_page.dart';", "import 'main.dart';");
            await File('$name/lib/app.dart').writeAsString(appContent);
          }

          await File('$name/lib/main.dart').writeAsString(mainFileContent);

          await Process.run(
            'mv',
            [
              '$name/lib/main_$flavor.dart',
              '$name/lib/${isGenerated ? 'app/' : ''}flavors/main_$flavor.dart',
            ],
          );

          var mainFlavorFileContent = File(
                  '$name/lib/${isGenerated ? 'app/' : ''}flavors/main_$flavor.dart')
              .readAsStringSync();

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
                  '$name/lib/${isGenerated ? 'app/' : ''}flavors/main_$flavor.dart')
              .writeAsString(mainFlavorFileContent);

          if (isIOsEnabled) {
            for (final run in ['Debug', 'Profile', 'Release']) {
              final file = File('$name/ios/Flutter/$flavor$run.xcconfig');
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
          workingDirectory: '$name/lib',
        );
        await Process.run(
          'rm',
          ['main_dart.xml'],
          workingDirectory: '$name/.idea/runConfigurations',
        );
        if (isGenerated) {
          await Process.run(
            'rm',
            ['ic_launcher.png'],
            workingDirectory: '$name/assets/launcher_icons',
          );
          await Process.run(
            'rm',
            ['app.dart'],
            workingDirectory: '$name/lib',
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
          .map((e) => e.split('PRODUCT_BUNDLE_IDENTIFIER = ').last.split('.'))
          .toSet();

      if (applicationIdLines.isEmpty) return '';

      var orgSegments = applicationIdLines.first.toSet();

      for (final org in applicationIdLines) {
        orgSegments = orgSegments.intersection(org.toSet());
      }

      return orgSegments.join('.');
    }

    return '';
  }

  bool _isGenerated(String projectFolder) {
    final pubspecFile = File('$projectFolder/pubspec.yaml');

    return pubspecFile.existsSync() &&
        pubspecFile.readAsStringSync().contains('#generated with mason');
  }
}
