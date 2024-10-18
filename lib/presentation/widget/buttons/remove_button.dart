import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class RemoveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RemoveButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: IconButton(
        iconSize: 25,
        color: context.appColors.controlColor,
        splashRadius: 20,
        style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
        ),
        onPressed: onPressed,
        icon: const Icon(Icons.close),
      ),
    );
  }
}
