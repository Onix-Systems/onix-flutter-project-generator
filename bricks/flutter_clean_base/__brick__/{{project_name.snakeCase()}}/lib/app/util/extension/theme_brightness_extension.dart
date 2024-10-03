import 'package:flutter/material.dart';
{{#isBloc}}import 'package:{{project_name}}/app/bloc/app_bloc_imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';{{/isBloc}}
{{#isProvider}}import 'package:{{project_name}}/app/provider/app_provider_imports.dart';
import 'package:provider/provider.dart';{{/isProvider}}

extension ThemeBrightnessExtension on BuildContext {
  {{#isBase}}void switchThemeBrightness() {
  ThemeModeUtil.of(this).changeTheme();
  }{{/isBase}}

  {{^isBase}}bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

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
    {{#isBloc}}BlocProvider.of<AppBloc>(this).add(
      AppEvent.changeTheme(
        newThemeMode,
      ),
    );{{/isBloc}}
    {{#isProvider}}read<AppProvider>().onChangeTheme(newThemeMode);{{/isProvider}}
  }
  {{/isBase}}
}
