import 'package:flutter/material.dart';

class ThemeModeSwitcher extends StatefulWidget {
  final Widget Function(BuildContext, ThemeMode, Widget?) builder;

  const ThemeModeSwitcher({
    required this.builder,
    super.key,
  });

  @override
  State<ThemeModeSwitcher> createState() => _ThemeModeSwitcherState();
}

class _ThemeModeSwitcherState extends State<ThemeModeSwitcher> {
  late final ValueNotifier<ThemeMode> themeNotifier;

  @override
  void initState() {
    super.initState();

    themeNotifier = ValueNotifier(ThemeMode.system);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeModeUtil(
      notifier: themeNotifier,
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: widget.builder,
      ),
    );
  }
}

class ThemeModeUtil extends InheritedWidget {
  final ValueNotifier<ThemeMode> notifier;

  const ThemeModeUtil({
    required this.notifier,
    required super.child,
    super.key,
  });

  void changeTheme(ThemeMode themeMode) {
    if (notifier.value != themeMode) {
      notifier.value = themeMode;
    }
  }

  static ThemeModeUtil of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeModeUtil>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (themeMode != oldWidget.themeMode) {
      return true;
    }
    return false;
  }
}
