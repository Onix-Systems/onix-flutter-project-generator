extension DynamicExtension on Map<String, dynamic> {
  List<String> asStringList(String key) {
    return (this[key] as List<dynamic>).map((e) => e as String).toList();
  }

  List<Map<String, dynamic>> asObjectList(String key) {
    return (this[key] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList();
  }
}
