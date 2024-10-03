import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:{{project_name}}/core/arch/provider/base_provider.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState implements ProviderState {
  const factory AppState({
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _AppState;
}
