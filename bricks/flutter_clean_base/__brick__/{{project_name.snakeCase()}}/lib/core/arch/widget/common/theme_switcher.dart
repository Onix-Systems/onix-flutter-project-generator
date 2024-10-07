import 'package:flutter/material.dart';

class ThemeModeSwitcher extends StatefulWidget {
  final Widget Function(BuildContext, ThemeMode, Widget?) builder;
  final ThemeMode initialThemeMode;

  const ThemeModeSwitcher({
    required this.builder,
    this.initialThemeMode = ThemeMode.system,
    super.key,
  });

  @override
  State<ThemeModeSwitcher> createState() => _ThemeModeSwitcherState();
}

class _ThemeModeSwitcherState extends State<ThemeModeSwitcher> {
  final ValueNotifier _themeNotifier = ValueNotifier(widget.initialThemeMode);

  @override
  Widget build(BuildContext context) {
    return ThemeModeNotifier(
      notifier: _themeNotifier,
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: _themeNotifier,
        builder: widget.builder,
      ),
    );
  }
}

class ThemeModeNotifier extends InheritedWidget {
  final ValueNotifier<ThemeMode> notifier;

  const ThemeModeNotifier({
    required this.notifier,
    required super.child,
    super.key,
  });

  void changeTheme(ThemeMode themeMode) {
    notifier.value = themeMode;
  }

  static ThemeModeNotifier of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeModeNotifier>()!;
  }

  @override
  bool updateShouldNotify(covariant ThemeModeNotifier oldWidget) {
    if (notifier.value != oldWidget.notifier.value) {
      return true;
    }
    return false;
  }
}
