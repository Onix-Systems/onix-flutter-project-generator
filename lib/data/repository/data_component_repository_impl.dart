import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class DataComponentRepositoryImpl implements DataComponentRepository {
  @override
  Set<DataComponent> get dataComponents =>
      _dataComponents.map((e) => DataComponent.copyOf(e)).toSet();

  @override
  DataComponent get authComponent => DataComponent(
        name: 'Authentication',
        imports: {},
        exists: true,
        isGenerated: false,
        properties: [
          Property(
            name: 'accessToken',
            type: 'String',
          ),
          Property(
            name: 'refreshToken',
            type: 'String',
          ),
        ],
      );

  final Set<DataComponent> _dataComponents = {};

  @override
  void empty() {
    _dataComponents.removeWhere((element) => !element.exists);
    //_dataComponents.clear();
  }

  @override
  DataComponent? getDataComponentByName({required String dataComponentName}) {
    return _dataComponents.firstWhereOrNull(
        (element) => element.name.pascalCase == dataComponentName.pascalCase);
  }

  @override
  Set<String> getEnumNames() {
    return _dataComponents.where((e) => e.isEnum).map((e) => e.name).toSet();
  }

  @override
  bool containsNewComponents() {
    return _dataComponents.any((element) => !element.exists);
  }

  @override
  bool exists({required String dataComponentName}) {
    return _dataComponents.any(
        (element) => element.name.pascalCase == dataComponentName.pascalCase);
  }

  @override
  bool isEnum({required String dataComponentName}) {
    return _dataComponents.any((element) =>
        element.name.pascalCase == dataComponentName.pascalCase &&
        element.isEnum);
  }

  @override
  void parse({required Map<String, dynamic> data}) {
    _dataComponents.addAll(_parse(data));
  }

  Set<DataComponent> _parse(Map<String, dynamic> data) {
    final entries = data.containsKey('definitions')
        ? data['definitions'].entries
        : data['components']['schemas'].entries;

    var stack = <MapEntry<String, dynamic>>[];

    for (final entry in entries) {
      var imports = <String>[];

      if (entry.value['type'] == 'object') {
        _parseObject(entry: entry, imports: imports, stack: stack);
      } else if (entry.value.containsKey('enum')) {
        final dataComponent = DataComponent(
          name: entry.key,
          imports: {},
          properties: (entry.value['enum'] as List<dynamic>)
              .map((e) => Property(name: e, type: 'string'))
              .toList(),
          isEnum: true,
        );

        _dataComponents.add(dataComponent);
      }
    }

    _parseStack(stack);

    return _dataComponents;
  }

  void _parseObject(
      {required MapEntry<String, dynamic> entry,
      required List<String> imports,
      required List<MapEntry<String, dynamic>> stack}) {
    if (entry.value.containsKey('allOf')) {
      stack.add(entry);
      return;
    }

    if (entry.value['properties'] == null) {
      return;
    }

    if (entry.value['properties'].toString().contains('oneOf')) {
      var property = entry.value['properties'].entries
          .firstWhere((element) => element.value.toString().contains('oneOf'));

      final item = (entry.value['properties'].values
              .firstWhere((element) => element.toString().contains('oneOf'))
          as Map<String, dynamic>)['oneOf'][0];

      entry.value['properties'][property.key] = item;
    }

    final dataComponent = DataComponent(
      name: entry.key,
      imports: {},
      properties:
          (entry.value['properties'] as Map<String, dynamic>).entries.map((e) {
        if (TypeMatcher.isReference(e.value)) {
          imports.add(_getRefClassName(e.value).pascalCase);
        }
        var property = Property(
          name: e.key.camelCase,
          type: TypeMatcher.isReference(e.value)
              ? _getRefClassName(e.value).pascalCase
              : e.value['type'],
          nullable: e.value['nullable'] ?? false,
        );

        if (property.type == 'array') {
          _parseArray(e, property, imports);
        }

        if (TypeMatcher.getDartType(property.type) == 'Map') {
          imports.add(e.key.pascalCase);
          _parseMap(property, e);
        }

        return property;
      }).toList(),
    );

    dataComponent.addImports(imports);

    if (dataComponent.name.endsWith('Response') ||
        dataComponent.name.endsWith('Request')) {
      final generateResponse = dataComponent.name.endsWith('Response');
      final generateRequest = dataComponent.name.endsWith('Request');

      final generatedDataComponent = DataComponent(
        name: dataComponent.name.stripRequestResponse(),
        imports: {},
        properties: dataComponent.properties.map((e) {
          if (e.type.endsWith('Response') ||
              e.type.endsWith('Response>') ||
              e.type.endsWith('Request') ||
              e.type.endsWith('Request>')) {
            e.type = e.type
                .replaceLast('Response', '')
                .replaceLast('Response>', '>')
                .replaceLast('Request', '')
                .replaceLast('Request>', '>');
          }
          return e;
        }).toList(),
        isEnum: dataComponent.isEnum,
        generateResponse: generateResponse,
        generateRequest: generateRequest,
      );

      generatedDataComponent.addImports(imports.map((e) {
        return e.stripRequestResponse();
      }).toList());

      _dataComponents.add(generatedDataComponent);
    } else {
      _dataComponents.add(dataComponent);
    }
  }

  void _parseMap(Property property, MapEntry<String, dynamic> e) {
    property.type = property.name.pascalCase;

    final innerEntities = _parse({
      'definitions': {
        property.type: {
          'type': 'object',
          'properties': e.value['properties'],
        }
      }
    });

    _dataComponents.addAll(innerEntities);
  }

  void _parseArray(
      MapEntry<String, dynamic> e, Property property, List<String> imports) {
    property.isList = true;
    if (TypeMatcher.isReference(e.value['items'])) {
      property.type = _getRefClassName(e.value['items']);
      imports.add(_getRefClassName(e.value['items']).pascalCase);
    } else {
      if ((e.value['items'] as Map<String, dynamic>).isEmpty) {
        property.type = 'dynamic';
      } else {
        final className =
            property.name.substring(0, property.name.length).pascalCase;

        if (e.value['items'].containsKey('type') &&
            e.value['items']['type'] != 'object') {
          property.type = TypeMatcher.getDartType(e.value['items']['type']);
        } else if (e.value['items'].containsKey('type') &&
            e.value['items']['type'] == 'object' &&
            !e.value['items'].containsKey('properties')) {
          property.type = 'dynamic';
        } else {
          final definitions = {
            'definitions': {
              className: {
                'type': 'object',
                'properties': e.value['items']['properties'],
              }
            }
          };

          imports.add(className.pascalCase);

          final innerEntities = _parse(definitions);
          _dataComponents.addAll(innerEntities);

          property.type = className;
        }
      }
    }
  }

  String _getRefClassName(Map<String, dynamic> ref) {
    return ref
        .toString()
        .replaceAll('{', '')
        .replaceAll('}', '')
        .split('/')
        .last;
  }

  void _parseStack(List<MapEntry<String, dynamic>> stack) {
    for (final entry in stack) {
      final Map<String, dynamic> properties = {};

      for (var dependency in entry.value['allOf']) {
        if (TypeMatcher.isReference(dependency)) {
          final className = _getRefClassName(dependency).stripRequestResponse();

          final dataComponent = _dataComponents
              .where((element) => element.name == className)
              .first;

          for (final property in dataComponent.properties) {
            properties[property.name] = property.toJson();
          }
        } else {
          properties.addEntries(dependency['properties'].entries);
        }
      }

      final innerEntities = _parse({
        'definitions': {
          entry.key: {
            'type': 'object',
            'properties': properties,
          }
        }
      });
      _dataComponents.addAll(innerEntities);
    }
  }

  @override
  void addComponent({required DataComponent dataComponent}) {
    if (!exists(dataComponentName: dataComponent.name.pascalCase)) {
      dataComponent.name = dataComponent.name.pascalCase;
      _dataComponents.add(DataComponent.copyOf(dataComponent));
    }
  }

  @override
  void addAll({required Set<DataComponent> dataComponents}) {
    for (final component in dataComponents) {
      addComponent(dataComponent: component);
    }
  }

  @override
  void removeComponent({required String dataComponentName}) {
    if (exists(dataComponentName: dataComponentName)) {
      _dataComponents.removeWhere(
          (element) => element.name.pascalCase == dataComponentName.pascalCase);
    }

    for (var component in _dataComponents
        .where((element) => element.properties
            .any((property) => property.type == dataComponentName.pascalCase))
        .toList()) {
      final modifiedComponent = DataComponent.copyOf(component);

      modifiedComponent
        ..properties.removeWhere(
            (element) => element.type == dataComponentName.pascalCase)
        ..imports.removeWhere(
            (element) => element.pascalCase == dataComponentName.pascalCase);

      if (modifiedComponent.properties.isEmpty) {
        modifiedComponent.properties.add(Property.empty());
      }

      modifyComponent(
          oldDataComponentName: component.name,
          dataComponent: modifiedComponent);
    }
  }

  @override
  void modifyComponent({
    required String oldDataComponentName,
    required DataComponent dataComponent,
  }) {
    if (exists(dataComponentName: oldDataComponentName)) {
      _dataComponents.removeWhere((element) =>
          element.name.pascalCase == oldDataComponentName.pascalCase);
      _dataComponents.add(dataComponent);
    }

    final dependants = _dataComponents
        .where((element) => element.properties.any(
            (property) => property.type == oldDataComponentName.pascalCase))
        .toList();

    for (final dependant in dependants) {
      for (var property in dependant.properties) {
        if (property.type == oldDataComponentName.pascalCase) {
          property.type = dataComponent.name.pascalCase;
        }
      }

      dependant.imports.removeWhere(
          (element) => element.pascalCase == oldDataComponentName.pascalCase);
      dependant.addImports([dataComponent.name.pascalCase]);
    }
  }

  @override
  void setAllExists() {
    for (final component in _dataComponents) {
      component.exists = true;
    }
  }

  @override
  void setDataComponentSource(
      {required String dataComponentName, String sourceName = ''}) {
    final dataComponent = _dataComponents.firstWhereOrNull(
        (element) => element.name.pascalCase == dataComponentName.pascalCase);

    if (dataComponent != null) {
      dataComponent.sourceName = sourceName.pascalCase;
    }
  }
}
