import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/fill_paints_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';

part 'frame_node_entity.freezed.dart';

@freezed
class FrameNodeEntity with _$FrameNodeEntity implements FillPaintsNode {
  const factory FrameNodeEntity({
    required List<PaintProperty> fills,
    required String id,
    required String key,
    required String name,
    required String type,
  }) = _FrameNodeEntity;
}
