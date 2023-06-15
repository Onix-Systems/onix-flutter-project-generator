import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/entity.dart';

part 'enum.g.dart';

@JsonSerializable()
class EnumEntity implements Entity {
  @override
  String name;
  @override
  final List<String> properties;
  @override
  String sourceName = '';

  EnumEntity({required this.name, required this.properties});

  @override
  void setSourceName(String sourceName) {
    if (this.sourceName.isEmpty) {
      this.sourceName = sourceName;
    }
  }

  @override
  void setName(String name) {
    this.name = name;
  }

  @override
  String toString() {
    var result = '';

    result += '$name {';

    for (final property in properties) {
      result += '\n     $property,';
    }

    result += '\n}';
    return result;
  }

  String generateClassBody({required String projectName, String? sourceName}) {
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

  @override
  Set<Entity> get entityImports => {};

  Map<String, dynamic> toJson() => _$EnumEntityToJson(this);

  factory EnumEntity.fromJson(Map<String, dynamic> json) =>
      _$EnumEntityFromJson(json);
}
