import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class SummaryStylesCell extends StatelessWidget {
  final String variable;
  final List<AppStyle> value;

  const SummaryStylesCell({
    required this.variable,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.inactiveText,
          strokeAlign: BorderSide.strokeAlignOutside,
          width: 2,
        ),
        color: AppColors.orange,
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
                  color: AppColors.bgDark,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 100,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: AppColors.bgDark,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: value
                        .whereType<AppColorStyle>()
                        .toList()
                        .map(
                          (e) => Container(
                            width: 50,
                            height: 50,
                            color: e.color,
                            alignment: Alignment.center,
                          ),
                        )
                        .toList(),
                  ),
                  const Delimiter.height(5),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: value
                        .whereType<AppTextStyle>()
                        .toList()
                        .map(
                          (e) => Text(
                            '${e.name}: ${e.fontFamily}, size: ${e.fontSize}, weight: ${e.fontWeight}, letterSpacing: ${e.letterSpacing.toStringAsFixed(2)}',
                            style: context.appTextStyles.fs18,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
