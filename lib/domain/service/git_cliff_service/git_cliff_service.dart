import 'dart:io';

import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/git_cliff_service/enums/git_cliff_asset.dart';
import 'package:onix_flutter_bricks/domain/service/git_cliff_service/params/git_cliff_params.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:onix_flutter_bricks/util/makefile/makefile_content.dart';
import 'package:onix_flutter_bricks/util/makefile/makefile_line.dart';

class GitCliffService implements BaseGenerationService<String> {
  @override
  Future<String> generate(BaseGenerationParams params) async {
    if (params is! GitCliffParams) {
      return 'Incorrect params';
    }

    try {
      await _copyAndPasteFiles(params);
      await _updateMainMakeFile(params);
      return '';
    } catch (e, s) {
      logger.e(e, stackTrace: s);
      return e.toString();
    }
  }

  Future<void> _copyAndPasteFiles(GitCliffParams params) async {
    final projectPath = params.projectFullPath;
    for (final asset in GitCliffAsset.values) {
      final contents = await rootBundle.loadString(asset.fullAssetPath);

      final path = await File(asset.getOutputPath(projectPath: projectPath))
          .create(recursive: true);

      await path.writeAsString(contents);
    }
  }

  Future<void> _updateMainMakeFile(GitCliffParams params) async {
    final file = File('${params.projectFullPath}/Makefile');

    if (!file.existsSync()) {
      await file.create();
    }

    final contents = await file.readAsLines();

    if (contents.isNotEmpty) {
      contents.addNewLine();
    }

    const makefile = MakefileContent(
      commands: [
        MakefileLine(
          name: 'release_notes',
          commands: [
            '@git cliff --latest -c cliff_txt.toml -o release_notes.txt',
          ],
        ),
        MakefileLine(
          name: 'full_releases_history',
          commands: [
            '@git cliff -c cliff_md.toml -o full_releases_history.md',
          ],
        )
      ],
    );

    contents.addAll(makefile.convertCommandsToListString());

    await file.writeAsString(contents.join('\n'));
  }
}
