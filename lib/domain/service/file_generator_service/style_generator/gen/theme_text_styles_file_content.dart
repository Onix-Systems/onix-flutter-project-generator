import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';

class ThemeTextStylesFileContent {
  static String generate({
    required List<AppTextStyle> textStyles,
    required List<AppColorStyle> colors,
    required bool useScreenUtil,
    required String projectName,
  }) {
    textStyles.sort((a, b) => a.name.compareTo(b.name));
    final styles = textStyles.where((element) => element.validate()).toList();

    return '''import 'package:$projectName/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';
${useScreenUtil ? 'import \'package:flutter_screenutil/flutter_screenutil.dart\';' : ''}

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  static ${useScreenUtil ? 'final' : 'const'} light = ThemeTextStyles(
  ${styles.map((e) => '''${e.name}: TextStyle(
  ${e.fontFamily.isNotEmpty ? 'fontFamily: \'${e.fontFamily}\',' : ''}
  fontSize: ${e.fontSize}${useScreenUtil ? '.sp' : ''},
    fontWeight: FontWeight.w${e.fontWeight},
    ${_getColor(colors, '${e.name}Light')},
  ),''').join('\n')}
  );
  
  static ${useScreenUtil ? 'final' : 'const'} dark = ThemeTextStyles(
  ${styles.map((e) => '''${e.name}: TextStyle(
  ${e.fontFamily.isNotEmpty ? 'fontFamily: \'${e.fontFamily}\',' : ''}
  fontSize: ${e.fontSize}${useScreenUtil ? '.sp' : ''},
    fontWeight: FontWeight.w${e.fontWeight},
    ${_getColor(colors, '${e.name}Dark')},
  ),''').join('\n')}
  );

  ${styles.map((e) => 'final TextStyle? ${e.name};').join('\n')}

  const ThemeTextStyles({
    ${styles.map((e) => 'this.${e.name},').join('\n')}
  });

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    ${styles.map((e) => 'TextStyle? ${e.name},').join('\n')}
  }) {
    return ThemeTextStyles(
      ${styles.map((e) => '${e.name}: ${e.name} ?? this.${e.name},').join('\n')}
    );
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(ThemeExtension<ThemeTextStyles>? other,
      double t,) {
    if (other is! ThemeTextStyles) {
      return this;
    }
    return ThemeTextStyles(
      ${styles.map((e) => '${e.name}: TextStyle.lerp(${e.name}, other.${e.name}, t),').join('\n')}
    );
  }
}''';
  }

  static String _getColor(List<AppColorStyle> colors, String styleName) {
    final color =
        colors.firstWhereOrNull((element) => element.name == styleName);

    if (color == null) {
      return '//color: AppColors.$styleName';
    }

    return 'color: AppColors.${color.name}';
  }
}
