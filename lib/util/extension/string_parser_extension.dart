extension StringParserExtension on String {
  Set<String> flavorStringToSet() => contains(' ')
      ? toLowerCase().trim().replaceAll(RegExp(' +'), ' ').split(' ').toSet()
      : {toLowerCase()};
}
