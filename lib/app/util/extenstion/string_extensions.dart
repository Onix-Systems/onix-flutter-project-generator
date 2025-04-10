extension ClearString on String {
  String clearSpaces() {
    var result = this;
    while (result.contains('  ')) {
      result = result.replaceAll('  ', ' ');
    }
    return result;
  }
}
