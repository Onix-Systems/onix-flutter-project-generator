class JsonClassVariable {
  final String dartType;
  final String name;
  final bool nullable;

  JsonClassVariable({
    required this.dartType,
    required this.name,
    this.nullable = true,
  });
}