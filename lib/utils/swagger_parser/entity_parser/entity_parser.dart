import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/utils/extensions/replace_last.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/class_entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/enum.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

class EntityParser {
  static Future<Set<Entity>> parse(Map<String, dynamic> data) async {
    final entities = <Entity>{};

    final entries = data.containsKey('definitions')
        ? data['definitions'].entries
        : data['components']['schemas'].entries;

    var stack = <MapEntry<String, dynamic>>[];

    for (final entry in entries) {
      var imports = <String>[];

      if (entry.value['type'] == 'object') {
        _parseObject(
            entry: entry, entities: entities, imports: imports, stack: stack);
      } else if (entry.value.containsKey('enum')) {
        final entity = EnumEntity(
          name: entry.key,
          properties: (entry.value['enum'] as List<dynamic>)
              .map((e) => e.toString().camelCase)
              .toList(),
        );
        entities.add(entity);
      }
    }

    _parseStack(stack, entities);

    for (final entity in entities) {
      if (entity.imports.isEmpty) continue;

      for (final import in entity.imports) {
        final importedEntity = entities.firstWhereOrNull(
            (element) => element.name.snakeCase == import.snakeCase);

        if (importedEntity == null) continue;

        entity.entityImports.add(importedEntity);
      }
    }

    for (final entity in entities) {
      logger.wtf(
          '${entity.name}\n${entity.properties.map((e) => e.toString()).join('\n')}');
    }

    return entities;
  }

  static void _parseObject(
      {required MapEntry<String, dynamic> entry,
      required Set<Entity> entities,
      required List<String> imports,
      required List<MapEntry<String, dynamic>> stack}) {
    if (entry.value.containsKey('allOf')) {
      stack.add(entry);
      return;
    }

    if (entry.value['properties'] == null) {
      return;
    }

    final entity = ClassEntity(
      name: entry.key.stripRequestResponse(),
      properties:
          (entry.value['properties'] as Map<String, dynamic>).entries.map((e) {
        if (TypeMatcher.isReference(e.value)) {
          imports
              .add(_getRefClassName(e.value).stripRequestResponse().snakeCase);
        }
        var property = Property(
          name: e.key.camelCase.stripRequestResponse(),
          type: TypeMatcher.isReference(e.value)
              ? _getRefClassName(e.value).stripRequestResponse().pascalCase
              : e.value['type'],
          nullable: e.value['nullable'] ?? false,
        );

        if (property.type == 'array') {
          _parseArray(e, property, entities, imports);
        }

        if (TypeMatcher.getDartType(property.type) == 'Map') {
          imports.add(e.key.snakeCase);
          _parseMap(property, e, entities);
        }

        return property;
      }).toList(),
    );

    entity.addImports(imports);

    logger.wtf(entity.name);

    entities.add(entity);
  }

  static void _parseMap(
      Property property, MapEntry<String, dynamic> e, Set<Entity> entities) {
    property.type = property.name.pascalCase;

    parse({
      'definitions': {
        property.type: {
          'type': 'object',
          'properties': e.value['properties'],
        }
      }
    }).then((innerEntities) {
      entities.addAll(innerEntities);
    });
  }

  static void _parseArray(MapEntry<String, dynamic> e, Property property,
      Set<Entity> entities, List<String> imports) {
    if (TypeMatcher.isReference(e.value['items'])) {
      property.type =
          'List<${_getRefClassName(e.value['items']).stripRequestResponse()}>';
      imports.add(
          _getRefClassName(e.value['items']).stripRequestResponse().snakeCase);
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

          parse(definitions).then((innerEntities) {
            entities.addAll(innerEntities);
          });

          property.type = 'List<$className>';
        }
      }
    }
  }

  static String _getRefClassName(Map<String, dynamic> ref) {
    return ref
        .toString()
        .replaceAll('{', '')
        .replaceAll('}', '')
        .split('/')
        .last;
  }

  static void _parseStack(
      List<MapEntry<String, dynamic>> stack, Set<Entity> entities) {
    for (final entry in stack) {
      final Map<String, dynamic> properties = {};

      for (var dependency in entry.value['allOf']) {
        if (TypeMatcher.isReference(dependency)) {
          final className = _getRefClassName(dependency).stripRequestResponse();

          final entity =
              entities.where((element) => element.name == className).first;

          for (final property in entity.properties) {
            properties['${property.name}'] = property.toJson();
          }
        } else {
          properties.addEntries(dependency['properties'].entries);
        }
      }

      parse({
        'definitions': {
          entry.key: {
            'type': 'object',
            'properties': properties,
          }
        }
      }).then((innerEntities) {
        entities.addAll(innerEntities);
      });
    }
  }
}
