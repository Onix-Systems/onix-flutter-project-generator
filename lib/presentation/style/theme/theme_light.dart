import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';

ThemeData createLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.bgLight,
    extensions: const [
      ThemeColors.light,
      ThemeTextStyles.light,
    ],
    dialogTheme: const DialogTheme(backgroundColor: AppColors.bgLight),
  );
}
