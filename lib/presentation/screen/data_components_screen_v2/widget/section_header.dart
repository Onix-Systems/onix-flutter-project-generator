import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.contrastColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            color: context.appColors.textColor,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
