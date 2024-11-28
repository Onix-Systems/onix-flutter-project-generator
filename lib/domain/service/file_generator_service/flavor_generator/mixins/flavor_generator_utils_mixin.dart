import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/params/flavor_generator_params.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

mixin FlavorGeneratorUtilsMixin
    on BaseGenerationService<Result<int>, FlavorGeneratorParams> {
  Future<String> getOrg(String name) async {
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

  Future<void> copyIcons(
    String projectPath,
    String flavor,
    FlavorGeneratorParams params,
  ) async {
    await Directory('$projectPath/flavor_assets/$flavor/launcher_icons')
        .create(recursive: true);
    switch (flavor) {
      case 'dev':
      case 'prod':
        await _iconCopy(
          src: '$projectPath/assets/launcher_icons/ic_launcher_$flavor.png',
          altSrc: '$projectPath/assets/launcher_icons/ic_launcher.png',
          dst:
              '$projectPath/flavor_assets/$flavor/launcher_icons/ic_launcher.png',
        );

        await _iconCopy(
          src: '$projectPath/assets/android12splash_$flavor.png',
          altSrc: '$projectPath/assets/android12splash.png',
          dst: '$projectPath/flavor_assets/$flavor/android12splash.png',
        );

      default:
        await _iconCopy(
          src: '$projectPath/assets/launcher_icons/ic_launcher.png',
          dst:
              '$projectPath/flavor_assets/$flavor/launcher_icons/ic_launcher.png',
          removeSrc: flavor == params.flavors.last,
        );
    }
  }

  Future<void> _iconCopy({
    required String src,
    required String dst,
    String? altSrc,
    bool removeSrc = true,
  }) async {
    var srcFile = File(src);

    final srcFileExists = srcFile.existsSync();

    ///Case when default flavor icons were removed
    if (!srcFileExists) {
      if (altSrc == null) {
        return;
      }

      srcFile = File(altSrc);

      ///Case when default icon was removed
      if (!srcFile.existsSync()) {
        return;
      }
    }

    await srcFile.copy(dst);

    if (srcFileExists && removeSrc) {
      ///Remove default flavor icon
      await srcFile.delete();
    }
  }

  Future<void> correctApple({
    required String projectPath,
    required String flavor,
    required bool isGenerated,
    required String platform,
  }) async {
    for (final run in ['Debug', 'Profile', 'Release']) {
      final file = File('$projectPath/$platform/Flutter/$flavor$run.xcconfig');
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

  Future<void> createFlavorBannerWidget({
    required String projectPath,
    required String projectName,
    required bool isGenerated,
    required ArchType? archType,
  }) async {
    final flavorBannerWidgetContent = '''
import 'package:flutter/material.dart';
import 'package:$projectName/flavors.dart';

class FlavorBanner extends StatelessWidget {
  const FlavorBanner({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (F.name == 'prod') return child;
     return Banner(
            message: F.name,
            location: BannerLocation.topEnd,
            child: child,
        );
  }
}
''';

    String flavorBannerFilePath;

    if (isGenerated) {
      flavorBannerFilePath =
          '$projectPath/lib/core/arch/widget/common/flavor_banner.dart';

      if (archType == ArchType.basic) {
        flavorBannerFilePath =
            '$projectPath/lib/presentation/widget/common/flavor_banner.dart';
      }

      final appFile = File('$projectPath/lib/app/app.dart');

      var appFileContent = await appFile.readAsString();

      appFileContent = appFileContent
          .replaceAll(
            'child: widget ?? const SizedBox(),',
            'child: FlavorBanner(child: widget ?? const SizedBox(),),',
          )
          .replaceAll(
            'class App extends StatefulWidget {',
            "import 'package:${flavorBannerFilePath.replaceAll('$projectPath/lib', projectName)}';\n\nclass App extends StatefulWidget {",
          );

      await appFile.writeAsString(appFileContent);
    } else {
      flavorBannerFilePath = '$projectPath/lib/flavor_banner.dart';
    }

    final flavorBannerFile = await File(flavorBannerFilePath).create(
      recursive: true,
    );
    await flavorBannerFile.writeAsString(flavorBannerWidgetContent);
  }

  Future<void> clean({
    required String projectPath,
    required bool isGenerated,
  }) async {
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
  }
}
