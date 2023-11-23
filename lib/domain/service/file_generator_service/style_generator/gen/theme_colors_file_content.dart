import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';

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
    ${colorNames.map((e) => '$e: AppColors.${colors.firstWhere((element) => element.name == e || element.name == '${e}Light')},').join('\n    ')}
  );

  static const dark = ThemeColors(
    ${colorNames.map((e) => '$e: AppColors.${colors.firstWhere((element) => element.name == e || element.name == '${e}Dark')},').join('\n    ')}
  );

  ${colors.map((e) => 'final Color ${e.name};').join('\n  ')}

  const ThemeColors({
    ${colorNames.map((e) => 'required this.$e,').join('\n    ')}
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    ${colorNames.map((e) => 'Color? $e,').join('\n    ')}
  }) {
    return ThemeColors(
      ${colorNames.map((e) => '$e: $e ?? this.$e,').join('\n      ')}
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
      ${colorNames.map((e) => '$e: Color.lerp($e, other.$e, t) ?? $e,').join('\n      ')}
    );
  }
}
''';
  }

  static List<String> _getColorNames(List<AppColorStyle> colors) {
    final names = <String>[];

    for (final name in colors
        .map((e) => e.name.replaceAll('Dark', '').replaceAll('Light', ''))) {
      if (names.contains(name)) {
        continue;
      }
      names.add(name);
    }

    names.sort((a, b) => a.compareTo(b));

    return names;
  }
}
