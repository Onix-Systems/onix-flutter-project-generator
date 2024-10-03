import 'dart:async';

import 'package:{{project_name}}/app/provider/app_provider_imports.dart';
import 'package:{{project_name}}/core/arch/provider/base_provider.dart';

class AppProvider extends BaseProvider<AppState> {
  AppProvider() : super(const AppState()) {
    init();
  }

  void init() {
// Add your initialization code here
    notifyListeners();
  }
}
