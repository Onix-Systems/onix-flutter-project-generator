import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  static const light = ThemeColors(
    backgroundColor: AppColors.bgLight,
    buttonColor: AppColors.greenLight,
    outputColor: AppColors.outputBgdLight,
    contrastColor: AppColors.outputBgdLight,
    textColor: AppColors.outputBgdLight,
    contrastTextColor: AppColors.outputBgdLight,
  );

  static const dark = ThemeColors(
    backgroundColor: AppColors.bgDark,
    buttonColor: AppColors.greenDark,
    outputColor: AppColors.outputBgdDark,
    contrastColor: AppColors.outputBgdLight,
    textColor: AppColors.outputBgdLight,
    contrastTextColor: AppColors.outputBgdLight,
  );

  final Color backgroundColor;
  final Color buttonColor;
  final Color outputColor;
  final Color contrastColor;
  final Color textColor;
  final Color contrastTextColor;

  const ThemeColors({
    required this.backgroundColor,
    required this.buttonColor,
    required this.outputColor,
    required this.contrastColor,
    required this.textColor,
    required this.contrastTextColor,
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
      textColor: textColor ?? this.textColor,
      contrastTextColor: contrastTextColor ?? this.contrastTextColor,
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
      textColor: Color.lerp(textColor, other.textColor, t) ?? textColor,
      contrastTextColor:
          Color.lerp(contrastTextColor, other.contrastTextColor, t) ??
              contrastTextColor,
    );
  }
}
