import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/node/fill_paints_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/paint/paint_property_data_model.dart';

part 'table_cell_node_data_model.g.dart';

// https://www.figma.com/developers/api#table_cell-props
@JsonSerializable()
class TableCellNodeDataModel extends FillPaintsNodeDataModel {
  const TableCellNodeDataModel({
    required super.id,
    required super.key,
    required super.name,
    required super.type,
    required super.fills,
  });

  factory TableCellNodeDataModel.fromJson(Map<String, dynamic> json) =>
      _$TableCellNodeDataModelFromJson(json);
}