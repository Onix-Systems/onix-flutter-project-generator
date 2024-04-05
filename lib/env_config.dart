

class EnvConfig {
  ///This is name of branch from there Mason brick will be downloaded
  static const masonBrickBranchName = 'feat/documentation'; //main if default
  static String masonBrickBranchFolder() =>
      masonBrickBranchName.replaceAll('/', '-'); // main is default;
}
