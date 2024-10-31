import 'package:flutter/material.dart';

class ScrollRootMin extends StatelessWidget {
  const ScrollRootMin({
    required this.child,
    this.physics,
    super.key,
  });

  final Widget child;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        context,
        viewportConstraints,
      ) {
        return SingleChildScrollView(
          physics: physics ?? const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
