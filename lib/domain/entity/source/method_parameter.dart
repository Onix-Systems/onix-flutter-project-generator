import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';

part 'method_parameter.g.dart';

@JsonSerializable()
class MethodParameter extends Property {
  final MethodPlace place;

  MethodParameter({
    required this.place,
    required String name,
    required String type,
    bool nullable = false,
  }) : super(name: name, type: type, nullable: nullable);

  @override
  String toString() {
    return '{name: ${super.name}, type: ${super.type}, place: ${place.name}, nullable: ${super.nullable}}';
  }

  factory MethodParameter.fromJson(Map<String, dynamic> json) =>
      _$MethodParameterFromJson(json);

  Map<String, dynamic> toJson() => _$MethodParameterToJson(this);

  static MethodParameter copyOf(MethodParameter source) {
    return MethodParameter(
      place: source.place,
      name: source.name,
      type: source.type,
      nullable: source.nullable,
    );
  }
}

enum MethodPlace { query, path, formData, body, header }

enum MethodType { get, post, put, delete, patch }
