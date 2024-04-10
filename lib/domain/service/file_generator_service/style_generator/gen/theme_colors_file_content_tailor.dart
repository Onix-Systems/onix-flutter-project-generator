import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';

class ThemeColorsFileContentTailor {
  static String generate({
    required List<AppColorStyle> colors,
    required String projectName,
  }) {
    /* final tailorColors = _getTailorColors(colors);
    return '''import 'package:$projectName/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme_colors.tailor.dart';

@Tailor(themeGetter: ThemeGetter.onBuildContext)
class _\$ThemeColors {
  ${tailorColors.map((e) => 'static List<Color> ${e.name}Color = [${e.colorNames.map((e) => 'AppColors.$e').join(',')},];').join('\n  ')}
}
    ''';*/
    return generate2(colors: colors, projectName: projectName);
  }

  static String generate2({
    required List<AppColorStyle> colors,
    required String projectName,
  }) {
    final tailorColors = _getTailorColors(colors);
    final lines = List<String>.empty(growable: true);

    ///build file footer
    lines.addAll(_imports(projectName));
    lines.addAll(_classPrefix());

    ///build fields declaration
    for (var color in tailorColors) {
      lines.addAll(_declareField(color.name));
    }

    ///build constructor
    lines.add('ThemeColors({');
    for (var color in tailorColors) {
      lines.add('required this.${color.name},');
    }
    lines.add('});');

    ///build light theme factory constructor
    lines.add(' factory ThemeColors.light() => ThemeColors(');
    for (var color in tailorColors) {
      final lightColor =
          color.colorNames.isEmpty ? 'Color(0xFFFFFFFF)' : color.colorNames[0];
      lines.add('${color.name}: AppColors.$lightColor,');
    }
    lines.add(');');

    ///build dark theme factory constructor
    lines.add(' factory ThemeColors.dark() => ThemeColors(');
    for (var color in tailorColors) {
      final darkColor = (color.colorNames.length > 1)
          ? 'Color(0xFFFFFFFF)'
          : color.colorNames[1];
      lines.add('${color.name}: AppColors.$darkColor,');
    }
    lines.add(');');

    ///end file
    lines.add('}');
    return lines.join('\n');
  }

  static List<String> _imports(String projectName) => [
        'import \'package:$projectName/presentation/style/app_colors.dart\';',
        'import \'package:flutter/material.dart\';',
        'import \'package:theme_tailor_annotation/theme_tailor_annotation.dart\';',
        'part \'theme_colors.tailor.dart\';',
      ];

  static List<String> _classPrefix() => [
        '@TailorMixin(themeGetter: ThemeGetter.onBuildContext)',
        'class ThemeColors extends ThemeExtension<ThemeColors> with _\$ThemeColorsTailorMixin {',
      ];

  static List<String> _declareField(String name) => [
        '@override',
        'final Color $name;',
      ];

  static List<_TailorColor> _getTailorColors(List<AppColorStyle> colors) {
    final names = <String>[];

    for (final name in colors
        .where((element) => element.validate())
        .map((e) => e.name.replaceLast('Dark', '').replaceLast('Light', ''))) {
      if (names.contains(name)) {
        continue;
      }
      names.add(name);
    }

    names.sort((a, b) => a.compareTo(b));

    final tailorColors = <_TailorColor>[];

    for (final name in names) {
      final colorNames = <String>[];

      for (final color in colors.where((element) =>
          element.name == '${name}Light' ||
          element.name == '${name}Dark' ||
          element.name == name)) {
        colorNames.add(color.name);
      }

      tailorColors.add(_TailorColor(
        name: name,
        colorNames: colorNames,
      ));
    }

    return tailorColors;
  }
}

class _TailorColor {
  final String name;
  final List<String> colorNames;

  _TailorColor({
    required this.name,
    required this.colorNames,
  });
}
