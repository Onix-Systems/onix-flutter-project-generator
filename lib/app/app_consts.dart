class AppConsts {
  static const String releaseUri =
      'https://github.com/Onix-Systems/onix-flutter-project-generator/releases';

  static const String repoUrl =
      'https://github.com/Onix-Systems/onix-flutter-project-generator';

  static const String signingKeyPassChars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  static const String sshPermissionsTutorialUri =
      'https://apple.stackexchange.com/questions/48502/how-can-i-permanently-add-my-ssh-private-key-to-keychain-so-it-is-automatically/250572#250572';

  static const String figmaBaseUrl = 'https://api.figma.com/v1';

  static const String figmaStylesFirstCharValidChars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

  static const String figmaStylesValidChars = signingKeyPassChars;

  static const Set<String> defaultFlavors = {'dev', 'prod'};

  static const String mainDartPath = 'lib/app/flavors/';

  static const List<String> defaultSigningVars = [
    'Your Name',
    'Department',
    'Your Company',
    'Your City',
    'Your State or Province',
    'UA',
    '',
  ];

  static RegExp organizationRegExp = RegExp(
    r'^[a-z]([a-z0-9]*[a-z0-9])*(\.[a-z]([a-z0-9]*[a-z0-9])*)+$',
  );

  static RegExp projectNameRegExp = RegExp(
    r'^(?!_)(?![0-9])[a-z0-9]+(?:_[a-z0-9]+)*(?<!_)$',
  );

  static RegExp organizationInputRegExp = RegExp('[a-z0-9.]');

  static RegExp projectNameInputRegExp = RegExp('[a-z0-9_]');

  static RegExp digitsAndLatinWithSpaceOnly = RegExp(r'[a-zA-Z\d ]');

  const AppConsts._();
}
