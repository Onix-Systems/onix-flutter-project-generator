import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class LabeledCheckbox extends StatelessWidget {
  final String label;
  final bool initialValue;
  final VoidCallback onAction;
  final bool disabled;
  final bool focused;

  const LabeledCheckbox({
    required this.label,
    required this.onAction,
    this.initialValue = false,
    this.disabled = false,
    this.focused = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color:
              focused ? context.appColors.controlColor : Colors.transparent,
          width: 1,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MSHCheckbox(
            value: initialValue,
            isDisabled: disabled,
            duration: const Duration(milliseconds: 200),
            colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
              checkedColor: context.appColors.controlColor,
              uncheckedColor: context.appColors.controlColor,
              disabledColor: context.appColors.fadedColor,
            ),
            onChanged: (value) {
              onAction();
            },
            size: 20,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: context.appTextStyles.fs18,
          ),
        ],
      ),
    );
  }
}
