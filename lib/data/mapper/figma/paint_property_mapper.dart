import 'package:onix_flutter_bricks/core/arch/domain/common/converter/mapper.dart';
import 'package:onix_flutter_bricks/data/model/figma/properties/paint/paint_property_data_model.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/color_property/color_property.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';

class PaintPropertyMapper {
  Iterable<PaintProperty> mapPaintPropertyDataModelToEntity(
    Iterable<PaintPropertyDataModel> from,
  ) =>
      _MapPaintsPropertyDataModelToEntity().mapIterable(from);
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
