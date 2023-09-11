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
  static List<Color> buttonDisabledColor = [
    AppColors.buttonDisabledLight,
    AppColors.buttonDisabledDark,
  ];
}{{/theme_generate}}
{{^theme_generate}}class ThemeColors extends ThemeExtension<ThemeColors> {
  static const light = ThemeColors(
    backgroundColor: AppColors.bgLight,
    buttonColor: AppColors.greenLight,
    buttonDisabledColor: AppColors.buttonDisabledLight,
  );

  static const dark = ThemeColors(
    backgroundColor: AppColors.bgDark,
    buttonColor: AppColors.greenDark,
    buttonDisabledColor: AppColors.buttonDisabledDark,
  );

  final Color backgroundColor;
  final Color buttonColor;
  final Color buttonDisabledColor;

  const ThemeColors({
    required this.backgroundColor,
    required this.buttonColor,
    required this.buttonDisabledColor,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? backgroundColor,
    Color? buttonColor,
    Color? buttonDisabledColor,
  }) {
    return ThemeColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      buttonColor: buttonColor ?? this.buttonColor,
      buttonDisabledColor: buttonDisabledColor ?? this.buttonDisabledColor,
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
      buttonDisabledColor:
      Color.lerp(buttonDisabledColor, other.buttonDisabledColor, t) ??
          buttonDisabledColor,
    );
  }
}{{/theme_generate}}