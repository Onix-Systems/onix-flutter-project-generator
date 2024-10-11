import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name}}/app/riverpod/app_state.dart';

class AppProvider extends StateNotifier<AppState> {
  AppProvider() : super(const AppState());

  void switchTheme(ThemeMode themeMode) {
    state = state.copyWith(themeMode: themeMode);
  }
}
