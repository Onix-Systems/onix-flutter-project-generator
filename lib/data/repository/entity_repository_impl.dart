import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/domain/entity/entity.dart';
import 'package:onix_flutter_bricks/domain/entity/property.dart';
import 'package:onix_flutter_bricks/domain/repository/entity_repository.dart';
import 'package:onix_flutter_bricks/utils/extensions/replace_last.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

class EntityRepositoryImpl implements EntityRepository {
  @override
  Set<Entity> entities = {};

  @override
  Entity? getEntityByName(String name) {
    return entities.firstWhereOrNull((element) => element.name == name);
  }

  @override
  Set<String> getEnumNames() {
    return entities.where((e) => e.isEnum).map((e) => e.name).toSet();
  }

  @override
  bool isEnum(String name) {
    return entities.any((element) => element.name == name && element.isEnum);
  }

  @override
  void parse(Map<String, dynamic> data) {
    entities.clear();
    entities.addAll(_parse(data));
  }

  Set<Entity> _parse(Map<String, dynamic> data) {
    final entries = data.containsKey('definitions')
        ? data['definitions'].entries
        : data['components']['schemas'].entries;

    var stack = <MapEntry<String, dynamic>>[];

    for (final entry in entries) {
      var imports = <String>[];

      if (entry.value['type'] == 'object') {
        _parseObject(entry: entry, imports: imports, stack: stack);
      } else if (entry.value.containsKey('enum')) {
        final entity = Entity(
          name: entry.key,
          properties: (entry.value['enum'] as List<dynamic>)
              .map((e) => Property(name: e, type: 'string'))
              .toList(),
          isEnum: true,
        );
        logger.wtf('${entity.name}: ${entity.properties}');

        entities.add(entity);
      }
    }

    _parseStack(stack);

    for (final entity in entities) {
      if (entity.imports.isEmpty) continue;

      for (final import in entity.imports) {
        final importedEntity = entities.firstWhereOrNull(
            (element) => element.name.camelCase == import.camelCase);

        if (importedEntity == null) continue;

        entity.entityImports.add(importedEntity);
      }
    }

    return entities;
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

    final entity = Entity(
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

    entity.addImports(imports);

    if (entity.name.endsWith('Response') || entity.name.endsWith('Request')) {
      final generateResponse = entity.name.endsWith('Response');
      final generateRequest = entity.name.endsWith('Request');

      final generatedEntity = Entity(
        name: entity.name.stripRequestResponse(),
        properties: entity.properties.map((e) {
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
        isEnum: entity.isEnum,
        generateResponse: generateResponse,
        generateRequest: generateRequest,
      );

      generatedEntity.addImports(imports.map((e) {
        return e.stripRequestResponse();
      }).toList());

      entities.add(generatedEntity);
    } else {
      entities.add(entity);
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

    entities.addAll(innerEntities);
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
          entities.addAll(innerEntities);

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

          final entity =
              entities.where((element) => element.name == className).first;

          for (final property in entity.properties) {
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
      entities.addAll(innerEntities);
    }
  }
}