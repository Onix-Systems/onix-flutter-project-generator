import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method_type.dart';

class Method {
  final MethodType methodType;
  final List<String> tags;
  final List<String> entities;

  //final List<MethodResponse> responses;

  Method({
    required this.methodType,
    required this.tags,
    required this.entities,
    //required this.responses,
  });

  @override
  String toString() {
    return 'Method{methodType: $methodType, tags: $tags}';
  }
}
