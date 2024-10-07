import 'package:flutter/material.dart';
{{#isBase}}import 'package:{{project_name}}/core/arch/widget/common/theme_switcher.dart';{{/isBase}}
{{#isBloc}}import 'package:{{project_name}}/app/bloc/app_bloc_imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';{{/isBloc}}
{{#isProvider}}import 'package:{{project_name}}/app/provider/app_provider_imports.dart';
import 'package:provider/provider.dart';{{/isProvider}}

extension ThemeBrightnessExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  void switchThemeBrightness({{^isBase}}{
    required ThemeMode currentThemeMode,
  }{{/isBase}}) {
    {{#isBase}}final currentThemeMode = ThemeModeNotifier.of(this).notifier.value;{{/isBase}}
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
    {{#isBase}}ThemeModeNotifier.of(this).changeTheme(newThemeMode);{{/isBase}}
  }
}
