import 'package:onix_flutter_bricks/utils/swagger_parser/path_parser/entity/path.dart';
import 'package:recase/recase.dart';

class Source {
  final String name;
  final String tag;
  final List<Path> paths;

  Source({
    required this.name,
    required this.tag,
    required this.paths,
  });

  @override
  String toString() {
    return '${name.pascalCase}Source: {\ntag: $tag,\npaths:\n$paths\n}';
  }
}
