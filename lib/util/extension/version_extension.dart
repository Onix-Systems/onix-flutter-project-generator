extension VersionExtension on String {
  int asIntVersion() {
    final versionClear = replaceAll('.', '');
    final versionMissedSymbols = 4 - versionClear.length;
    final addition = [''];
    if (versionMissedSymbols > 0) {
      for (var i = 0; i < versionMissedSymbols; i++) {
        addition.add('0');
      }
    }
    final fixedVersion = '$versionClear${addition.join()}';
    return int.parse(fixedVersion);
  }
}
