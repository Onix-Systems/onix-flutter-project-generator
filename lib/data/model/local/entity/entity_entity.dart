import 'package:json_annotation/json_annotation.dart';

part 'entity_entity.g.dart';

@JsonSerializable()
class EntityEntity {
  String name;
  bool generateRequest;
  bool generateResponse;
  bool exists;
  String classBody;

  EntityEntity({
    required this.name,
    this.generateRequest = false,
    this.generateResponse = false,
    this.exists = false,
    this.classBody = '',
  });

  EntityEntity.copyOf(EntityEntity entity)
      : this(
          name: entity.name,
          generateRequest: entity.generateRequest,
          generateResponse: entity.generateResponse,
          exists: entity.exists,
          classBody: entity.classBody,
        );

  Map<String, dynamic> toJson() => _$EntityEntityToJson(this);

  factory EntityEntity.fromJson(Map<String, dynamic> json) =>
      _$EntityEntityFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          generateRequest == other.generateRequest &&
          generateResponse == other.generateResponse;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'EntityEntity{name: $name, exists: $exists, generateRequest: $generateRequest, generateResponse: $generateResponse, classBody: $classBody}';
  }
}
