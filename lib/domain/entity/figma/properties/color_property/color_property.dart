import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_property.freezed.dart';

// https://www.figma.com/developers/api#color-type

@freezed
class ColorProperty with _$ColorProperty {
  const factory ColorProperty({
    required double r,
    required double g,
    required double b,
    required double a,
  }) = _ColorProperty;
}
