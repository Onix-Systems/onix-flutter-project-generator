import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/node/fill_paints_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/paint/paint_property_data_model.dart';

part 'connector_node_data_model.g.dart';

@JsonSerializable()
class ConnectorNodeDataModel extends FillPaintsNodeDataModel {
  const ConnectorNodeDataModel({
    required super.id,
    required super.key,
    required super.name,
    required super.type,
    required super.fills,
  });

  factory ConnectorNodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$ConnectorNodeDataModelFromJson(json);
}
