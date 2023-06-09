import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method_type.dart';

part 'method.g.dart';

@JsonSerializable()
class Method {
  final MethodType methodType;
  final List<String> tags;
  final Set<String> entities;

  String _responseEntityName = '';
  String _requestEntityName = '';

  final List<Property> params = [];
  String innerEnum = '';

  Method({
    required this.methodType,
    required this.tags,
    required this.entities,
  });

  String get responseEntityName => _responseEntityName;

  String get requestEntityName => _requestEntityName;

  void setResponseEntityName(String name) {
    if (_responseEntityName.isEmpty) {
      _responseEntityName = name;
    }
  }

  void setRequestEntityName(String name) {
    if (_requestEntityName.isEmpty) {
      _requestEntityName = name;
    }
  }

  @override
  String toString() {
    return 'methodType: $methodType\ntags: $tags\nentities: $entities\nparams: $params\nresponseEntityName: $responseEntityName\nrequestEntityName: $requestEntityName\ninnerEnum: $innerEnum\n';
  }

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);
}
