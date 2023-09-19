import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class AppActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const AppActionButton(
      {required this.onPressed, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: CupertinoColors.inactiveGray,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: context.appTextStyles.fs18?.copyWith(
            color: CupertinoColors.systemBlue.darkHighContrastColor,
          ),
        ),
      ),
    );
  }
}
