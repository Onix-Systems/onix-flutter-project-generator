import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class AppActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool active;

  const AppActionButton({
    required this.onPressed,
    required this.label,
    this.active = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
        onPressed: active ? onPressed : null,
        style: TextButton.styleFrom(
          foregroundColor: context.appColors.contrastColor,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: context.appTextStyles.fs18?.copyWith(
            color: active
                ? context.appColors.textColor
                : context.appColors.fadedColor,
          ),
        ),
      ),
    );
  }
}
