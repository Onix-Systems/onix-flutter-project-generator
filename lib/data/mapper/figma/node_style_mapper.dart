import 'package:onix_flutter_bricks/core/arch/domain/common/converter/mapper.dart';
import 'package:onix_flutter_bricks/data/model/figma/styles/figma_node_style.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/node_style_property/node_style_property.dart';

class NodeStyleMapper {
  NodeStyleProperty mapNodeStyleDataModelToEntity(FigmaNodeStyle from) =>
      _MapNodeStyleDataModelToEntity().map(from);
}

class _MapNodeStyleDataModelToEntity
    extends Mapper<FigmaNodeStyle, NodeStyleProperty> {
  @override
  NodeStyleProperty map(FigmaNodeStyle from) {
    return NodeStyleProperty(
      key: from.nodeId ?? '',
      name: from.name ?? '',
      description: '',
      style: NodeStyleType.fromRawString(
        from.styleType ?? '',
      ),
    );
  }
}
