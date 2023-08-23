import 'package:flutter/material.dart';

class Delimiter extends SizedBox {
  const Delimiter.height(double h, {Key? key}) : super(key: key, height: h);

  const Delimiter.width(double w, {Key? key}) : super(key: key, width: w);
}

class ClickableWidget extends StatelessWidget {
  const ClickableWidget({
    super.key,
    required this.child,
    this.onTap,
    this.color = Colors.transparent,
    this.splashColor,
    this.borderRadius,
    this.borderRadiusInk,
    this.elevation = 0,
  });

  final Widget child;
  final VoidCallback? onTap;
  final Color color;
  final Color? splashColor;
  final double elevation;
  final BorderRadiusGeometry? borderRadius;
  final BorderRadius? borderRadiusInk;

  @override
  Widget build(BuildContext context) => Material(
        color: color,
        elevation: elevation,
        borderRadius: borderRadius ?? borderRadiusInk,
        child: InkWell(
          borderRadius: borderRadiusInk ?? BorderRadius.circular(0.0),
          splashColor:
              splashColor ?? Theme.of(context).primaryColor.withOpacity(0.03),
          highlightColor:
              splashColor ?? Theme.of(context).primaryColor.withOpacity(0.03),
          onTap: onTap,
          child: child,
        ),
      );
}
