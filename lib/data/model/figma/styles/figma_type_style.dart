import 'package:freezed_annotation/freezed_annotation.dart';

part 'figma_type_style.g.dart';

@JsonSerializable()
class FigmaTypeStyle {
  final String? fontFamily;
  final num? fontWeight;
  final num? fontSize;
  final num? letterSpacing;

  const FigmaTypeStyle({
    required this.fontFamily,
    required this.fontWeight,
    required this.fontSize,
    required this.letterSpacing,
  });

  factory FigmaTypeStyle.fromJson(Map<String, dynamic> json) =>
      _$FigmaTypeStyleFromJson(json);

  Map<String, dynamic> toJson() => _$FigmaTypeStyleToJson(this);
}
