import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/fill_paints_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';

part 'sticky_node_entity.freezed.dart';

// https://www.figma.com/developers/api#sticky-props
@freezed
class StickyNodeEntity with _$StickyNodeEntity implements FillPaintsNode {
  const factory StickyNodeEntity({
    required String id,
    required String key,
    required String name,
    required String type,
    required List<PaintProperty> fills,
  }) = _StickyNodeEntity;
}
