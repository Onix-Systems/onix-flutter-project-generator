import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method_type.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/path.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/source.dart';

class SourceParser {
  static Future<List<Source>> parse(Map<String, dynamic> data) async {
    final sources = <Source>[];

    final paths = <Path>[];

    for (final path in data['paths'].entries) {
      final methods = <Method>[];

      for (final entry in path.value.entries) {
        final entities = <String>[];

        //logger.wtf('Entry: $entry');

        if (MethodType.values
            .where((element) => element.name == entry.key)
            .isEmpty) {
          continue;
        }

        for (final response in entry.value['responses'].entries) {
          if (response.value['schema'] == null) {
            continue;
          }

          String entityName = _getRefClassName(response.value['schema']);
          entities.add(entityName);
        }

        if (entry.value['parameters'] != null) {
          for (final parameter in entry.value['parameters']) {
            if (parameter['schema'] == null) {
              continue;
            }

            String entityName = _getRefClassName(parameter['schema']);
            entities.add(entityName);
          }
        }

        methods.add(Method(
          methodType:
              MethodType.values.firstWhere((value) => value.name == entry.key),
          tags: entry.value['tags'].cast<String>(),
          entities: entities,
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
      //logger.wtf('Source: $source');
    }

    return sources;
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
