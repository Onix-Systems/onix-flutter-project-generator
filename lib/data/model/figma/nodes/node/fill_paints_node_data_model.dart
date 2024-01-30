import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/node/node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/paint/paint_property_data_model.dart';

part 'fill_paints_node_data_model.g.dart';

@JsonSerializable()
class FillPaintsNodeDataModel extends NodeDataModel {
  final List<PaintPropertyDataModel>? fills;

  const FillPaintsNodeDataModel({
    required super.id,
    required super.key,
    required super.name,
    required super.type,
    required this.fills,
  });

  factory FillPaintsNodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$FillPaintsNodeDataModelFromJson(json);
}
