import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/base_node.dart';

part 'base_node_entity.freezed.dart';

// https://www.figma.com/developers/api#node-type
@freezed
class BaseNodeEntity with _$BaseNodeEntity implements BaseNode {
  const factory BaseNodeEntity({
    required String id,
    required String key,
    required String name,
    required String type,
  }) = _BaseNodeEntity;
}
