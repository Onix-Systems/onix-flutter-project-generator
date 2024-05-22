import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:recase/recase.dart';

class ColorStylesWrap extends StatelessWidget {
  final List<AppColorStyle> styles;

  const ColorStylesWrap({
    required this.styles,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(
          styles.length,
          (index) => Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: styles[index].color,
            ),
            alignment: Alignment.center,
            child: Text(
              styles[index].name.sentenceCase.toLowerCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: styles[index].color,
              ),
            ),
          ),
        ));
  }
}
