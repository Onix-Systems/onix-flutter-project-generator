import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';

class ClassEntity implements Entity {
  @override
  String name;
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

  void addImports(List<String> imports) {
    imports.sort((a, b) => a.compareTo(b));
    this.imports.addAll(imports);
  }

  @override
  void setName(String name) {
    this.name = name;
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
}
