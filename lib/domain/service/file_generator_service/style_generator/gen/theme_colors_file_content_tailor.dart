import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/theme_colors_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/style_generator_const.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';

class ThemeColorsFileContentTailor
    implements BaseGenerationService<String, ThemeColorsGenerationParams> {
  @override
  Future<String> generate(ThemeColorsGenerationParams params) async {
    return _generateInternal(
      colors: params.colors,
      projectName: params.projectName,
    );
  }

  String _generateInternal({
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
      lines.add('required this.${color.name}Color,');
    }
    lines.add('});');

    ///build light theme factory constructor
    lines.add(' factory ThemeColors.light() => ThemeColors(');
    for (var color in tailorColors) {
      lines.add(
          '${color.name}Color: ${(color.colorNames.isNotEmpty) ? 'AppColors.${color.colorNames[0]}' : 'Color(0xFFFFFFFF)'},');
    }
    lines.add(');');

    ///build dark theme factory constructor
    lines.add(' factory ThemeColors.dark() => ThemeColors(');
    for (var color in tailorColors) {
      lines.add(
          '${color.name}Color: ${(color.colorNames.length > 1) ? 'AppColors.${color.colorNames[1]}' : 'Color(0xFFFFFFFF)'},');
    }
    lines.add(');');

    ///end file
    lines.add('}');
    return lines.join('\n');
  }

  List<String> _imports(String projectName) => [
        'import \'package:$projectName/presentation/style/app_colors.dart\';',
        'import \'package:flutter/material.dart\';',
        'import \'package:theme_tailor_annotation/theme_tailor_annotation.dart\';',
        'part \'theme_colors.tailor.dart\';',
      ];

  List<String> _classPrefix() => [
        '@TailorMixin(themeGetter: ThemeGetter.onBuildContext)',
        'class ThemeColors extends ThemeExtension<ThemeColors> with _\$ThemeColorsTailorMixin {',
      ];

  List<String> _declareField(String name) => [
        '@override',
        'final Color ${name}Color;',
      ];

  List<_TailorColor> _getTailorColors(List<AppColorStyle> colors) {
    final names = <String>[];

    for (final name in colors.where((element) => element.validate()).map((e) =>
        e.name
            .replaceLast(StyleGeneratorConst.darkColorSuffix, '')
            .replaceLast(StyleGeneratorConst.lightColorSuffix, ''))) {
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
          element.name == '$name${StyleGeneratorConst.lightColorSuffix}' ||
          element.name == '$name${StyleGeneratorConst.darkColorSuffix}' ||
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
