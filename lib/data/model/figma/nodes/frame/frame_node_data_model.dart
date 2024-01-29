import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/node/fill_paints_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/paint/paint_property_data_model.dart';

part 'frame_node_data_model.g.dart';

// https://www.figma.com/developers/api#frame-props
@JsonSerializable()
class FrameNodeDataModel extends FillPaintsNodeDataModel {
  const FrameNodeDataModel({
    required super.id,
    required super.key,
    required super.name,
    required super.type,
    required super.fills,
  });

  factory FrameNodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$FrameNodeDataModelFromJson(json);
}
