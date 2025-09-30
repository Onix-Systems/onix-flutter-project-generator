import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';

class Commands {
  ///common commands
  static String getCompletedWithCode0Command() =>
      'echo "Complete with exit code: 0"';

  static String getOpenAndroidStudioCommand() =>
      "open -a 'Android Studio.app' .";

  static String getGitBranchesCommand() =>
      'git ls-remote https://github.com/Onix-Systems/onix-flutter-project-generator.git';

  ///flutter and Dart commands
  static String getBuildRunnerBuildCommand() =>
      'dart run build_runner build --delete-conflicting-outputs';

  static String getDartImportSortCommand() =>
      'dart run import_sorter:main --no-comments';

  static String getDartFormatCommand() => 'dart format .';

  ///brick and mason commands
  static String getDownloadBrickCodeCommand({
    required String masonBrickBranch,
  }) =>
      'curl -L ${AppConsts.repoUrl}/archive/refs/heads/$masonBrickBranch.zip --output brick.zip && unzip -qq brick.zip -d bricks && rm brick.zip';

  static String getMasonActivateCommand() =>
      'dart pub global activate mason_cli && mason cache clear';

  static Future<String> getMasonAddBrickCommand({
    required String projectPath,
    required String masonBrickBranch,
    required String brickArch,
  }) async {
    final branchFolder = masonBrickBranch.replaceAll('/', '-');
    var path = "'$projectPath/bricks/onix-flutter-project-generator-"
        "$branchFolder/bricks/flutter_${brickArch}_base'";

    if (kDebugMode) {
      try {
        final result = await Process.run('pwd', []);
        if (result.exitCode == 0 &&
            result.stdout != null &&
            result.stdout.toString().trim().isNotEmpty) {
          path =
              "'${result.stdout.toString().trim()}/bricks/flutter_${brickArch}_base'";
        } else {
          logger.e(
            'Could not get current directory path, using default path.',
          );
        }
      } catch (e) {
        logger.e('Error getting current directory: $e');
      }
    }

    return 'mason add -g flutter_${brickArch}_base --path $path';
  }

  static String getMasonMakeBrickCommand({required String brickArch}) =>
      'mason make flutter_${brickArch}_base -c config.json '
      '--on-conflict overwrite';
}
