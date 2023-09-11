import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:{{project_name}}/presentation/style/theme/theme_extension/ext.dart';

class AppStandardButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String value;
  final Color? color;
  final bool enabled;
  final bool expanded;
  final double? height;
  final double? width;

  const AppStandardButton({
    required this.onPressed,
    required this.value,
    this.enabled = true,
    this.expanded = false,
    this.color,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : width,
      height: height,
      child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: color ?? context.appColors.buttonColor,
          ),
          onPressed: enabled ? onPressed : null,
          child: Text(
            value,
            style: context.appTextStyles.button18,
          )),
    );
  }
}
