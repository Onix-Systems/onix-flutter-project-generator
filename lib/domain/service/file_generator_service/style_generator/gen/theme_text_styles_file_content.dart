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
    final codeLines = List<String>.empty(growable: true)
      ..add(
        "import 'package:$projectName/presentation/style/app_colors.dart';",
      )
      ..add("import 'package:flutter/material.dart';");
    if (useScreenUtil) {
      codeLines.add(
        "import 'package:flutter_screenutil/flutter_screenutil.dart';",
      );
    }
    codeLines
      ..addNewLine()
      ..add('class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {')

      ///Light constructor
      ..add(
        //ignore: lines_longer_than_80_chars
        'factory ThemeTextStyles.light() => ${useScreenUtil ? '' : 'const'} ThemeTextStyles(',
      );
    final lightColorsDeclarations = styles.map(
      (e) {
        return _getTextStyleDeclarations(
          StyleGeneratorConst.lightColorSuffix,
          e,
          useScreenUtil,
          colors,
        );
      },
    ).toList();
    codeLines
      ..addAll(lightColorsDeclarations)
      ..add(');')
      ..addNewLine()

      ///Dark constructor
      ..add(
        //ignore: lines_longer_than_80_chars
        ' factory ThemeTextStyles.dark() => ${useScreenUtil ? '' : 'const'} ThemeTextStyles(',
      );
    final darkColorsDeclarations = styles.map(
      (e) {
        return _getTextStyleDeclarations(
          StyleGeneratorConst.darkColorSuffix,
          e,
          useScreenUtil,
          colors,
        );
      },
    ).toList();
    codeLines
      ..addAll(darkColorsDeclarations)
      ..add(');')
      ..addNewLine();

    ///Variables declaration
    final variables = styles
        .map(
          (e) => 'final TextStyle? ${e.name};',
        )
        .toList();
    codeLines
      ..addAll(variables)
      ..addNewLine()

      ///Default constructor
      ..add(' const ThemeTextStyles({');
    final constructorVariables = styles
        .map(
          (e) => 'this.${e.name},',
        )
        .toList();
    codeLines
      ..addAll(constructorVariables)
      ..add('});')
      ..addNewLine()

      ///Copy with function
      ..add('@override')
      ..add('ThemeExtension<ThemeTextStyles> copyWith({');
    final copyWithConstructor = styles
        .map(
          (e) => 'TextStyle? ${e.name},',
        )
        .toList();
    codeLines
      ..addAll(copyWithConstructor)
      ..add('}) {')
      ..add('return ThemeTextStyles(');
    final copyWithVariables = styles
        .map(
          (e) => '${e.name}: ${e.name} ?? this.${e.name},',
        )
        .toList();
    codeLines
      ..addAll(copyWithVariables)
      ..add(');}')
      ..addNewLine()

      ///Lerp function
      ..add('@override')
      ..add(
        //ignore: lines_longer_than_80_chars
        'ThemeExtension<ThemeTextStyles> lerp(ThemeExtension<ThemeTextStyles>? other,double t,) {',
      )
      ..add('if (other is! ThemeTextStyles) {')
      ..add('return this;')
      ..add('}')
      ..add('return ThemeTextStyles(');
    final lerpVariables = styles
        .map(
          (e) => '${e.name}: TextStyle.lerp(${e.name}, other.${e.name}, t),',
        )
        .toList();
    codeLines
      ..addAll(lerpVariables)
      ..add(');}}')
      ..addNewLine();

    return codeLines.join('\n');
  }

  String _getTextStyleDeclarations(
    String colorType,
    AppTextStyle style,
    bool useScreenUtil,
    List<AppColorStyle> colors,
  ) {
    final codeLines = List<String>.empty(growable: true)
      ..add('${style.name}: TextStyle(')
      ..add(
        style.fontFamily.isNotEmpty ? "fontFamily: '${style.fontFamily}'," : '',
      )
      ..add('fontSize: ${style.fontSize}${useScreenUtil ? '.sp' : ''},')
      ..add('fontWeight: FontWeight.w${style.fontWeight},')
      ..add('${_getColor(colors, '${style.name}$colorType')},')
      ..add('),');
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
