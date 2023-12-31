import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';

class AppColorsFileContent {
  static String generate(List<AppColorStyle> colors) {
    final sortedColors = _sortColors(colors);
    return '''
    import 'package:flutter/material.dart';

abstract class AppColors {
  //Light theme colors
  ${sortedColors['light']?.map((e) => 'static const Color ${e.name} = Color(0x${e.color.value.toRadixString(16)});').join('\n  ')}
  //Dark theme colors
  ${sortedColors['dark']?.map((e) => 'static const Color ${e.name} = Color(0x${e.color.value.toRadixString(16)});').join('\n  ')}
}''';
  }

  static Map<String, List<AppColorStyle>> _sortColors(
      List<AppColorStyle> colors) {
    List<AppColorStyle> darkColors = [];
    List<AppColorStyle> lightColors = [];

    for (var element in colors.where((element) => element.validate())) {
      if (element.name.endsWith('Dark')) {
        darkColors.add(element);
      } else if (element.name.endsWith('Light')) {
        lightColors.add(element);
      }
    }

    darkColors.sort((a, b) => a.name.compareTo(b.name));
    lightColors.sort((a, b) => a.name.compareTo(b.name));

    return {
      'dark': darkColors,
      'light': lightColors,
    };
  }
}
