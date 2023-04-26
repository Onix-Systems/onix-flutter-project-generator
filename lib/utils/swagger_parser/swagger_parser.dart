import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/class_entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/enum.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/property.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/type_matcher.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/json_writer.dart';
import 'package:recase/recase.dart';

class SwaggerParser {
  String _basePath = '';

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

    for (final entry in entries) {
      // logger.d('entry: ${entry.key} ${entry.value}');
      if (entry.value['type'] == 'object') {
        final entity = ClassEntity(
          name: entry.key,
          properties: (entry.value['properties'] as Map<String, dynamic>)
              .entries
              .map((e) {
            var property = Property(
              name: e.key,
              type: TypeMatcher.isReference(e.value)
                  ? _getRefClassName(e.value)
                  : e.value['type'],
              nullable: e.value['nullable'] ?? false,
            );

            if (property.type == 'array') {
              if (TypeMatcher.isReference(e.value['items'])) {
                property.type = 'List<${_getRefClassName(e.value['items'])}>';
              } else {
                if (e.value['items'].containsKey('type')) {
                  property.type =
                      'List<${TypeMatcher.getDartType(e.value['items']['type'])}>';
                } else {
                  property.type = 'List<${TypeMatcher.getDartType('dynamic')}>';
                }
              }
            }

            if (TypeMatcher.getDartType(property.type) == 'Map') {
              property.type = property.name.titleCase;

              parseEntities({
                'definitions': {
                  property.type: {
                    'type': 'object',
                    'properties': e.value['properties'],
                  }
                }
              }).then((innerEntities) {
                entities.addAll(innerEntities);
                logger.wtf(innerEntities);
              });
            }

            return property;
          }).toList(),
        );
        entities.add(entity);
      } else if (entry.value.containsKey('enum')) {
        final entity = EnumEntity(
          name: entry.key,
          properties: (entry.value['enum'] as List<dynamic>)
              .map((e) => e.toString())
              .toList(),
        );
        entities.add(entity);
      }
    }

    return entities;
  }

  String _getRefClassName(Map<String, dynamic> ref) {
    return ref
        .toString()
        .replaceAll('{', '')
        .replaceAll('}', '')
        .split('/')
        .last;
  }
}
