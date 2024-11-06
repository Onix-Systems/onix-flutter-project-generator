import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/platforms_list/platforms_list.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/flavor_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/params/flavor_generator_params.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:recase/recase.dart';

mixin FlavorInjectorMixin
    on BaseGenerationService<Result<int>, FlavorGeneratorParams> {
  Future<void> injectFlavors({
    required FlavorGeneratorParams params,
    required String org,
    required PlatformsList platformsList,
    required bool isGenerated,
  }) async {
    const flavorizrInjectKey = FlavorGenerator.flavorizrInjectKey;

    ///START:Flavorizer config injection
    final isFlavorized = params.flavors.isNotEmpty;

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
        for (final platform in platformsList.asList()) {
          lines
            ..add('      $platform:')
            ..add(
                '        ${platform == 'android' ? 'applicationId' : 'bundleId'}: "$org.$projectName$packageSuffix"')
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
}
