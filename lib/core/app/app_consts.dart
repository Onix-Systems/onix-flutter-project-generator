abstract final class AppConsts {
  static const String releaseUri =
      'https://github.com/Onix-Systems/onix-flutter-project-generator/releases';

  static const String signingKeyPassChars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  static const String sshPermissionsTutorialUri =
      'https://apple.stackexchange.com/questions/48502/how-can-i-permanently-add-my-ssh-private-key-to-keychain-so-it-is-automatically/250572#250572';

  static const String figmaBaseUrl = 'https://api.figma.com/v1';

  static const String figmaStylesFirstCharValidChars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

  static const String figmaStylesValidChars = signingKeyPassChars;

  static const Set<String> defaultFlavors = {'dev', 'prod'};

  static const String mainDartPath = 'lib/core/flavors/';

  static const List<String> defaultSigningVars = [
    'Your Name',
    'Department',
    'Your Company',
    'Your City',
    'Your State or Province',
    'UA',
    '',
  ];
}
