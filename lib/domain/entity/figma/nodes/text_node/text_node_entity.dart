import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/fill_paints_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/type_style/type_style_metadata.dart';

part 'text_node_entity.freezed.dart';

// https://www.figma.com/developers/api#text-props
@freezed
class TextNodeEntity with _$TextNodeEntity implements FillPaintsNode {
  const factory TextNodeEntity({
    required TypeStyleMetadata style,
    required String id,
    required String key,
    required String name,
    required String type,
    required List<PaintProperty> fills,
  }) = _TextNodeEntity;
}
