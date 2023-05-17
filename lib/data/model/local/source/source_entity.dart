import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/entity_wrapper.dart';

part 'source_entity.g.dart';

@JsonSerializable()
class SourceEntity {
  String name;
  List<EntityWrapper> entities;
  bool exists;

  SourceEntity({
    required this.name,
    required this.entities,
    this.exists = false,
  });

  SourceEntity.copyOf(SourceEntity source)
      : this(
          name: source.name,
          entities:
              source.entities.map((e) => EntityWrapper.copyOf(e)).toList(),
          exists: source.exists,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          entities == other.entities &&
          exists == other.exists;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'SourceEntity{name: $name, exists: $exists, entities: $entities}';
  }

  Map<String, dynamic> toJson() => _$SourceEntityToJson(this);

  factory SourceEntity.fromJson(Map<String, dynamic> json) =>
      _$SourceEntityFromJson(json);
}
