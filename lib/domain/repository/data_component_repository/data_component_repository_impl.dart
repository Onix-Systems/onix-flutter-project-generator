import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';

import 'package:recase/recase.dart';

class DataComponentRepositoryImpl implements DataComponentRepository {
  @override
  Set<DataComponent> dataComponents = {};

  @override
  DataComponent? getDataComponentByName(String name) {
    return dataComponents.firstWhereOrNull(
        (element) => element.name.pascalCase == name.pascalCase);
  }

  @override
  Set<String> getEnumNames() {
    return dataComponents.where((e) => e.isEnum).map((e) => e.name).toSet();
  }

  @override
  bool isEnum(String name) {
    return dataComponents
        .any((element) => element.name == name && element.isEnum);
  }

  @override
  void parse(Map<String, dynamic> data) {
    dataComponents.clear();
    dataComponents.addAll(_parse(data));
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
          properties: (entry.value['enum'] as List<dynamic>)
              .map((e) => Property(name: e, type: 'string'))
              .toList(),
          isEnum: true,
        );

        dataComponents.add(dataComponent);
      }
    }

    _parseStack(stack);

    for (final dataComponent in dataComponents) {
      if (dataComponent.imports.isEmpty) continue;

      for (final import in dataComponent.imports) {
        final importedDataComponent = dataComponents.firstWhereOrNull(
            (element) => element.name.camelCase == import.camelCase);

        if (importedDataComponent == null) continue;

        dataComponent.componentImports.add(importedDataComponent);
      }
    }

    return dataComponents;
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
      properties:
          (entry.value['properties'] as Map<String, dynamic>).entries.map((e) {
        if (TypeMatcher.isReference(e.value)) {
          imports.add(_getRefClassName(e.value));
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
          imports.add(e.key.snakeCase);
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

      dataComponents.add(generatedDataComponent);
    } else {
      dataComponents.add(dataComponent);
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

    dataComponents.addAll(innerEntities);
  }

  void _parseArray(
      MapEntry<String, dynamic> e, Property property, List<String> imports) {
    if (TypeMatcher.isReference(e.value['items'])) {
      property.type =
          'List<${_getRefClassName(e.value['items']) /*.stripRequestResponse()*/}>';
      imports.add(_getRefClassName(e.value['items']) /*.stripRequestResponse()*/
          .snakeCase);
    } else {
      if ((e.value['items'] as Map<String, dynamic>).isEmpty) {
        property.type = 'List<dynamic>';
      } else {
        final className =
            property.name.substring(0, property.name.length).pascalCase;

        if (e.value['items'].containsKey('type') &&
            e.value['items']['type'] != 'object') {
          property.type =
              'List<${TypeMatcher.getDartType(e.value['items']['type'])}>';
        } else if (e.value['items'].containsKey('type') &&
            e.value['items']['type'] == 'object' &&
            !e.value['items'].containsKey('properties')) {
          property.type = 'List<dynamic>';
        } else {
          final definitions = {
            'definitions': {
              className: {
                'type': 'object',
                'properties': e.value['items']['properties'],
              }
            }
          };

          imports.add(className.snakeCase);

          final innerEntities = _parse(definitions);
          dataComponents.addAll(innerEntities);

          property.type = 'List<$className>';
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

          final dataComponent = dataComponents
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
      dataComponents.addAll(innerEntities);
    }
  }
}
