import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';

part 'method_parameter.g.dart';

@JsonSerializable()
class MethodParameter extends Property {
  final String place;

  MethodParameter({
    required this.place,
    required String name,
    required String type,
    bool nullable = false,
  }) : super(name: name, type: type, nullable: nullable);

  @override
  String toString() {
    return '{name: ${super.name}, type: ${super.type}, place: $place, nullable: ${super.nullable}}';
  }

  factory MethodParameter.fromJson(Map<String, dynamic> json) =>
      _$MethodParameterFromJson(json);

  Map<String, dynamic> toJson() => _$MethodParameterToJson(this);
}
