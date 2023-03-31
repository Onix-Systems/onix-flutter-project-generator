import 'package:{{project_name}}/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';
{{#theme_generate}}import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme_colors.tailor.dart';

@Tailor(themeGetter: ThemeGetter.onBuildContext)
class _$ThemeColors {
  static List<Color> backgroundColor = [
    AppColors.bgLight,
    AppColors.bgDark,
  ];
  static List<Color> buttonColor = [
    AppColors.greenLight,
    AppColors.greenDark,
  ];
}{{/theme_generate}}
{{^theme_generate}}class ThemeColors extends ThemeExtension<ThemeColors> {
  static const light = ThemeColors(
    backgroundColor: AppColors.bgLight,
    buttonColor: AppColors.greenLight,
  );

  static const dark = ThemeColors(
    backgroundColor: AppColors.bgDark,
    buttonColor: AppColors.greenDark,
  );

  final Color backgroundColor;
  final Color buttonColor;

  const ThemeColors({
    required this.backgroundColor,
    required this.buttonColor,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? backgroundColor,
    Color? buttonColor,
  }) {
    return ThemeColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      buttonColor: buttonColor ?? this.buttonColor,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(ThemeExtension<ThemeColors>? other,
      double t,) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ??
          backgroundColor,
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t) ?? buttonColor,
    );
  }
}{{/theme_generate}}