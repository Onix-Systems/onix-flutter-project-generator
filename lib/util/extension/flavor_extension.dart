extension FlavorExtension on String {
  Set<String> flavorStringToSet() => contains(' ')
      ? toLowerCase().trim().replaceAll(RegExp(' +'), ' ').split(' ').toSet()
      : {toLowerCase()};

  bool isFlavorCompatiblePlatform() =>
      this == 'android' || this == 'ios' || this == 'macos';
}
