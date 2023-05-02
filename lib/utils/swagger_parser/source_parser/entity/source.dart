import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/path.dart';
import 'package:recase/recase.dart';

class Source {
  final String name;
  final String tag;
  final List<Path> paths;
  final List<String> entities;

  Source({
    required this.name,
    required this.tag,
    required this.paths,
    this.entities = const [],
  });

  @override
  String toString() {
    return '${name.pascalCase}Source: {\ntag: $tag,\npaths:\n$paths,\nentities:\n$entities\n}';
  }
}
