import 'package:{{project_name}}/presentation/style/theme/theme_imports.dart';
import 'package:flutter/material.dart';

ThemeData createLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
    extensions: [
      ThemeColors.light,
      ThemeTextStyles.light,
    ],
    dialogTheme:
        const DialogTheme(backgroundColor: AppColors.scaffoldBackgroundLight),
  );
}
