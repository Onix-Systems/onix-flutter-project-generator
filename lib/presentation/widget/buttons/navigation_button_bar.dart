import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';

class NavigationButtonBar extends StatelessWidget {
  final String nextText;
  final VoidCallback onNextPressed;
  final String prevText;
  final VoidCallback onPrevPressed;
  final bool isActive;
  final FocusNode? focusNode;
  final IconData? nextIcon;

  const NavigationButtonBar({
    required this.nextText,
    required this.prevText,
    required this.onNextPressed,
    required this.onPrevPressed,
    this.isActive = true,
    this.focusNode,
    this.nextIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppFilledButton(
          label: prevText,
          icon: Icons.arrow_back_ios_rounded,
          onPressed: onPrevPressed,
        ),
        const Delimiter.width(10),
        AppFilledButton(
          focusNode: focusNode,
          active: isActive,
          label: nextText,
          icon: nextIcon ?? Icons.arrow_forward_ios_rounded,
          iconLeft: false,
          onPressed: onNextPressed,
        )
      ],
    );
  }
}
