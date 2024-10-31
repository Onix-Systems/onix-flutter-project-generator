import 'package:flutter/widgets.dart';

extension UiUtilExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  Size get screenSize => MediaQuery.sizeOf(this);

  double get statusBarHeight => MediaQuery.paddingOf(this).top;
}
