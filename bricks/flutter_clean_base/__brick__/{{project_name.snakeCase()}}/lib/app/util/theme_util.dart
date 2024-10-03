import 'package:flutter/material.dart';

class ThemeModeUtil extends InheritedWidget {
  final ValueNotifier<ThemeMode> notifier;

  const ThemeModeUtil({
    required this.notifier,
    required super.child,
    super.key,
  });

  void changeTheme() {
    if (notifier.value == ThemeMode.light) {
      notifier.value = ThemeMode.dark;
    } else {
      notifier.value = ThemeMode.light;
    }
  }

  static ThemeModeUtil of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeModeUtil>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
