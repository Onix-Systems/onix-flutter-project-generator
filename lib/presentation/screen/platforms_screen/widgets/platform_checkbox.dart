import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/labeled_checkbox.dart';

class PlatformCheckbox extends StatelessWidget {
  final String label;
  final String assetPath;
  final VoidCallback onAction;
  final bool initialValue;
  final Color? iconColor;

  const PlatformCheckbox({
    required this.label,
    required this.assetPath,
    required this.onAction,
    this.initialValue = false,
    this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => onAction(),
            child: Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.white,
                ),
                borderRadius: BorderRadius.circular(20),
                color: initialValue ? CupertinoColors.activeBlue.withOpacity(0.1) : null,
              ),
              child: SvgPicture.asset(
                assetPath,
                colorFilter: const ColorFilter.mode(
                   AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        LabeledCheckbox(
          label: label,
          initialValue: initialValue,
          onAction: () => onAction(),
        ),
      ],
    );
  }
}
