//@formatter:off
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/app/riverpod/app_provider_imports.dart';
//{imports end}

void registerRiverpod(GetIt getIt) {
  getIt.registerSingleton<StateNotifierProvider<AppProvider, AppState>>(
    StateNotifierProvider<AppProvider, AppState>(
      (ref) => AppProvider(),
    ),
  );
  //{riverpod end}
}

StateNotifierProvider<AppProvider, AppState> appProvider() =>
    GetIt.I.get<StateNotifierProvider<AppProvider, AppState>>();
