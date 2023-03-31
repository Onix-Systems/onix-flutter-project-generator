import 'package:{{project_name}}/presentation/style/theme/theme_imports.dart';
import 'package:flutter/material.dart';

ThemeData createDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgDark,
    extensions: [
      ThemeColors.dark,
      ThemeTextStyles.dark,
    ],
    dialogTheme: const DialogTheme(backgroundColor: AppColors.bgDark),
  );
}
