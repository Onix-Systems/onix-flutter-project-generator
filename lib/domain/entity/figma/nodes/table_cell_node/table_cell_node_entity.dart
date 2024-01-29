import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/fill_paints_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';

part 'table_cell_node_entity.freezed.dart';

// https://www.figma.com/developers/api#table_cell-props
@freezed
class TableCellNodeEntity with _$TableCellNodeEntity implements FillPaintsNode {
  const factory TableCellNodeEntity({
    required String id,
    required String key,
    required String name,
    required String type,
    required List<PaintProperty> fills,
  }) = _TableCellNodeEntity;
}
