import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';

class EditRemoveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEdit;

  const EditRemoveButton({
    required this.onPressed,
    this.isEdit = true,
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
          icon: Icon(isEdit ? Icons.edit : Icons.close)),
    );
  }
}
