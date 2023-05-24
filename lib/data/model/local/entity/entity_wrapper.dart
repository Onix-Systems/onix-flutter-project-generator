import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';

part 'entity_wrapper.g.dart';

@JsonSerializable()
class EntityWrapper {
  String name;
  bool generateRequest;
  bool generateResponse;
  bool exists;
  List<Property> properties;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Entity? entity;
  bool isEnum;

  EntityWrapper({
    required this.name,
    this.entity,
    this.generateRequest = false,
    this.generateResponse = false,
    this.exists = false,
    this.properties = const [],
    this.isEnum = false,
  });

  EntityWrapper.copyOf(EntityWrapper entity)
      : this(
          name: entity.name,
          entity: entity.entity,
          generateRequest: entity.generateRequest,
          generateResponse: entity.generateResponse,
          exists: entity.exists,
        );

  Map<String, dynamic> toJson() => _$EntityWrapperToJson(this);

  factory EntityWrapper.fromJson(Map<String, dynamic> json) =>
      _$EntityWrapperFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityWrapper &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          generateRequest == other.generateRequest &&
          generateResponse == other.generateResponse;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'EntityEntity{name: $name, exists: $exists, isEnum: $isEnum, generateRequest: $generateRequest, generateResponse: $generateResponse, properties: $properties}';
  }
}
