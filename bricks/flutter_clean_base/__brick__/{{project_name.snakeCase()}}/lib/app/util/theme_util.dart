import 'package:flutter/material.dart';

class ThemeUtil extends InheritedWidget {
  final ThemeMode mode;

  const ThemeUtil({
    required this.mode,
    required super.child,
    super.key,
  });

  static ThemeUtil of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeUtil>()!;
  }

  @override
  bool updateShouldNotify(ThemeUtil oldWidget) {
    return mode != oldWidget.mode;
  }
}
