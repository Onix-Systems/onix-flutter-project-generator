extension CoontentKeyExtension on String {
  bool isValidResponseContentKey() {
    return contains('*/*') || contains('application/json');
  }
}
