import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/method_parameter.dart';

part 'method.g.dart';

@JsonSerializable()
class Method {
  final MethodType methodType;
  final List<String> tags;
  final Set<String> entities;

  String _responseEntityName = '';
  String _responseRuntimeType = '';
  String _requestEntityName = '';

  final List<MethodParameter> params = [];
  final List<DataComponent> innerEnums = [];

  Method({
    required this.methodType,
    required this.tags,
    required this.entities,
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
    return 'methodType: $methodType\ntags: $tags\nentities: $entities\nparams: $params\nresponseEntityName: $responseEntityName\nresponseEntityType: $responseRuntimeType\nrequestEntityName: $requestEntityName\ninnerEnum: $innerEnums\n';
  }

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);

  static Method copyOf(Method source) {
    final copy = Method(
      methodType: source.methodType,
      tags: source.tags,
      entities: source.entities,
    );

    copy.setResponseEntityName(source._responseEntityName);
    copy.setResponseRuntimeType(source._responseRuntimeType);
    copy.setRequestEntityName(source._requestEntityName);
    copy.params.addAll(source.params.map((e) => MethodParameter.copyOf(e)));
    copy.innerEnums
        .addAll(source.innerEnums.map((e) => DataComponent.copyOf(e)));

    return copy;
  }
}
