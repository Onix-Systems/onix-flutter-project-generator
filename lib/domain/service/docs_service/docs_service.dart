import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/enum/document_type.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/params/docs_generation_params.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:onix_flutter_bricks/util/extension/flavor_extension.dart';
import 'package:recase/recase.dart';

class DocsService
    implements BaseGenerationService<String, DocsGenerationParams> {
  final flavorsTitle =
      '* **Flavor** - type of application configuration. Flavored 2 supports following flavors:';
  final _appNamePattern = '{app_name}';
  final _flavorsPattern = '{app_flavors}';
  final _platformsPattern = '{app_platforms}';
  final _outputTypesPattern = '{output_types}';
  final _mainFilesPattern = '{app_main_files}';
  final _envFilesPattern = '{app_env_files}';
  final _envExplanationPattern = '{app_env_explanation}';
  final _mainCountDescription = '{main_count_description}';
  final _platformPackageNames = '{platform_package_names}';
  final _flavorizrInstructions = '{flavorizr_instructions}';

  @override
  Future<String> generate(DocsGenerationParams params) async {
    try {
      final projectPath = '${params.projectPath}/${params.projectName}';
      //remove existing readme.md
      await File('$projectPath/README.md').delete();
      //create required doc folders
      await _createFolders(params);
      //iterate all docs files
      for (var doc in DocumentType.values) {
        //copy each file to project with including project specifications
        await _copyToProject(
          projectPath,
          doc,
          params,
        );
      }
      return '';
    } catch (e, trace) {
      logger.e(e, stackTrace: trace);
      return e.toString();
    }
  }

  Future<Directory> _createFolders(DocsGenerationParams params) async {
    return Directory(
            '${params.projectPath}/${params.projectName}/docs/dev_solutions/')
        .create(recursive: true);
  }

  Future<void> _copyToProject(
    String projectPath,
    DocumentType doc,
    DocsGenerationParams params,
  ) async {
    final fileContent = await rootBundle.loadString(doc.fullPath);
    final updatedContent = await _replaceFileContent(
      fileContent,
      doc,
      params,
    );
    final directoryPath = '$projectPath/${doc.relativePath}';
    final outputFile = await File('$directoryPath/${doc.fileName}').create();
    await outputFile.writeAsString(updatedContent);
  }

  Future<String> _replaceFileContent(
    String input,
    DocumentType doc,
    DocsGenerationParams params,
  ) async {
    final projectNamePrettified = params.projectName.titleCase;
    if (doc == DocumentType.techDescription) {
      String output = input;
      if (params.flavorize) {
        final lines = List<String>.empty(growable: true);
        lines.add('## Flavorizr');
        lines.addNewLine();
        lines.add(
            'Project uses [Flavorizr](https://pub.dev/packages/flutter_flavorizr) package to create flavors configuration in native mobile projects.');
        lines.add(
            'Flavorizr configuration declared in `pubspec.yaml` file in `flavorizr` section.');
        lines.add(
            'When you changing something in `flavorizr` configuration make sure to regenerate configurations to apply changes using command:');
        lines.add('```');
        lines.add('flutter pub run flutter_flavorizr');
        lines.add('```');
        lines.addNewLine();
        final content = lines.join('\n');
        output = input.replaceAll(_flavorizrInstructions, content);
      } else {
        output = input.replaceAll(_flavorizrInstructions, '');
      }
      return output;
    } else if (doc == DocumentType.readme) {
      final packages = List<String>.empty(growable: true);
      for (var platform in params.platforms) {
        if (platform.isFlavorCompatiblePlatform()) {
          final prefix = '* **${platform.toUpperCase()}**\n\n';
          final package = _getPackageIdDeclarations(
            params.organization,
            params.projectName,
            params.flavors,
          );
          packages.add('$prefix\n$package\n');
        }
      }
      final output = input
          .replaceAll(_appNamePattern, projectNamePrettified)
          .replaceAll(_platformPackageNames, packages.join('\n'));
      return output;
    } else if (doc == DocumentType.installInstructions) {
      final flavorsLines = List<String>.empty(growable: true);
      if (params.flavorize) {
        flavorsLines.add(flavorsTitle);
        flavorsLines.addNewLine();
        flavorsLines.add('```');
        flavorsLines.add(params.flavors.join('\n'));
        flavorsLines.add('```');
        flavorsLines.addNewLine();
      }
      final flavors = flavorsLines.join('\n');
      final platforms = params.platforms.map((e) => '* $e').join('\n');
      final commands = params.commands.join('\n');
      final mainFiles =
          params.flavors.map((e) => _getMainFileForFlavor(e)).join('\n');
      final envFiles =
          params.flavors.map((e) => _getEnvFileForFlavor(e)).join('\n');
      final envExplanation = _getExplanationText(params.flavors);
      final mainCountDescription = _getMainCountText(params.flavors);
      final output = input
          .replaceAll(_appNamePattern, projectNamePrettified)
          .replaceAll(_flavorsPattern, flavors)
          .replaceAll(_platformsPattern, platforms)
          .replaceAll(_outputTypesPattern, commands)
          .replaceAll(_mainFilesPattern,
              flavors.isNotEmpty ? mainFiles : '/lib/main.dart')
          .replaceAll(_envFilesPattern, flavors.isNotEmpty ? envFiles : '.env')
          .replaceAll(_envExplanationPattern, envExplanation)
          .replaceAll(_mainCountDescription, mainCountDescription);
      if (!params.flavorize) {
        return output.replaceAll(' --flavor {flavor}', '');
      }
      return output;
    }

    return input.replaceAll(_appNamePattern, projectNamePrettified);
  }

  String _getMainFileForFlavor(String flavor) => '/lib/app/main_$flavor.dart';

  String _getEnvFileForFlavor(String flavor) => '.env_$flavor';

  String _getExplanationText(Set<String> flavors) {
    String envExplanation =
        'This file should contain all project required public API and services keys and other sensitive information. ';
    if (flavors.isEmpty) {
      envExplanation +=
          '`.env` file contains environment variables for a application configuration. ';
      return envExplanation;
    }

    for (var flavor in flavors) {
      final flavorExplanation =
          '`.env_$flavor` file contains environment variables for a `$flavor` configuration (flavor). ';
      envExplanation += flavorExplanation;
    }
    return envExplanation;
  }

  String _getMainCountText(Set<String> flavors) {
    if (flavors.isEmpty) {
      return 'This applications don\'t have any flavors, so there only one entry point `main.dart` file';
    }
    return 'This applications have ${flavors.length} flavors, so it have ${flavors.length} different entry points and `main.dart` files';
  }

  String _getPackageIdDeclarations(
    String org,
    String name,
    Set<String> flavors,
  ) {
    if (flavors.isEmpty) {
      return '`$org.$name`';
    }
    String output = '';
    for (var e in flavors) {
      final packageNamePrefix = '* ${e.titleCase} `';
      final packageNameSuffix = e == 'prod' ? '' : '.$e';
      output += packageNamePrefix;
      output += '$org.$name$packageNameSuffix`\n';
    }
    return output;
  }
}
