import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:recase/recase.dart';

class TextStyleItem extends StatelessWidget {
  final AppTextStyle textStyle;

  const TextStyleItem({required this.textStyle, super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.appColors.fadedColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textStyle.name.sentenceCase,
              style: textStyle.getFontStyle(),
            ),
            Text(
              textStyle.toString(),
              style: context.appTextStyles.fs18,
            ),
          ],
        ),
      ),
    );
  }
}
