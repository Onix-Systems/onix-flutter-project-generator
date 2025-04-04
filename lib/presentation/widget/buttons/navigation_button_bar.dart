import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';

class NavigationButtonBar extends StatelessWidget {
  final String nextText;
  final VoidCallback onNextPressed;
  final String prevText;
  final VoidCallback onPrevPressed;
  final bool isActive;
  final FocusNode? focusNode;
  final IconData? nextIcon;
  final bool showIcons;

  const NavigationButtonBar({
    required this.nextText,
    required this.prevText,
    required this.onNextPressed,
    required this.onPrevPressed,
    this.isActive = true,
    this.focusNode,
    this.nextIcon,
    this.showIcons = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppFilledButton(
          label: prevText,
          icon: showIcons ? Icons.arrow_back_ios_rounded : null,
          onPressed: onPrevPressed,
        ),
        const Gap(10),
        AppFilledButton(
          focusNode: focusNode,
          active: isActive,
          label: nextText,
          icon: showIcons ? nextIcon ?? Icons.arrow_forward_ios_rounded : null,
          iconLeft: false,
          onPressed: onNextPressed,
        ),
      ],
    );
  }
}
