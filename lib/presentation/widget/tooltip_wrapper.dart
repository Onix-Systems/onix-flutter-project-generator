import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class TooltipWrapper extends StatelessWidget {
  final String message;

  const TooltipWrapper({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      triggerMode: TooltipTriggerMode.tap,
      message: message,
      margin: const EdgeInsets.symmetric(horizontal: 150),
      textStyle: context.appTextStyles.caption14?.copyWith(
        color: context.appColors.darkColor,
      ),
      child: Icon(
        Icons.info_outline,
        size: 32,
        color: context.appColors.textColor,
      ),
    );
  }
}
