import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onix_flutter_bricks/app/bloc/app_bloc_imports.dart';

extension ThemeBrightnessExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  void switchThemeBrightness({
    required ThemeMode currentThemeMode,
  }) {
    var newThemeMode = ThemeMode.system;
    switch (currentThemeMode) {
      case ThemeMode.system:
        {
          if (isDarkMode) {
            newThemeMode = ThemeMode.light;
            break;
          }
          newThemeMode = ThemeMode.dark;
          break;
        }
      case ThemeMode.light:
        {
          newThemeMode = ThemeMode.dark;
          break;
        }
      case ThemeMode.dark:
        {
          newThemeMode = ThemeMode.light;
          break;
        }
    }
    BlocProvider.of<AppBloc>(this).add(
      AppEvent.changeTheme(
        newThemeMode,
      ),
    );
  }
}
