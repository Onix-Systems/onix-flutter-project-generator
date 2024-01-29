import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/fill_paints_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';

part 'vector_node_entity.freezed.dart';

@freezed
class VectorNodeEntity with _$VectorNodeEntity implements FillPaintsNode {
  const factory VectorNodeEntity({
    required String id,
    required String key,
    required String name,
    required String type,
    required List<PaintProperty> fills,
  }) = _VectorNodeEntity;
}
