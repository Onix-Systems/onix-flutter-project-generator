import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';

class AppTextStyle extends AppStyle {
  final String fontFamily;
  final double fontSize;
  final int fontWeight;
  final double letterSpacing;
  final String color;

  AppTextStyle({
    required super.id,
    required super.name,
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.letterSpacing,
    required this.color,
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
  String toString() {
    return 'FontFamily: $fontFamily, fontSize: $fontSize, fontWeight: $fontWeight, letterSpacing: $letterSpacing${color.isNotEmpty ? ', color: $color' : ''}';
  }
}
