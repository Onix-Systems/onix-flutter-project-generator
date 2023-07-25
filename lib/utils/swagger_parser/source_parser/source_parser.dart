import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/domain/entity/entity.dart';
import 'package:onix_flutter_bricks/domain/entity/property.dart';
import 'package:onix_flutter_bricks/utils/extensions/replace_last.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method_parameter.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method_type.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/path.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/source.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

class SourceParser {
  static Future<List<Source>> parse(Map<String, dynamic> data) async {
    final sources = <Source>[];

    final paths = <Path>[];

    for (final path in data['paths'].entries) {
      final methods = <Method>[];

      if (path.value.entries.isEmpty) {
        continue;
      }

      if (!path.value.entries.toString().contains('tags')) {
        continue;
      }

      for (final entry in path.value.entries) {
        if (MethodType.values
            .where((element) => element.name == entry.key)
            .isEmpty) {
          continue;
        }

        final method = Method(
          methodType:
              MethodType.values.firstWhere((value) => value.name == entry.key),
          tags: entry.value['tags'].cast<String>(),
          entities: {},
        );

        if (entry.value.containsKey('parameters') &&
            entry.value['parameters'].isNotEmpty) {
          for (final parameter in entry.value['parameters']) {
            if (parameter['schema'] != null) {
              final isArray = parameter['schema']['type'] == 'array';
              final isEnum = parameter['schema']['type'] == 'string' &&
                  parameter['schema']['enum'] != null;

              if (TypeMatcher.isReference(parameter['schema']) ||
                  (isArray &&
                      TypeMatcher.isReference(parameter['schema']['items']))) {
                String entityName = isArray
                    ? _getRefClassName(parameter['schema']['items'])
                    : _getRefClassName(parameter['schema']);

                final entity = entityRepository.getEntityByName(entityName);

                if (entity == null) {
                  continue;
                }

                method.entities.add(entity);

                method.params.add(MethodParameter(
                    name: entityName.camelCase,
                    place: parameter['in'],
                    type: isArray ? 'List<$entityName>' : entityName,
                    nullable: parameter['required'] != null
                        ? !parameter['required']
                        : true));

                //method.setRequestEntityName(entityName);
              } else {
                if (isEnum) {
                  method.innerEnums.add(Entity(
                      name:
                          '${entry.value['operationId'].toString().pascalCase}${parameter['name'].toString().pascalCase}',
                      isEnum: true,
                      properties: List<Property>.generate(
                          parameter['schema']['enum'].length,
                          (index) => Property(
                              name: parameter['schema']['enum'][index],
                              type: "string"))));
                }

                method.params.add(MethodParameter(
                    name: parameter['name'],
                    place: parameter['in'],
                    type: isEnum
                        ? '${entry.value['operationId'].toString().pascalCase}${parameter['name'].toString().pascalCase}'
                        : TypeMatcher.getDartType(parameter['schema']['type']),
                    nullable: parameter['required'] != null
                        ? !parameter['required']
                        : true));
              }
            } else {
              final isArray = parameter['type'] == 'array';

              method.params.add(MethodParameter(
                  name: parameter['name'],
                  place: parameter['in'],
                  type: isArray
                      ? 'List<${TypeMatcher.getDartType(parameter['items']['type'])}>'
                      : TypeMatcher.getDartType(parameter['type']),
                  nullable: parameter['required'] != null
                      ? !parameter['required']
                      : true));
            }
          }
        }

        if (entry.value.containsKey('requestBody') &&
            entry.value['requestBody'].isNotEmpty) {
          for (final parameter
              in entry.value['requestBody']['content'].values) {
            if (parameter['schema'] == null) {
              continue;
            }

            if (TypeMatcher.isReference(parameter['schema'])) {
              String entityName = _getRefClassName(parameter['schema']);

              final entity = entityRepository.getEntityByName(entityName);

              if (entity == null) {
                continue;
              }

              method.entities.add(entity);
              method.setRequestEntityName(entity.name);
            }
          }
        }

        if (entry.value.containsKey('responses')) {
          _getMethodSchemaReference(entry, method);
        }

        methods.add(method);
      }

      paths.add(Path(path: path.key, methods: methods));
    }

    final tags = <String>{};

    for (final path in paths) {
      for (final method in path.methods) {
        for (final tag in method.tags) {
          if (tag.isNotEmpty) {
            tags.add(tag);
          }
        }
      }
    }

    for (final tag in tags) {
      final dependencies = <String>{};

      for (final path in paths) {
        for (final method in path.methods) {
          if (method.tags.contains(tag)) {
            dependencies.addAll(method.entities.map((e) => e.name));
          }
        }
      }

      final source = Source(
        name: tag
            .replaceAll(' ', '_')
            .replaceAll(RegExp('[^A-Za-z0-9_-]'), '')
            .pascalCase
            .replaceAll('Api', ''),
        tag: tag,
        paths: paths
            .where((element) =>
                element.methods.any((method) => method.tags.contains(tag)))
            .toList(),
        entities: dependencies.toList(),
      );
      sources.add(source);
    }

    return sources;
  }

  static void _getMethodSchemaReference(entry, Method method) {
    final responses = entry.value['responses'].entries
        .where((response) => response.key == '200' || response.key == '201');

    if (responses.isEmpty) {
      return;
    }

    for (final response in responses) {
      final schema = response.value.containsKey('content')
          ? response.value['content']['schema'] ??
                  response.value['content'].containsKey('application/json')
              ? response.value['content']['application/json']['schema']
              : response.value['content']['*/*']['schema']
          : response.value['schema'];

      if (schema == null) {
        return;
      }

      if (!TypeMatcher.isReference(schema) &&
          !TypeMatcher.isReferenceArray(schema)) {
        if (!schema.containsKey('type')) {
          return;
        }

        if (schema['type'] == 'array') {
          if (!schema.containsKey('items')) {
            return;
          }

          if (!TypeMatcher.isReference(schema['items'])) {
            method.setResponseRuntimeType(
                'List<${TypeMatcher.getDartType(schema['items']['type'])}>');
          }
        } else {
          if (schema is Map &&
              (schema.containsKey('additionalProperties') ||
                  schema.containsKey('properties'))) {
            method.setResponseRuntimeType('Map<String, dynamic>');
          } else {
            method.setResponseRuntimeType(
                TypeMatcher.getDartType(schema['type']));
          }
        }

        return;
      }

      if (method.methodType == MethodType.get) {
        method.setResponseEntityName(_getRefClassName(schema));
      }

      String entityName = _getRefClassName(schema);

      final entity =
          entityRepository.getEntityByName(entityName.stripRequestResponse());

      if (entity == null) {
        continue;
      }

      method.entities.add(entity);
    }
  }

  static String _getRefClassName(Map<String, dynamic> ref) {
    if (ref.containsKey('items')) {
      return ref['items']
          .toString()
          .replaceAll('{', '')
          .replaceAll('}', '')
          .split('/')
          .last;
    }
    return ref
        .toString()
        .replaceAll('{', '')
        .replaceAll('}', '')
        .split('/')
        .last;
  }
}
