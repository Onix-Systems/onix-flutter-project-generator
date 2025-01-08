import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/theme_colors_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/style_generator_const.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:recase/recase.dart';

class ThemeColorsFileContent
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
    final colorNames = _getColorNames(colors);
    final codeLines = List<String>.empty(growable: true)
      ..add("import 'package:flutter/material.dart';")
      ..add(
        "import 'package:$projectName/presentation/style/app_colors.dart';",
      )
      ..addNewLine()
      ..add('class ThemeColors extends ThemeExtension<ThemeColors> {')

      ///Build Light constructor
      ..add('factory ThemeColors.light() => const ThemeColors(');
    final lightColorDeclarations = colorNames
        .map(
          (e) =>
              '${e}Color: AppColors.${colors.firstWhere((element) => element.name == e || element.name == '${e}Light').name},',
        )
        .toList();
    codeLines
      ..addAll(lightColorDeclarations)
      ..add(');')
      ..addNewLine()

      ///Build Dark constructor
      ..add('factory ThemeColors.dark() => const ThemeColors(');
    final darkColorDeclarations = colorNames
        .map(
          (e) =>
              '${e}Color: AppColors.${colors.firstWhere((element) => element.name == e || element.name == '${e}Dark').name},',
        )
        .toList();
    codeLines
      ..addAll(darkColorDeclarations)
      ..add(');')
      ..addNewLine();

    ///Build color variables
    final colorVariablesDeclaration = colorNames
        .map(
          (e) => 'final Color ${e}Color;',
        )
        .toList();
    codeLines
      ..addAll(colorVariablesDeclaration)

      ///Build default constructor
      ..add('const ThemeColors({');
    final constructorVariables = colorNames
        .map(
          (e) => 'required this.${e}Color,',
        )
        .toList();
    codeLines
      ..addAll(constructorVariables)
      ..add('});')
      ..addNewLine()

      ///Build copy with
      ..add('@override')
      ..add('ThemeExtension<ThemeColors> copyWith({');
    final copyWithDeclarations = colorNames
        .map(
          (e) => 'Color? ${e}Color,',
        )
        .toList();
    codeLines
      ..addAll(copyWithDeclarations)
      ..add(' }) {')
      ..add('return ThemeColors(');
    final copyWithContent = colorNames
        .map(
          (e) => '${e}Color: ${e}Color ?? this.${e}Color,',
        )
        .toList();
    codeLines
      ..addAll(copyWithContent)
      ..add(' );}')

      ///Build lerp function
      ..add('@override')
      ..add('ThemeExtension<ThemeColors> lerp(')
      ..add('ThemeExtension<ThemeColors>? other, double t,) {')
      ..add('if (other is! ThemeColors) {')
      ..add('return this;')
      ..add('}')
      ..add('return ThemeColors(');
    final lerpColors = colorNames
        .map(
          (e) =>
              '${e}Color: Color.lerp(${e}Color, other.${e}Color, t,) ?? ${e}Color,',
        )
        .toList();
    codeLines
      ..addAll(lerpColors)
      ..add(');}}')
      ..addNewLine();

    return codeLines.join('\n');
  }

  List<String> _getColorNames(List<AppColorStyle> colors) {
    final names = List<String>.empty(growable: true);
    final validColors = colors
        .where(
          (element) => element.validate(),
        )
        .map((e) => e.name);
    for (var name in validColors) {
      if (name.endsWith(StyleGeneratorConst.darkColorSuffix)) {
        name = name.replaceLast(StyleGeneratorConst.darkColorSuffix, '');
        if (!names.contains(name)) {
          names.add(name.camelCase);
        }
        continue;
      }
      if (name.endsWith(StyleGeneratorConst.lightColorSuffix)) {
        name = name.replaceLast(StyleGeneratorConst.lightColorSuffix, '');
        if (!names.contains(name)) {
          names.add(name.camelCase);
        }
      }
    }

    names.sort((a, b) => a.compareTo(b));
    return names;
  }
}
