import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/property.dart';
import 'package:recase/recase.dart';

part 'entity.g.dart';

@JsonSerializable()
class Entity {
  String name;
  bool generateRequest;
  bool generateResponse;
  bool exists;
  List<Property> properties;
  final Set<String> imports = {};
  String sourceName = '';
  Set<Entity> entityImports = {};
  bool isEnum;

  Entity({
    required this.name,
    required this.properties,
    this.isEnum = false,
    this.generateRequest = false,
    this.generateResponse = false,
    this.exists = false,
  });

  void addImports(List<String> imports) {
    imports.sort((a, b) => a.compareTo(b));
    this.imports.addAll(imports);
  }

  void setName(String name) {
    this.name = name;
  }

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
    if (isEnum) {
      var result = '';

      result += '$name {';

      for (final property in properties) {
        result += '\n     ${property.name.camelCase},';
      }

      result += '\n}';
      return result;
    }

    return 'ClassEntity{name: $name, properties: $properties, imports: $imports, sourceName: $sourceName, entityImports: $entityImports}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Entity && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

  Map<String, dynamic> toJson() => _$EntityToJson(this);

  static Entity copyOf(Entity entity) {
    return Entity(
      name: entity.name,
      properties: entity.properties,
      isEnum: entity.isEnum,
      generateRequest: entity.generateRequest,
      generateResponse: entity.generateResponse,
      exists: entity.exists,
    );
  }
}
