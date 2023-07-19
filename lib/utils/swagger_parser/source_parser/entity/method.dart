import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/enum.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method_parameter.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method_type.dart';

part 'method.g.dart';

@JsonSerializable()
class Method {
  final MethodType methodType;
  final List<String> tags;
  final Set<String> entitiesNames;

  String _responseEntityName = '';
  String _responseRuntimeType = '';
  String _requestEntityName = '';

  final List<MethodParameter> params = [];
  final List<EnumEntity> innerEnums = [];

  Method({
    required this.methodType,
    required this.tags,
    required this.entitiesNames,
  });

  String get responseEntityName => _responseEntityName;

  String get responseRuntimeType => _responseRuntimeType;

  String get requestEntityName => _requestEntityName;

  void setResponseEntityName(String name) {
    if (_responseEntityName.isEmpty) {
      _responseEntityName = name;
    }
  }

  void setResponseRuntimeType(String type) {
    if (_responseRuntimeType.isEmpty) {
      _responseRuntimeType = type;
    }
  }

  void setRequestEntityName(String name) {
    if (_requestEntityName.isEmpty) {
      _requestEntityName = name;
    }
  }

  @override
  String toString() {
    return 'methodType: $methodType\ntags: $tags\nentities: $entitiesNames\nparams: $params\nresponseEntityName: $responseEntityName\nresponseEntityType: $responseRuntimeType\nrequestEntityName: $requestEntityName\ninnerEnum: $innerEnums\n';
  }

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);
}
