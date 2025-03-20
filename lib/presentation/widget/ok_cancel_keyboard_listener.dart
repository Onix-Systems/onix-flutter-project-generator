import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OkCancelKeyboardListener extends StatelessWidget {
  final Widget child;
  final VoidCallback? onOk;
  final VoidCallback? onCancel;
  final bool needToPop;
  final dynamic okValue;
  final dynamic cancelValue;
  final FocusNode? focusNode;

  const OkCancelKeyboardListener({
    required this.child,
    this.onOk,
    this.onCancel,
    this.needToPop = true,
    this.okValue,
    this.cancelValue,
    this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      autofocus: true,
      onKeyEvent: (node, event) {
        if (HardwareKeyboard.instance
                .isLogicalKeyPressed(LogicalKeyboardKey.enter) ||
            HardwareKeyboard.instance
                .isLogicalKeyPressed(LogicalKeyboardKey.numpadEnter)) {
          onOk?.call();
          pop(context, okValue);
          return KeyEventResult.handled;
        } else if (HardwareKeyboard.instance
            .isLogicalKeyPressed(LogicalKeyboardKey.escape)) {
          onCancel?.call();
          pop(context, cancelValue);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: child,
    );
  }

  void pop(BuildContext context, dynamic value) {
    if (context.mounted && needToPop) {
      if (value != null) {
        Navigator.of(context).pop(value);
      } else {
        Navigator.of(context).pop();
      }
    }
  }
}
