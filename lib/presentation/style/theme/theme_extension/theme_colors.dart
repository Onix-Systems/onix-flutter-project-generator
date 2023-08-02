import 'package:flutter/material.dart';

import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
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
    );
  }
}
