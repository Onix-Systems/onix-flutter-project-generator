import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';

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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.white.withOpacity(0.5),
          strokeAlign: BorderSide.strokeAlignOutside,
          width: 0.5,
        ),
        color: CupertinoColors.activeBlue.withOpacity(0.1),
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
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 100,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: AppColors.bgDark,
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
