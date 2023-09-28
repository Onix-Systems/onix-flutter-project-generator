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
  final Set<String> imports = {};
  String sourceName = '';
  Set<DataComponent> componentImports = {};
  bool isEnum;

  DataComponent({
    required this.name,
    required this.properties,
    this.isEnum = false,
    this.generateRequest = false,
    this.generateResponse = false,
    this.exists = false,
    this.isGenerated = true,
  });

  void addImports(List<String> imports) {
    imports.sort((a, b) => a.compareTo(b));
    this.imports.addAll(imports);
  }

  void addComponentImports(List<String> imports) {
    for (final import in imports) {
      DataComponent? dataComponent =
          dataComponentRepository.getDataComponentByName(
              import.replaceAll('List<', '').replaceAll('>', ''));

      if (dataComponent != null) {
        componentImports.add(dataComponent);
      } else {
        dataComponent = sourceRepository.getDataComponentByName(
            import.replaceAll('List<', '').replaceAll('>', ''));
        if (dataComponent != null) {
          componentImports.add(dataComponent);
        }
      }
    }
  }

  void setName(String name) {
    this.name = name;
  }

  void setSourceName(String sourceName) {
    if (this.sourceName.isEmpty) {
      this.sourceName = sourceName;
    }
    for (final import in componentImports) {
      import.setSourceName(sourceName);
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

    return 'ClassEntity{name: $name, properties: $properties, imports: $imports, sourceName: $sourceName, componentImports: $componentImports, generateRequest: $generateRequest, generateResponse: $generateResponse, exists: $exists, isEnum: $isEnum}';
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
    );
    copy.addImports(entity.imports.toList());
    copy.componentImports
        .addAll(entity.componentImports.map((e) => DataComponent.copyOf(e)));
    copy.sourceName = entity.sourceName;
    return copy;
  }
}
