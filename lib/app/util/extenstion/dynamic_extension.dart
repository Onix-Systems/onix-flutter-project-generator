extension DynamicExtension on Map<String, dynamic> {
  List<String> asStringList(String key) {
    return (this[key] as List<dynamic>).map((e) => e as String).toList();
  }

  List<Map<String, dynamic>> asObjectList(String key) {
    return (this[key] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList();
  }

  List<String> getTagsFromRequests() {
    final tags = List<String>.empty(growable: true);
    forEach(
      (key, value) {
        final requestTags =
            (value as Map<String, dynamic>).asStringList('tags');
        if (requestTags.isNotEmpty) {
          final tagName = requestTags.first;

          if (!tags.contains(tagName)) {
            tags.add(tagName);
          }
        }
      },
    );
    return tags;
  }
}
