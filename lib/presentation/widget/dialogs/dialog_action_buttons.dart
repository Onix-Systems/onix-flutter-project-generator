import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_action_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/ok_cancel_keyboard_listener.dart';

class DialogActionButtons extends StatelessWidget {
  final String leftButtonLabel;
  final String rightButtonLabel;
  final VoidCallback leftButtonOnPressed;
  final VoidCallback rightButtonOnPressed;
  final bool isLeftButtonActive;
  final bool isRightButtonActive;
  final FocusNode? focusNode;

  const DialogActionButtons({
    required this.leftButtonLabel,
    required this.rightButtonLabel,
    required this.leftButtonOnPressed,
    required this.rightButtonOnPressed,
    this.isLeftButtonActive = true,
    this.isRightButtonActive = true,
    this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OkCancelKeyboardListener(
      focusNode: focusNode,
      onOk: isLeftButtonActive ? leftButtonOnPressed : null,
      onCancel: isRightButtonActive ? rightButtonOnPressed : null,
      mustPop: false,
      child: Column(
        children: [
          Divider(
            color: context.appColors.controlColor,
            height: 0,
            thickness: 0.2,
          ),
          Row(
            children: [
              Expanded(
                child: AppActionButton(
                  onPressed: leftButtonOnPressed,
                  label: leftButtonLabel,
                  active: isLeftButtonActive,
                ),
              ),
              Container(
                color: context.appColors.controlColor,
                height: 50,
                width: 0.2,
              ),
              Expanded(
                child: AppActionButton(
                  onPressed: rightButtonOnPressed,
                  label: rightButtonLabel,
                  active: isRightButtonActive,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
