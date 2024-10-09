import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onix_flutter_provider/onix_flutter_provider.dart';

class AppProvider extends BaseProvider {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  AppProvider() : super();

  void onChangeTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
