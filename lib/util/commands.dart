class Commands {
  static const _brickHeadName = 'feat/documentation'; //main if default
  static const _projectTempSourceFolderPrefix =
      'feat-documentation'; // main is default;

  ///common commands
  static String getCompletedWithCode0Command() =>
      'echo "Complete with exit code: 0"';

  static String getOpenAndroidStudioCommand() =>
      'open -a \'Android Studio.app\' .';

  ///flutter and Dart commands
  static String getBuildRunnerBuildCommand() =>
      'dart run build_runner build --delete-conflicting-outputs';

  static String getDartImportSortCommand() =>
      'dart run import_sorter:main --no-comments';

  static String getDartFormatCommand() => 'dart format .';

  ///brick and mason commands
  static String getDownloadBrickCodeCommand() =>
      'curl -L https://github.com/Onix-Systems/onix-flutter-project-generator/archive/refs/heads/$_brickHeadName.zip --output brick.zip && unzip -qq brick.zip -d bricks && rm brick.zip';

  static String getMasonActivateCommand() =>
      'dart pub global activate mason_cli && mason cache clear';

  static String getMasonAddBrickCommand(String projectPath) =>
      'mason add -g flutter_clean_base --path \'$projectPath/bricks/onix-flutter-project-generator-$_projectTempSourceFolderPrefix/bricks/flutter_clean_base\'';

  static String getMasonMakeBrickCommand() =>
      'mason make flutter_clean_base -c config.json --on-conflict overwrite';
}
