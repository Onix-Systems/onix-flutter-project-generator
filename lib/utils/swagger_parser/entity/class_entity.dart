import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/property.dart';
import 'package:recase/recase.dart';

part 'class_entity.g.dart';

@JsonSerializable()
class ClassEntity implements Entity {
  @override
  final String name;
  @override
  final List<Property> properties;
  final Set<String> imports = {};

  ClassEntity({
    required this.name,
    required this.properties,
  });

  factory ClassEntity.fromJson(Map<String, dynamic> json) =>
      _$ClassEntityFromJson(json);

  void addImports(List<String> imports) {
    this.imports.addAll(imports);
  }

  @override
  String toString() {
    var result = '';

    result += '$name {';

    for (final property in properties) {
      result += '\n     $property';
    }

    result += '\n}';

    if (imports.isNotEmpty) {
      result += '\n\n';
      for (final import in imports) {
        result += 'import \'$import\';\n';
      }
    }

    return result;
  }

  @override
  String generateClassBody({required String projectName}) {
    final imports = this
        .imports
        .map((e) => 'import \'package:$projectName/domain/entity/$e/$e.dart\';')
        .join('\n');

    final properties = this.properties.map((e) => '       $e,').join('\n');

    var result = '''
$imports
part \'${name.snakeCase}.freezed.dart\';

@freezed
class $name with _\$$name {
    factory $name({
    $properties
    }) = _$name;
    ''';

    return result;
  }
}
