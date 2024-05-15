import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';

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
        color: AppColors.orange,
        splashRadius: 20,
        style: IconButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: const CircleBorder(),
        ),
        onPressed: onPressed,
        icon: const Icon(Icons.close),
      ),
    );
  }
}
