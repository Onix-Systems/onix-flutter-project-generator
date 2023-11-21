import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_style.dart';

part 'app_text_style.g.dart';

@JsonSerializable()
class AppTextStyle extends AppStyle {
  final String fontFamily;
  final double fontSize;
  final int fontWeight;
  final double letterSpacing;

  const AppTextStyle({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.letterSpacing,
    required super.id,
    required super.name,
  });

  TextStyle getFontStyle() {
    final textStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.values
          .where((element) => element.value == fontWeight)
          .first,
      letterSpacing: letterSpacing,
    );
    try {
      final googleStyle = GoogleFonts.getFont(
        fontFamily,
        textStyle: textStyle,
      );
      return googleStyle;
    } catch (e) {
      return textStyle.copyWith(color: Colors.red);
    }
  }

  @override
  Map<String, dynamic> toJson() => _$AppTextStyleToJson(this);

  @override
  AppStyle fromJson(Map<String, dynamic> json) => AppTextStyle.fromJson(json);

  factory AppTextStyle.fromJson(Map<String, dynamic> json) =>
      _$AppTextStyleFromJson(json);
}
