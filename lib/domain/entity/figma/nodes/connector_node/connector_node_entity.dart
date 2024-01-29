import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/fill_paints_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';

part 'connector_node_entity.freezed.dart';

@freezed
class ConnectorNodeEntity with _$ConnectorNodeEntity implements FillPaintsNode {
  const factory ConnectorNodeEntity({
    required String id,
    required String key,
    required String name,
    required String type,
    required List<PaintProperty> fills,
  }) = _ConnectorNodeEntity;
}
