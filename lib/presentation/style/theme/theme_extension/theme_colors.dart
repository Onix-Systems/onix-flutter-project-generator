import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  static const light = ThemeColors(
    darkColor: AppThemeColors.darkColor,
    controlColor: AppThemeColors.controlColor,
    textColor: AppThemeColors.textColor,
    contrastColor: AppThemeColors.contrastColor,
    fadedColor: AppThemeColors.fadedColor,
    alarmColor: AppThemeColors.alarmColor,
    darkContrastColor: AppThemeColors.darkContrastColor,
  );

  static const dark = ThemeColors(
    darkColor: AppThemeColors.darkColor,
    controlColor: AppThemeColors.controlColor,
    textColor: AppThemeColors.textColor,
    contrastColor: AppThemeColors.contrastColor,
    fadedColor: AppThemeColors.fadedColor,
    alarmColor: AppThemeColors.alarmColor,
    darkContrastColor: AppThemeColors.darkContrastColor,
  );

  final Color darkColor;
  final Color contrastColor;
  final Color controlColor;
  final Color textColor;
  final Color fadedColor;
  final Color alarmColor;
  final Color darkContrastColor;

  const ThemeColors({
    required this.darkColor,
    required this.controlColor,
    required this.textColor,
    required this.contrastColor,
    required this.fadedColor,
    required this.alarmColor,
    required this.darkContrastColor,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? darkColor,
    Color? controlColor,
    Color? textColor,
    Color? contrastColor,
    Color? fadedColor,
    Color? alarmColor,
    Color? darkContrastColor,
  }) {
    return ThemeColors(
      darkColor: darkColor ?? this.darkColor,
      controlColor: controlColor ?? this.controlColor,
      textColor: textColor ?? this.textColor,
      contrastColor: contrastColor ?? this.contrastColor,
      fadedColor: fadedColor ?? this.fadedColor,
      alarmColor: alarmColor ?? this.alarmColor,
      darkContrastColor: darkContrastColor ?? this.darkContrastColor,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      darkColor: Color.lerp(darkColor, other.darkColor, t) ?? darkColor,
      controlColor:
          Color.lerp(controlColor, other.controlColor, t) ?? controlColor,
      textColor: Color.lerp(textColor, other.textColor, t) ?? textColor,
      contrastColor:
          Color.lerp(contrastColor, other.contrastColor, t) ?? contrastColor,
      fadedColor: Color.lerp(fadedColor, other.fadedColor, t) ?? fadedColor,
      alarmColor: Color.lerp(alarmColor, other.alarmColor, t) ?? alarmColor,
      darkContrastColor:
          Color.lerp(darkContrastColor, other.darkContrastColor, t) ??
              darkContrastColor,
    );
  }
}
