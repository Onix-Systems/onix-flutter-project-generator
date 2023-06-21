extension ReplaceLast on String {
  String replaceLast(String from, String to) {
    if (endsWith(from)) {
      final startIndex = lastIndexOf(from);
      if (startIndex == -1) {
        return this;
      }
      final before = substring(0, startIndex);
      final after = substring(startIndex + from.length);
      return '$before$to$after';
    }
    return this;
  }

  String stripRequestResponse() {
    return replaceLast('Request', '')
        .replaceLast('Response', '')
        .replaceLast('_request', '')
        .replaceLast('_response', '');
  }
}
