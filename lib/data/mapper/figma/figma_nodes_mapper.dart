import 'package:onix_flutter_bricks/data/mapper/figma/properties_mapper.dart';
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
import 'package:onix_flutter_bricks/data/model/figma/properties/paint/paint_property_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/type_style/figma_type_style.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/connector_node/connector_node_entity.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/document_node/document_node_entity.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/frame_node/frame_node_entity.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/base_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/base_node_entity.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/section_node/section_node_entity.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/shape_with_text_node/shape_with_text_node_entity.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/sticky_node/sticky_node_entity.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/table_cell_node/table_cell_node_entity.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/text_node/text_node_entity.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/vector_node/vector_node_entity.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class FigmaNodesMapper {
  List<BaseNode> mapNodesDataModelToEntity(List<NodeDataModel> from) =>
      _MapNodeDataModelToEntity().mapList(from).toList();
}

class _MapNodeDataModelToEntity
    extends MapperIterable<NodeDataModel, BaseNode> {
  @override
  BaseNode map(NodeDataModel from) {
    switch (from) {
      case (DocumentNodeDataModel _):
        return DocumentNodeEntity(
          id: from.id ?? '',
          key: from.key ?? '',
          name: from.name ?? '',
          type: from.type ?? '',
          // (Ivan Modlo): Maybe we should call the map method recursively
          children: from.children
                  ?.map(
                    (e) => BaseNodeEntity(
                      id: e?.id ?? '',
                      key: e?.key ?? '',
                      name: e?.name ?? '',
                      type: e?.type ?? '',
                    ),
                  )
                  .toList() ??
              [],
        );
      case TextNodeDataModel _:
        return TextNodeEntity(
          id: from.id ?? '',
          key: from.key ?? '',
          name: from.name ?? '',
          type: from.type ?? '',
          fills: _mapPaintProperty(from.fills),
          style: PropertyMapper().mapFigmaTypeStyleDataModelToEntity(
            from.style ??
                const FigmaTypeStyle(
                  fontFamily: '',
                  fontWeight: 0,
                  fontSize: 0,
                  letterSpacing: 0,
                ),
          ),
        );
      case FrameNodeDataModel _:
        return FrameNodeEntity(
          id: from.id ?? '',
          key: from.key ?? '',
          name: from.name ?? '',
          type: from.type ?? '',
          fills: _mapPaintProperty(from.fills),
        );
      case SectionNodeDataModel _:
        return SectionNodeEntity(
          id: from.id ?? '',
          key: from.key ?? '',
          name: from.name ?? '',
          type: from.type ?? '',
          fills: _mapPaintProperty(from.fills),
        );
      case VectorNodeDataModel _:
        return VectorNodeEntity(
          id: from.id ?? '',
          key: from.key ?? '',
          name: from.name ?? '',
          type: from.type ?? '',
          fills: _mapPaintProperty(from.fills),
        );
      case TableCellNodeDataModel _:
        return TableCellNodeEntity(
          id: from.id ?? '',
          key: from.key ?? '',
          name: from.name ?? '',
          type: from.type ?? '',
          fills: _mapPaintProperty(from.fills),
        );

      case StickyNodeDataModel _:
        return StickyNodeEntity(
          id: from.id ?? '',
          key: from.key ?? '',
          name: from.name ?? '',
          type: from.type ?? '',
          fills: _mapPaintProperty(from.fills),
        );

      case ShapeWithTextNodeDataModel _:
        return ShapeWithTextNodeEntity(
          id: from.id ?? '',
          key: from.key ?? '',
          name: from.name ?? '',
          type: from.type ?? '',
          fills: _mapPaintProperty(from.fills),
        );
      case ConnectorNodeDataModel _:
        return ConnectorNodeEntity(
          id: from.id ?? '',
          key: from.key ?? '',
          name: from.name ?? '',
          type: from.type ?? '',
          fills: _mapPaintProperty(from.fills),
        );
      default:
        return BaseNodeEntity(
          id: from.id ?? '',
          key: from.key ?? '',
          name: from.name ?? '',
          type: from.type ?? '',
        );
    }
  }

  List<PaintProperty> _mapPaintProperty(List<PaintPropertyDataModel>? from) =>
      PropertyMapper().mapPaintPropertyDataModelToEntity(from ?? []).toList();
}
