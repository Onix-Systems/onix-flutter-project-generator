import 'package:freezed_annotation/freezed_annotation.dart';

part 'method_data_model.g.dart';

@JsonSerializable()
class MethodDataModel {
  final String? methodType;
  final List<String>? tags;
  final Set<String>? entities;

  const MethodDataModel({
    required this.methodType,
    required this.tags,
    required this.entities,
  });

  factory MethodDataModel.fromJson(Map<String, dynamic> json) =>
      _$MethodDataModelFromJson(json);
}
