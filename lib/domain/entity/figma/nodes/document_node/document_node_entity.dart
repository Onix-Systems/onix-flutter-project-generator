import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/base_node.dart';

part 'document_node_entity.freezed.dart';

@freezed
class DocumentNodeEntity with _$DocumentNodeEntity implements BaseNode {
  const factory DocumentNodeEntity({
    required String id,
    required String key,
    required String name,
    required String type,
    required List<BaseNode> children,
  }) = _DocumentNodeEntity;
}
