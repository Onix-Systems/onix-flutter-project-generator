import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method_type.dart';

class Method {
  final MethodType methodType;
  final List<String> tags;

  Method({
    required this.methodType,
    required this.tags,
  });

  @override
  String toString() {
    return 'Method{methodType: $methodType, tags: $tags}';
  }
}
