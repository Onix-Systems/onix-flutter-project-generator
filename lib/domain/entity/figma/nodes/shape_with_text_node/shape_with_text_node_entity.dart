import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/fill_paints_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';

part 'shape_with_text_node_entity.freezed.dart';

@freezed
class ShapeWithTextNodeEntity
    with _$ShapeWithTextNodeEntity
    implements FillPaintsNode {
  const factory ShapeWithTextNodeEntity({
    required String id,
    required String key,
    required String name,
    required String type,
    required List<PaintProperty> fills,
  }) = _ShapeWithTextNodeEntity;
}
