import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_style_property.freezed.dart';

// https://www.figma.com/developers/api#style-type
@freezed
class NodeStyleProperty with _$NodeStyleProperty {
  const factory NodeStyleProperty({
    required String key,
    required String name,
    required String description,
    required NodeStyleType style,
  }) = _NodeStyleProperty;
}

enum NodeStyleType {
  fill,
  text,
  effect,
  grid,
  unknown;

  static NodeStyleType fromRawString(String rawString) => switch (rawString) {
        'FILL' => fill,
        'TEXT' => text,
        'EFFECT' => effect,
        'GRID' => grid,
        String() => unknown,
      };
}
