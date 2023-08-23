class AppConsts {
  static const String gitUri =
      'git@gitlab.onix.ua:onix-systems/flutter-project-generator.git';

  static const String gitBranch = 'master';

  static const String releaseUri =
      'https://gitlab.onix.ua/onix-systems/flutter-project-generator/-/blob/$gitBranch/release/Onix%20Flutter%20Project%20Generator.dmg';

  static const String signingKeyPassChars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  static const String buildCmd =
      'dart run build_runner build --delete-conflicting-outputs';

  static const String sshPermissionsTutorialUri =
      'https://apple.stackexchange.com/questions/48502/how-can-i-permanently-add-my-ssh-private-key-to-keychain-so-it-is-automatically/250572#250572';
}
