import 'package:flutter/material.dart';

class KeyboardClosable extends StatelessWidget {
  const KeyboardClosable({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: child,
      );
}
