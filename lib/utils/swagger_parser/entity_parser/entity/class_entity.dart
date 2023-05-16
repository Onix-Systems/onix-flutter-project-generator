import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';
import 'package:recase/recase.dart';

part 'class_entity.g.dart';

@JsonSerializable()
class ClassEntity implements Entity {
  @override
  final String name;
  @override
  final List<Property> properties;
  @override
  final Set<String> imports = {};
  @override
  String sourceName = '';
  @override
  Set<Entity> entityImports = {};

  ClassEntity({
    required this.name,
    required this.properties,
  });

  factory ClassEntity.fromJson(Map<String, dynamic> json) =>
      _$ClassEntityFromJson(json);

  void addImports(List<String> imports) {
    imports.sort((a, b) => a.compareTo(b));
    this.imports.addAll(imports);
  }

  @override
  void setSourceName(String sourceName) {
    if (this.sourceName.isEmpty) {
      this.sourceName = sourceName;
      for (final import in entityImports) {
        import.setSourceName(sourceName);
      }
    }
  }

  @override
  String toString() {
    return 'ClassEntity{name: $name, properties: $properties, imports: $imports, sourceName: $sourceName, entityImports: $entityImports}';
  }

  @override
  String generateClassBody({required String projectName}) {
    final imports = entityImports
        .map((e) =>
            'import \$\$package:$projectName/domain/entity/${e.sourceName.isNotEmpty ? '${e.sourceName.snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}.dart\$\$;')
        .join('\n');

    final properties = this.properties.map((e) => '       $e,').join('\n');

    return '''
import \$\$package:freezed_annotation/freezed_annotation.dart\$\$;
${imports.isNotEmpty ? '$imports\n' : ''}
part \$\$${name.snakeCase}.freezed.dart\$\$;

@freezed
class $name with _\$$name {
    factory $name({
    $properties
    }) = _$name;
}''';
  }
}
