import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:recase/recase.dart';

class ColorStyleItem extends StatelessWidget {
  final AppColorStyle colorStyle;

  const ColorStyleItem({required this.colorStyle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colorStyle.color,
      ),
      alignment: Alignment.center,
      child: Text(
        colorStyle.name.sentenceCase.toLowerCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: colorStyle.color.computeLuminance() > 0.3
              ? Colors.black
              : Colors.white,
        ),
      ),
    );
  }
}
