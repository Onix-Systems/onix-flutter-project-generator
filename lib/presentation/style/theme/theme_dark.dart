import 'package:flutter/material.dart';

import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';

ThemeData createDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgDark,
    extensions: const [
      ThemeColors.dark,
      ThemeTextStyles.dark,
    ],
    dialogTheme: const DialogTheme(backgroundColor: AppColors.bgDark),
  );
}
