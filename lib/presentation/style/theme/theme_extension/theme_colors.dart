import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  ///TODO COLORS
  static const light = ThemeColors(
    backgroundColor: AppColors.bgLight,
    buttonColor: AppColors.contrastColor,
    outputColor: AppColors.outputBgdLight,
    contrastColor: AppColors.contrastColor,
  );

  ///TODO colors
  static const dark = ThemeColors(
    backgroundColor: AppColors.bgDark,
    buttonColor: AppColors.contrastColor,
    outputColor: AppColors.outputBgdDark,
    contrastColor: AppColors.contrastColor,
  );

  final Color backgroundColor;
  final Color buttonColor;
  final Color outputColor;
  final Color contrastColor;

  const ThemeColors({
    required this.backgroundColor,
    required this.buttonColor,
    required this.outputColor,
    required this.contrastColor,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? backgroundColor,
    Color? buttonColor,
    Color? outputColor,
    Color? contrastColor,
    Color? textColor,
    Color? contrastTextColor,
  }) {
    return ThemeColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      buttonColor: buttonColor ?? this.buttonColor,
      outputColor: outputColor ?? this.outputColor,
      contrastColor: contrastColor ?? this.contrastColor,
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
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ??
          backgroundColor,
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t) ?? buttonColor,
      outputColor: Color.lerp(outputColor, other.outputColor, t) ?? outputColor,
      contrastColor:
          Color.lerp(contrastColor, other.contrastColor, t) ?? contrastColor,
    );
  }
}
