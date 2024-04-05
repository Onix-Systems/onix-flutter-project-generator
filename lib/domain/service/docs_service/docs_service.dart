import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/docs_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/enum/document_type.dart';

class DocsService extends BaseGenerationService {
  final _appNamePattern = '{app_name}';
  final _flavorsPattern = '{app_flavors}';
  final _platformsPattern = '{app_platforms}';
  final _outputTypesPattern = '{output_types}';
  final _mainFilesPattern = '{app_main_files}';
  final _envFilesPattern = '{app_env_files}';
  final _envExplanationPattern = '{app_env_explanation}';
  final _mainCountDescription = '{main_count_description}';

  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! DocsGenerationParams) {
      return false;
    }
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
      return true;
    } catch (e, trace) {
      logger.e(e, stackTrace: trace);
      return false;
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
    if (doc == DocumentType.installInstructions) {
      final flavors = params.flavors.join('\n');
      final platforms = params.platforms.map((e) => '* $e').join('\n');
      final commands = params.commands.join('\n');
      final mainFiles =
          params.flavors.map((e) => _getMainFileForFlavor(e)).join('\n');
      final envFiles =
          params.flavors.map((e) => _getEnvFileForFlavor(e)).join('\n');
      final envExplanation = _getExplanationText(params.flavors);
      final mainCountDescription = _getMainCountText(params.flavors);
      final output = input
          .replaceAll(_appNamePattern, params.projectName)
          .replaceAll(_flavorsPattern, flavors)
          .replaceAll(_platformsPattern, platforms)
          .replaceAll(_outputTypesPattern, commands)
          .replaceAll(_mainFilesPattern,
              flavors.isNotEmpty ? mainFiles : '/lib/main.dart')
          .replaceAll(_envFilesPattern, flavors.isNotEmpty ? envFiles : '.env')
          .replaceAll(_envExplanationPattern, envExplanation)
          .replaceAll(_mainCountDescription, mainCountDescription);
      return output;
    }

    return input.replaceAll(_appNamePattern, params.projectName);
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
}
