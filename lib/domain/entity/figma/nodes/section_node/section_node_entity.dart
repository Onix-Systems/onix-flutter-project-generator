import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/fill_paints_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';

part 'section_node_entity.freezed.dart';

// https://www.figma.com/developers/api#section-props
@freezed
class SectionNodeEntity with _$SectionNodeEntity implements FillPaintsNode {
  const factory SectionNodeEntity({
    required List<PaintProperty> fills,
    required String id,
    required String key,
    required String name,
    required String type,
  }) = _SectionNodeEntity;
}
