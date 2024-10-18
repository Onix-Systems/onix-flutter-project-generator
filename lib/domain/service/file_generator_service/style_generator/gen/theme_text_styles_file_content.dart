import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/theme_text_style_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/style_generator_const.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';

class ThemeTextStylesFileContent
    implements BaseGenerationService<String, ThemeTextStyleGenerationParams> {
  @override
  Future<String> generate(ThemeTextStyleGenerationParams params) async {
    return _generateInternal(
      textStyles: params.textStyles,
      colors: params.colors,
      useScreenUtil: params.useScreenUtil,
      projectName: params.projectName,
    );
  }

  String _generateInternal({
    required List<AppTextStyle> textStyles,
    required List<AppColorStyle> colors,
    required bool useScreenUtil,
    required String projectName,
  }) {
    textStyles.sort((a, b) => a.name.compareTo(b.name));
    final styles = textStyles.where((element) => element.validate()).toList();
    final codeLines = List<String>.empty(growable: true);
    codeLines.add(
        'import \'package:$projectName/presentation/style/app_colors.dart\';');
    codeLines.add('import \'package:flutter/material.dart\';');
    if (useScreenUtil) {
      codeLines.add(
          'import \'package:flutter_screenutil/flutter_screenutil.dart\';');
    }
    codeLines.addNewLine();
    codeLines
        .add('class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {');

    ///Light constructor
    codeLines.add(
        'factory ThemeTextStyles.light() => ${useScreenUtil ? '' : 'const'} ThemeTextStyles(');
    final lightColorsDeclarations = styles.map(
      (e) {
        return _getTextStyleDeclarations(
            StyleGeneratorConst.lightColorSuffix, e, useScreenUtil, colors);
      },
    ).toList();
    codeLines.addAll(lightColorsDeclarations);
    codeLines.add(');');
    codeLines.addNewLine();

    ///Dark constructor
    codeLines.add(
        ' factory ThemeTextStyles.dark() => ${useScreenUtil ? '' : 'const'} ThemeTextStyles(');
    final darkColorsDeclarations = styles.map(
      (e) {
        return _getTextStyleDeclarations(
            StyleGeneratorConst.darkColorSuffix, e, useScreenUtil, colors);
      },
    ).toList();
    codeLines.addAll(darkColorsDeclarations);
    codeLines.add(');');
    codeLines.addNewLine();

    ///Variables declaration
    final variables = styles
        .map(
          (e) => 'final TextStyle? ${e.name};',
        )
        .toList();
    codeLines.addAll(variables);
    codeLines.addNewLine();

    ///Default constructor
    codeLines.add(' const ThemeTextStyles({');
    final constructorVaribles = styles
        .map(
          (e) => 'this.${e.name},',
        )
        .toList();
    codeLines.addAll(constructorVaribles);
    codeLines.add('});');
    codeLines.addNewLine();

    ///Copy with function
    codeLines.add('@override');
    codeLines.add('ThemeExtension<ThemeTextStyles> copyWith({');
    final copyWithConstructor = styles
        .map(
          (e) => 'TextStyle? ${e.name},',
        )
        .toList();
    codeLines.addAll(copyWithConstructor);
    codeLines.add('}) {');
    codeLines.add('return ThemeTextStyles(');
    final copyWithVariables = styles
        .map(
          (e) => '${e.name}: ${e.name} ?? this.${e.name},',
        )
        .toList();
    codeLines.addAll(copyWithVariables);
    codeLines.add(');}');
    codeLines.addNewLine();

    ///Lerp function
    codeLines.add('@override');
    codeLines.add(
        'ThemeExtension<ThemeTextStyles> lerp(ThemeExtension<ThemeTextStyles>? other,double t,) {');
    codeLines.add('if (other is! ThemeTextStyles) {');
    codeLines.add('return this;');
    codeLines.add('}');
    codeLines.add('return ThemeTextStyles(');
    final lerpVariables = styles
        .map(
          (e) => '${e.name}: TextStyle.lerp(${e.name}, other.${e.name}, t),',
        )
        .toList();
    codeLines.addAll(lerpVariables);
    codeLines.add(');}}');
    codeLines.addNewLine();

    return codeLines.join('\n');
  }

  String _getTextStyleDeclarations(
    String colorType,
    AppTextStyle style,
    bool useScreenUtil,
    List<AppColorStyle> colors,
  ) {
    final codeLines = List<String>.empty(growable: true);
    codeLines.add('${style.name}: TextStyle(');
    codeLines.add(style.fontFamily.isNotEmpty
        ? 'fontFamily: \'${style.fontFamily}\','
        : '');
    codeLines.add('fontSize: ${style.fontSize}${useScreenUtil ? '.sp' : ''},');
    codeLines.add('fontWeight: FontWeight.w${style.fontWeight},');
    codeLines.add('${_getColor(colors, '${style.name}$colorType')},');
    codeLines.add('),');
    return codeLines.join('\n');
  }

  String _getColor(List<AppColorStyle> colors, String styleName) {
    final color =
        colors.firstWhereOrNull((element) => element.name == styleName);

    if (color == null) {
      return '//color: AppColors.$styleName';
    }

    return 'color: AppColors.${color.name}';
  }
}
