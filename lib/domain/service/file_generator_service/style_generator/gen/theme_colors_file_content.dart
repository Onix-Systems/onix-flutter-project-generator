import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:recase/recase.dart';

class ThemeColorsFileContent {
  static String generate({
    required List<AppColorStyle> colors,
    required String projectName,
  }) {
    final colorNames = _getColorNames(colors);

    return '''import 'package:flutter/material.dart';
import 'package:$projectName/presentation/style/app_colors.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  static const light = ThemeColors(
    ${colorNames.map((e) => '${e}Color: AppColors.${colors.firstWhere((element) => element.name == e || element.name == '${e}Light').name},').join('\n    ')}
  );

  static const dark = ThemeColors(
    ${colorNames.map((e) => '${e}Color: AppColors.${colors.firstWhere((element) => element.name == e || element.name == '${e}Dark').name},').join('\n    ')}
  );

  ${colorNames.map((e) => 'final Color ${e}Color;').join('\n  ')}

  const ThemeColors({
    ${colorNames.map((e) => 'required this.${e}Color,').join('\n    ')}
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    ${colorNames.map((e) => 'Color? ${e}Color,').join('\n    ')}
  }) {
    return ThemeColors(
      ${colorNames.map((e) => '${e}Color: ${e}Color ?? this.${e}Color,').join('\n      ')}
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      ${colorNames.map((e) => '${e}Color: Color.lerp(${e}Color, other.${e}Color, t) ?? ${e}Color,').join('\n      ')}
    );
  }
}
''';
  }

  static List<String> _getColorNames(List<AppColorStyle> colors) {
    final names = <String>[];

    for (final name in colors
        .where((element) => element.validate())
        .map((e) => e.name.replaceAll('Dark', '').replaceAll('Light', ''))) {
      if (names.contains(name)) {
        continue;
      }
      names.add(name.camelCase);
    }

    names.sort((a, b) => a.compareTo(b));

    return names;
  }
}
