import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/entity.dart';

part 'enum.g.dart';

@JsonSerializable()
class EnumEntity implements Entity {
  @override
  final String name;
  @override
  final List<String> properties;

  EnumEntity({required this.name, required this.properties});

  factory EnumEntity.fromJson(Map<String, dynamic> json) =>
      _$EnumEntityFromJson(json);

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

  @override
  String generateClassBody({required String projectName}) {
    final properties = this
        .properties
        .map((e) => '       ${e == 'default' ? '//' : ''}$e,')
        .join('\n');

    return '''
enum $name{
    $properties
}''';
  }

  @override
  Set<String> get imports => {};
}
