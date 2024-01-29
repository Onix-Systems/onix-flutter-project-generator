import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/color_property/color_property.dart';

part 'paint_property.freezed.dart';

// https://www.figma.com/developers/api#paint-type
@freezed
class PaintProperty with _$PaintProperty {
  const factory PaintProperty({
    required ColorProperty color,
    required PaintPropertyType type,
  }) = _PaintProperty;
}

enum PaintPropertyType {
  solid,
  gradientLinear,
  gradientRadial,
  gradientAngular,
  gradientDiamond,
  image,
  emoji,
  video,
  unknown;

  static PaintPropertyType fromRawString(String rawString) =>
      switch (rawString) {
        'SOLID' => solid,
        'GRADIENT_LINEAR' => gradientLinear,
        'GRADIENT_RADIAL' => gradientRadial,
        'GRADIENT_ANGULAR' => gradientAngular,
        'GRADIENT_DIAMOND' => gradientDiamond,
        'IMAGE' => image,
        'EMOJI' => emoji,
        'VIDEO' => video,
        String() => unknown,
      };
}
