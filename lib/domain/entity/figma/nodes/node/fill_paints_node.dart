import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/base_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';

abstract class FillPaintsNode extends BaseNode {
  List<PaintProperty> get fills;
}
