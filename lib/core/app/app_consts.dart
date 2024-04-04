class AppConsts {
  static const String releaseUri =
      'https://github.com/Onix-Systems/onix-flutter-project-generator/releases';

  static const String signingKeyPassChars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  static const String buildCmd =
      'dart run build_runner build --delete-conflicting-outputs';

  static const String sshPermissionsTutorialUri =
      'https://apple.stackexchange.com/questions/48502/how-can-i-permanently-add-my-ssh-private-key-to-keychain-so-it-is-automatically/250572#250572';

  static const String figmaBaseUrl = 'https://api.figma.com/v1';

  static const String figmaStylesFirstCharValidChars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

  static const String figmaStylesValidChars = signingKeyPassChars;

  static const Set<String> defaultFlavors = {'dev', 'prod'};
}
