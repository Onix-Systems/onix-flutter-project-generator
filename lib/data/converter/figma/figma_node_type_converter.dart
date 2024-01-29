import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/connector/connector_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/document/document_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/frame/frame_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/node/node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/section/section_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/shape_with_text/shape_with_text_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/sticky/sticky_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/table_cell/table_cell_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/text/text_node_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/nodes/vector/vector_node_data_model.dart';

class FigmaNodeTypeConverter
    extends JsonConverter<NodeDataModel, Map<String, dynamic>> {
  const FigmaNodeTypeConverter();

  @override
  NodeDataModel fromJson(Map<String, dynamic> json) {
    final type = json['type'];

    switch (type) {
      case 'DOCUMENT':
        return DocumentNodeDataModel.fromJson(json);
      case 'FRAME':
      case 'COMPONENT':
      case 'COMPONENT_SET':
      case 'INSTANCE':
      case 'GROUP':
        return FrameNodeDataModel.fromJson(json);
      case 'SECTION':
        return SectionNodeDataModel.fromJson(json);
      case 'VECTOR':
      case 'BOOLEAN_OPERATION':
      case 'STAR':
      case 'LINE':
      case 'ELLIPSE':
      case 'REGULAR_POLYGON':
      case 'WASHI_TAPE':
      case 'RECTANGLE':
        return VectorNodeDataModel.fromJson(json);
      case 'TEXT':
        return TextNodeDataModel.fromJson(json);
      case 'TABLE_CELL':
        return TableCellNodeDataModel.fromJson(json);
      case 'STICKY':
        return StickyNodeDataModel.fromJson(json);
      case 'SHAPE_WITH_TEXT':
        return ShapeWithTextNodeDataModel.fromJson(json);
      case 'CONNECTOR':
        return ConnectorNodeDataModel.fromJson(json);
      default:
        return NodeDataModel.fromJson(json);
    }
  }

  @override
  Map<String, dynamic> toJson(NodeDataModel object) {
    // TODO(Ivan Modlo): Implement it if necessary
    throw UnimplementedError();
  }
}
