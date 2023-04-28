import 'package:onix_flutter_bricks/utils/swagger_parser/entity/class_entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/enum.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/property.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/type_matcher.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/json_writer.dart';
import 'package:recase/recase.dart';

import '../../core/di/di.dart';

class SwaggerParser {
  String _basePath = '';
  List<Map<String, dynamic>> _stack = [];

  String get basePath => _basePath;

  Future<void> parse(Map<String, dynamic> data) {
    _basePath = data['basePath'] ?? '';
    return parseEntities(data);
  }

  Future<List<Entity>> parseEntities(Map<String, dynamic> data) async {
    final entities = <Entity>[];

    //JsonWriter.write(json: data);

    final entries = data.containsKey('definitions')
        ? data['definitions'].entries
        : data['components']['schemas'].entries;

    var stack = <MapEntry<String, dynamic>>[];

    for (final entry in entries) {
      //logger.wtf('entry: ${entry.key} ${entry.value}');

      var imports = <String>[];
      if (entry.value['type'] == 'object') {
        if (entry.value.containsKey('allOf')) {
          stack.add(entry);
          continue;
        }

        final entity = ClassEntity(
          name: entry.key,
          properties: (entry.value['properties'] as Map<String, dynamic>)
              .entries
              .map((e) {
            if (TypeMatcher.isReference(e.value)) {
              imports.add(_getRefClassName(e.value).snakeCase);
            }
            var property = Property(
              name: e.key.camelCase,
              type: TypeMatcher.isReference(e.value)
                  ? _getRefClassName(e.value)
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
        entities.add(entity);
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

    return entities;
  }

  void _parseMap(
      Property property, MapEntry<String, dynamic> e, List<Entity> entities) {
    property.type = property.name.pascalCase;

    parseEntities({
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

  void _parseArray(MapEntry<String, dynamic> e, Property property,
      List<Entity> entities, List<String> imports) {
    if (TypeMatcher.isReference(e.value['items'])) {
      property.type = 'List<${_getRefClassName(e.value['items'])}>';
      imports.add(_getRefClassName(e.value['items']).snakeCase);
    } else {
      if ((e.value['items'] as Map<String, dynamic>).isEmpty) {
        property.type = 'List<${TypeMatcher.getDartType('dynamic')}>';
      } else {
        final className =
            property.name.substring(0, property.name.length - 1).pascalCase;

        if (e.value['items'].containsKey('type') &&
            e.value['items']['type'] != 'object') {
          property.type =
              'List<${TypeMatcher.getDartType(e.value['items']['type'])}>';
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

          parseEntities(definitions).then((innerEntities) {
            entities.addAll(innerEntities);
          });

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

  void _parseStack(
      List<MapEntry<String, dynamic>> stack, List<Entity> entities) {
    for (final entry in stack) {
      logger.wtf('entryKey: ${entry.key} entryValue: ${entry.value}');

      final Map<String, dynamic> properties = {};

      for (var dependency in entry.value['allOf']) {
        logger.wtf('dependency: $dependency');

        if (TypeMatcher.isReference(dependency)) {
          final className = _getRefClassName(dependency);

          final entity =
              entities.where((element) => element.name == className).first;

          for (final property in entity.properties) {
            logger.wtf(property.toJson());
            properties['${property.name}'] = property.toJson();
          }
        } else {
          properties.addEntries(dependency['properties'].entries);
        }
      }

      logger.wtf('properties: $properties');

      parseEntities({
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
