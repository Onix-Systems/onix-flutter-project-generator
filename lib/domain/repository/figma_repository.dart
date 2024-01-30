import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/base_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/node_style_property/node_style_property.dart';

abstract interface class FigmaRepository {
  Future<Map<String, NodeStyleProperty>> getFigmaFiles({
    required String figmaId,
    required String token,
  });

  Future<List<BaseNode>> getFigmaNodes({
    required String nodeIds,
    required String token,
    required String figmaId,
  });
}
