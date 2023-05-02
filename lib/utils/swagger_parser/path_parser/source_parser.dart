import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/json_writer.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/path_parser/entity/method.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/path_parser/entity/method_type.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/path_parser/entity/path.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/path_parser/entity/source.dart';

class SourceParser {
  static Future<List<Source>> parse(Map<String, dynamic> data) async {
    //JsonWriter.write(json: data['paths']);

    final sources = <Source>[];

    final paths = <Path>[];

    for (final path in data['paths'].entries) {
      final methods = <Method>[];

      for (final entry in path.value.entries) {
        if (MethodType.values
            .where((element) => element.name == entry.key)
            .isEmpty) {
          continue;
        }

        methods.add(Method(
          methodType:
              MethodType.values.firstWhere((value) => value.name == entry.key),
          tags: entry.value['tags'].cast<String>(),
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
      final source = Source(
        name: tag,
        tag: tag,
        paths: paths
            .where((element) =>
                element.methods.any((method) => method.tags.contains(tag)))
            .toList(),
      );
      sources.add(source);
    }

    return sources;
  }
}
