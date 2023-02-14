class EntityEntity {
  late int id;
  String name;
  bool generateRequest;
  bool generateResponse;
  bool generateRepository;

  EntityEntity({
    required this.name,
    this.generateRequest = false,
    this.generateResponse = false,
    this.generateRepository = false,
  }) {
    id = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityEntity &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'EntityEntity{id: $id, name: $name, generateRequest: $generateRequest, generateResponse: $generateResponse, generateRepository: $generateRepository}';
  }
}
