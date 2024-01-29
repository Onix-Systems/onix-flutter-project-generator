import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_property_data_model.g.dart';

@JsonSerializable()
class ColorPropertyDataModel {
  final double? r;
  final double? g;
  final double? b;
  final double? a;

  const ColorPropertyDataModel({
    required this.r,
    required this.g,
    required this.b,
    required this.a,
  });

  factory ColorPropertyDataModel.fromJson(Map<String, dynamic> json) =>
      _$ColorPropertyDataModelFromJson(json);
}
