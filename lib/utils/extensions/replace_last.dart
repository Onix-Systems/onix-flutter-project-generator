extension ReplaceLast on String {
  String replaceLast(String from, String to) {
    final startIndex = lastIndexOf(from);
    if (startIndex == -1) {
      return this;
    }
    final before = substring(0, startIndex);
    final after = substring(startIndex + from.length);
    return before + to + after;
  }
}
