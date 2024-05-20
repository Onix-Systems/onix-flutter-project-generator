import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/method_parameter.dart';

class GeneratedMethod {
  final String path;
  final String name;
  final String endpoint;
  final String methodType;
  final String sourceMethod;
  final String responseEntityName;
  final String requestEntityName;
  final String responseRuntimeType;
  final String requiredParams;
  final String optionalParams;
  final List<MethodParameter> queryParams;
  final List<MethodParameter> pathParams;
  final List<DataComponent> innerEnums;

  GeneratedMethod({
    required this.path,
    required this.name,
    required this.endpoint,
    required this.methodType,
    required this.sourceMethod,
    required this.responseEntityName,
    required this.requestEntityName,
    required this.requiredParams,
    required this.optionalParams,
    required this.queryParams,
    required this.pathParams,
    this.responseRuntimeType = '',
    this.innerEnums = const [],
  });

  @override
  String toString() {
    return 'Name: $name\nPath: $path\nEndpoint: $endpoint\nMethodType: $methodType\nResponseEntityName: $responseEntityName\nQueryParams: $queryParams\nRequiredParams: $requiredParams\nOptionalParams: $optionalParams';
  }
}
