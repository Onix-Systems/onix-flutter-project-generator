import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/node/fill_paints_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/paint/paint_property_data_model.dart';

part 'shape_with_text_node_data_model.g.dart';

@JsonSerializable()
class ShapeWithTextNodeDataModel extends FillPaintsNodeDataModel {
  const ShapeWithTextNodeDataModel({
    required super.id,
    required super.key,
    required super.name,
    required super.type,
    required super.fills,
  });

  factory ShapeWithTextNodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$ShapeWithTextNodeDataModelFromJson(json);
}
