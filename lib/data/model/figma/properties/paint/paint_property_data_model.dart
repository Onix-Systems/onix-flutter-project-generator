import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/color/color_property_data_model.dart';

part 'paint_property_data_model.g.dart';

// https://www.figma.com/developers/api#paint-type
@JsonSerializable()
class PaintPropertyDataModel {
  final ColorPropertyDataModel? color;
  final String? type;

  const PaintPropertyDataModel({required this.color, required this.type});

  factory PaintPropertyDataModel.fromJson(Map<String, dynamic> json) =>
      _$PaintPropertyDataModelFromJson(json);
}
