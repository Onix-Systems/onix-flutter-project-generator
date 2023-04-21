abstract class BaseParser {
  String get basePath;

  Future<void> parse(Map<String, dynamic> data);
}
