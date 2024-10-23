extension VersionExtension on String {
  int asIntVersion() {
    final versionClear = replaceAll('.', '');
    final versionMissedSymbols = 4 - versionClear.length;
    var addition = '';
    if (versionMissedSymbols > 0) {
      for (var i = 0; i < versionMissedSymbols; i++) {
        addition += '0';
      }
    }
    final fixedVersion = '$versionClear$addition';
    return int.parse(fixedVersion);
  }
}
