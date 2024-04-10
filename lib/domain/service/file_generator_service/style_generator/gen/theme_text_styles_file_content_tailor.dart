import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';

class ThemeTextStylesFileContentTailor {
  static String generate(
      {required List<AppTextStyle> textStyles,
      required List<AppColorStyle> colors,
      required bool useScreenUtil,
      required String projectName}) {
/*    textStyles.sort((a, b) => a.name.compareTo(b.name));

    final styles = textStyles.where((element) => element.validate()).toList();

    return '''import 'package:$projectName/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';
${useScreenUtil ? 'import \'package:flutter_screenutil/flutter_screenutil.dart\';' : ''}
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme_text_styles.tailor.dart';

@Tailor(themeGetter: ThemeGetter.onBuildContext)
class _\$ThemeTextStyles {
  ${styles.map((e) => '''static List<TextStyle> ${e.name} = [
  ${!useScreenUtil ? 'const' : ''} TextStyle(
    ${e.fontFamily.isEmpty ? '' : 'fontFamily: \'${e.fontFamily}\','}
    fontSize: ${e.fontSize}${useScreenUtil ? '.sp' : ''},
    fontWeight: FontWeight.w${e.fontWeight},
    ${_getColor(colors, '${e.name}Light')},
    ),
    ${!useScreenUtil ? 'const' : ''} TextStyle(
    ${e.fontFamily.isEmpty ? '' : 'fontFamily: \'${e.fontFamily}\','}
    fontSize: ${e.fontSize}${useScreenUtil ? '.sp' : ''},
    fontWeight: FontWeight.w${e.fontWeight},
    ${_getColor(colors, '${e.name}Dark')},
    ),
  ];''').join('\n\n')}
}''';*/
    return generate2(
      textStyles: textStyles,
      colors: colors,
      useScreenUtil: useScreenUtil,
      projectName: projectName,
    );
  }

  static String generate2({
    required List<AppTextStyle> textStyles,
    required List<AppColorStyle> colors,
    required bool useScreenUtil,
    required String projectName,
  }) {
    textStyles.sort((a, b) => a.name.compareTo(b.name));
    final styles = textStyles.where((element) => element.validate()).toList();

    final lines = List<String>.empty(growable: true);

    ///build file footer
    lines.addAll(_imports(projectName, useScreenUtil));
    lines.addAll(_classPrefix());

    ///build fields declaration
    for (var style in styles) {
      lines.addAll(_declareField(style.name));
    }

    ///build constructor
    lines.add('ThemeTextStyles({');
    for (var style in styles) {
      lines.add('required this.${style.name},');
    }
    lines.add('});');

    ///build light theme factory constructor
    lines.add(' factory ThemeTextStyles.light() => ThemeTextStyles(');
    for (var style in styles) {
      lines.add('${style.name}: TextStyle(');
      if (style.fontFamily.isNotEmpty) {
        lines.add('fontFamily: \'${style.fontFamily}\',');
      }
      lines.add('fontSize: ${style.fontSize}${useScreenUtil ? '.sp' : ''},');
      lines.add('fontWeight: FontWeight.w${style.fontWeight},');
      lines.add(' ${_getColor(colors, '${style.name}Light')},');
      lines.add('),');
    }
    lines.add(');');

    ///build dark theme factory constructor
    lines.add(' factory ThemeTextStyles.dark() => ThemeTextStyles(');
    for (var style in styles) {
      lines.add('${style.name}: TextStyle(');
      if (style.fontFamily.isNotEmpty) {
        lines.add('fontFamily: \'${style.fontFamily}\',');
      }
      lines.add('fontSize: ${style.fontSize}${useScreenUtil ? '.sp' : ''},');
      lines.add('fontWeight: FontWeight.w${style.fontWeight},');
      lines.add(' ${_getColor(colors, '${style.name}Dark')},');
      lines.add('),');
    }
    lines.add(');');

    ///end file
    lines.add('}');
    return lines.join('\n');
  }

  static List<String> _imports(String projectName, bool useScreenUtil) => [
        'import \'package:$projectName/presentation/style/app_colors.dart\';',
        'import \'package:flutter/material.dart\';',
        'import \'package:theme_tailor_annotation/theme_tailor_annotation.dart\';',
        useScreenUtil
            ? 'import \'package:flutter_screenutil/flutter_screenutil.dart\';'
            : '',
        'part \'theme_text_styles.tailor.dart\';',
      ];

  static List<String> _classPrefix() => [
        '@TailorMixin(themeGetter: ThemeGetter.onBuildContext)',
        'class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> with _\$ThemeTextStylesTailorMixin {',
      ];

  static List<String> _declareField(String name) => [
        '@override',
        'final TextStyle $name;',
      ];

  static String _getColor(List<AppColorStyle> colors, String styleName) {
    final color =
        colors.firstWhereOrNull((element) => element.name == styleName);

    if (color == null) {
      return '//color: AppColors.$styleName';
    }

    return 'color: AppColors.${color.name}';
  }
}
