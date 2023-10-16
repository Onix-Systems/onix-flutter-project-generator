import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';

part 'data_component.g.dart';

@JsonSerializable()
class DataComponent {
  String name;
  bool generateRequest;
  bool generateResponse;
  bool exists;
  bool isGenerated;
  List<Property> properties;
  Set<String> imports;
  String sourceName = '';
  bool isEnum;

  DataComponent({
    required this.name,
    required this.properties,
    required this.imports,
    this.isEnum = false,
    this.generateRequest = false,
    this.generateResponse = false,
    this.exists = false,
    this.isGenerated = true,
  });

  factory DataComponent.empty() => DataComponent(
        name: '',
        properties: [Property(name: 'name', type: 'string')],
        isEnum: false,
        generateRequest: false,
        generateResponse: false,
        exists: false,
        isGenerated: true,
        imports: {},
      );

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
    }
    for (final importName in imports) {
      final import = dataComponentRepository.getDataComponentByName(
          dataComponentName: importName);
      if (import != null) {
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
        result += '\n     ${property.name},';
      }

      result += '\n}';
      return result;
    }

    return 'ClassEntity{name: $name, properties: $properties, imports: $imports, sourceName: $sourceName, generateRequest: $generateRequest, generateResponse: $generateResponse, exists: $exists, isEnum: $isEnum}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataComponent &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  factory DataComponent.fromJson(Map<String, dynamic> json) =>
      _$DataComponentFromJson(json);

  Map<String, dynamic> toJson() => _$DataComponentToJson(this);

  static DataComponent copyOf(DataComponent entity) {
    final copy = DataComponent(
      name: entity.name,
      properties: entity.properties.map((e) => Property.copyOf(e)).toList(),
      isEnum: entity.isEnum,
      generateRequest: entity.generateRequest,
      generateResponse: entity.generateResponse,
      exists: entity.exists,
      isGenerated: entity.isGenerated,
      imports: entity.imports,
    );
    copy.sourceName = entity.sourceName;
    return copy;
  }
}
