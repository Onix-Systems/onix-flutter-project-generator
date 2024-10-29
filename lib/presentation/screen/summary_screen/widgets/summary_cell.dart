import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class SummaryCell extends StatelessWidget {
  final String variable;
  final String value;

  const SummaryCell({
    required this.variable,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.appColors.darkContrastColor,
          strokeAlign: BorderSide.strokeAlignOutside,
          width: 0.5,
        ),
        color: context.appColors.contrastColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 48,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                variable,
                style: context.appTextStyles.fs18?.copyWith(
                  color: context.appColors.textColor,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 100,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: context.appColors.darkColor,
              child: SelectableText(
                value,
                style: context.appTextStyles.fs18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
