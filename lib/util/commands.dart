class Commands {
  ///common commands
  static String getCompletedWithCode0Command() =>
      'echo "Complete with exit code: 0"';

  static String getOpenAndroidStudioCommand() =>
      'open -a \'Android Studio.app\' .';

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
      'curl -L https://github.com/Onix-Systems/onix-flutter-project-generator/archive/refs/heads/$masonBrickBranch.zip --output brick.zip && unzip -qq brick.zip -d bricks && rm brick.zip';

  static String getMasonActivateCommand() =>
      'dart pub global activate mason_cli && mason cache clear';

  static String getMasonAddBrickCommand({
    required String projectPath,
    required String masonBrickBranch,
  }) {
    final branchFolder = masonBrickBranch.replaceAll('/', '-');
    return 'mason add -g flutter_clean_base --path \'$projectPath/bricks/onix-flutter-project-generator-$branchFolder/bricks/flutter_clean_base\'';
  }

  static String getMasonMakeBrickCommand() =>
      'mason make flutter_clean_base -c config.json --on-conflict overwrite';
}
