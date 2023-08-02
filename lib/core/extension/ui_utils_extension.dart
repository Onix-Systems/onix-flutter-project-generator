import 'package:flutter/widgets.dart';

extension UiUtilExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  Size get screenSize => MediaQuery.of(this).size;

  double get statusBarHeight => MediaQuery.of(this).padding.top;
}
