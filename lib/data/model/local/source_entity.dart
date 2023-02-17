import 'package:onix_flutter_bricks/data/model/local/entity_entity.dart';

class SourceEntity {
  late int id;
  String name;
  List<EntityEntity> entities;

  SourceEntity({
    required this.name,
    required this.entities,
  }) {
    id = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceEntity &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'SourceEntity{id: $id, name: $name, entities: $entities}';
  }
}
