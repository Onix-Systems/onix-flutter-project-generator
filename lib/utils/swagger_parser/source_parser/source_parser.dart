import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method_type.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/path.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/source.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';

class SourceParser {
  static Future<List<Source>> parse(Map<String, dynamic> data) async {
    final sources = <Source>[];

    final paths = <Path>[];

    for (final path in data['paths'].entries) {
      final methods = <Method>[];

      if (path.value.entries.isEmpty) {
        continue;
      }

      for (final entry in path.value.entries) {
        final entities = <String>{};

        if (MethodType.values
            .where((element) => element.name == entry.key)
            .isEmpty) {
          continue;
        }

        //logger.wtf('Method: ${entry.key}: ${entry.value}');

        if (entry.value.containsKey('parameters') &&
            entry.value['parameters'].isNotEmpty) {
          for (final parameter in entry.value['parameters']) {
            if (parameter['schema'] == null) {
              continue;
            }

            if (TypeMatcher.isReference(parameter['schema'])) {
              String entityName = _getRefClassName(parameter['schema']);
              entities.add(entityName);
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
              entities.add(entityName);
            }
          }
        }

        if (entry.value.containsKey('responses')) {
          _getMethodSchemaReference(entry, entities);
        }

        methods.add(Method(
          methodType:
              MethodType.values.firstWhere((value) => value.name == entry.key),
          tags: entry.value['tags'].cast<String>(),
          entities: entities.toList(),
        ));
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
            dependencies.addAll(method.entities);
          }
        }
      }

      final source = Source(
        name: tag,
        tag: tag,
        paths: paths
            .where((element) =>
                element.methods.any((method) => method.tags.contains(tag)))
            .toList(),
        entities: dependencies.toList(),
      );
      sources.add(source);
      // logger.wtf('Source: $source');
    }

    return sources;
  }

  static void _getMethodSchemaReference(entry, Set<String> entities) {
    final responses = entry.value['responses'].entries
        .where((response) => response.key == '200' || response.key == '201');

    for (final response in responses) {
      final schema = response.value.containsKey('content')
          ? response.value['content']['schema'] ??
              response.value['content']['application/json']['schema']
          : response.value['schema'];

      //logger.wtf('Schema: $schema');

      if (schema == null ||
          (!TypeMatcher.isReference(schema) &&
              !TypeMatcher.isReferenceArray(schema))) {
        return;
      }

      String entityName = _getRefClassName(schema);

      entities.add(entityName);
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
