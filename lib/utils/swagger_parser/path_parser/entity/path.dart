import 'package:onix_flutter_bricks/utils/swagger_parser/path_parser/entity/method.dart';

class Path {
  final String path;
  final List<Method> methods;

  Path({
    required this.path,
    required this.methods,
  });

  @override
  String toString() {
    return '\n{path: $path,\nmethods: $methods\n}';
  }
}
