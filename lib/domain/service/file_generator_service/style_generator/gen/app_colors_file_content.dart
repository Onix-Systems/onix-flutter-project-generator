import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/colors_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/style_generator_const.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';

class AppColorsFileContent implements BaseGenerationService<String> {
  @override
  Future<String> generate(BaseGenerationParams params) async {
    if (params is! ColorsGenerationParams) {
      return '';
    }
    return _generateInternal(params.colors);
  }

  String _generateInternal(List<AppColorStyle> colors) {
    final sortedColors = _sortColors(colors);
    final codeLines = List<String>.empty(growable: true);
    codeLines.add('import \'package:flutter/material.dart\';');
    codeLines.addNewLine();
    codeLines.add('class AppColors {');
    codeLines.add('//Light theme colors');
    final lightColors = sortedColors[StyleGeneratorConst.lightColorsKey]
            ?.map(
              (e) =>
                  'static const Color ${e.name} = Color(0x${e.color.value.toRadixString(16)});',
            )
            .toList() ??
        List.empty();
    final darkColors = sortedColors[StyleGeneratorConst.darkColorsKey]
            ?.map(
              (e) =>
                  'static const Color ${e.name} = Color(0x${e.color.value.toRadixString(16)});',
            )
            .toList() ??
        List.empty();
    codeLines.addAll(lightColors);
    codeLines.add('//Dark theme colors');
    codeLines.addAll(darkColors);
    codeLines.add('}');
    return codeLines.join('\n');
  }

  Map<String, List<AppColorStyle>> _sortColors(List<AppColorStyle> colors) {
    final darkColors = List<AppColorStyle>.empty(growable: true);
    final lightColors = List<AppColorStyle>.empty(growable: true);
    final validColors = colors.where(
      (element) => element.validate(),
    );
    for (var element in validColors) {
      if (element.name.endsWith(StyleGeneratorConst.darkColorSuffix)) {
        darkColors.add(element);
      } else if (element.name.endsWith(StyleGeneratorConst.lightColorSuffix)) {
        lightColors.add(element);
      }
    }

    darkColors.sort((a, b) => a.name.compareTo(b.name));
    lightColors.sort((a, b) => a.name.compareTo(b.name));

    return {
      StyleGeneratorConst.lightColorsKey: darkColors,
      StyleGeneratorConst.darkColorsKey: lightColors,
    };
  }
}
