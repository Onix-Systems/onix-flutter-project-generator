import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';

class ThemeTextStylesFileContentTailor {
  static String generate(
      {required List<AppTextStyle> textStyles,
      required bool useScreenUtil,
      required String projectName}) {
    textStyles.sort((a, b) => a.name.compareTo(b.name));
    return '''
    import 'package:$projectName/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';
${useScreenUtil ? 'import \'package:flutter_screenutil/flutter_screenutil.dart\';' : ''}
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme_text_styles.tailor.dart';

@Tailor(themeGetter: ThemeGetter.onBuildContext)
class _\$ThemeTextStyles {
  ${textStyles.map((e) => '''static List<TextStyle> ${e.name} = [
  TextStyle(
    fontSize: ${e.fontSize}${useScreenUtil ? '.sp' : ''},
    fontWeight: FontWeight.w${e.fontWeight},
    color: AppColors.${e.name}Light,
    ),
    TextStyle(
    fontSize: ${e.fontSize}${useScreenUtil ? '.sp' : ''},
    fontWeight: FontWeight.w${e.fontWeight},
    color: AppColors.${e.name}Dark,
    ),
  ];''').join('\n\n')}
}''';
  }
}
