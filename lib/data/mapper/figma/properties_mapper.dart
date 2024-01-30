import 'package:onix_flutter_bricks/core/arch/domain/common/converter/mapper.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/node_style/figma_node_style.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/paint/paint_property_data_model.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/type_style/figma_type_style.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/color_property/color_property.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/node_style_property/node_style_property.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/type_style/type_style_metadata.dart';

class PropertyMapper {
  Iterable<PaintProperty> mapPaintPropertyDataModelToEntity(
    Iterable<PaintPropertyDataModel> from,
  ) =>
      _MapPaintsPropertyDataModelToEntity().mapIterable(from);

  NodeStyleProperty mapNodeStyleDataModelToEntity(FigmaNodeStyle from) =>
      _MapNodeStyleDataModelToEntity().map(from);

  TypeStyleMetadata mapFigmaTypeStyleDataModelToEntity(FigmaTypeStyle from) =>
      _MapFigmaTypeStyleDataModelToEntity().map(from);
}

class _MapPaintsPropertyDataModelToEntity
    extends MapperIterable<PaintPropertyDataModel, PaintProperty> {
  @override
  PaintProperty map(PaintPropertyDataModel from) {
    return PaintProperty(
      color: ColorProperty(
        r: from.color?.r ?? 0,
        g: from.color?.g ?? 0,
        b: from.color?.b ?? 0,
        a: from.color?.a ?? 255,
      ),
      type: PaintPropertyType.fromRawString(from.type ?? ''),
    );
  }
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

class _MapFigmaTypeStyleDataModelToEntity
    extends Mapper<FigmaTypeStyle, TypeStyleMetadata> {
  @override
  TypeStyleMetadata map(FigmaTypeStyle from) {
    return TypeStyleMetadata(
      fontFamily: from.fontFamily ?? '',
      fontWeight: from.fontWeight ?? 0,
      fontSize: from.fontSize ?? 0,
      letterSpacing: from.letterSpacing ?? 0,
    );
  }
}
