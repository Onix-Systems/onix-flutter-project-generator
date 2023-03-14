import 'package:onix_flutter_bricks/data/model/local/entity_entity.dart';

class SourceEntity {
  late int id;
  String name;
  List<EntityEntity> entities;
  bool exists;

  SourceEntity({
    required this.name,
    required this.entities,
    this.exists = false,
  }) {
    id = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          exists == other.exists;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'SourceEntity{id: $id, name: $name, exists: $exists, entities: $entities}';
  }
}
