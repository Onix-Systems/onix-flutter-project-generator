import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_models.freezed.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.changeTheme(ThemeMode mode) = ChangeThemeEvent;
}

@freezed
class AppScreenState with _$AppScreenState {
  const factory AppScreenState({required ThemeMode themeMode}) =
      _AppScreenState;
}

class AppSR {}
