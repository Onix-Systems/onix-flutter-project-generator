import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/domain/entity/property.dart';

part 'entity.g.dart';

@JsonSerializable()
class Entity {
  final String name;
  final List<Property> properties;

  Entity({
    required this.name,
    required this.properties,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

  @override
  String toString() {
    var result = '';

    result += '$name {';

    for (final property in properties) {
      result += '\n     $property';
    }

    result += '\n}';
    return result;
  }
}
