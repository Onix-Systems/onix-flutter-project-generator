import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/colors_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/theme_colors_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/theme_text_styles_generator.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';

class GenerateStyles {
  Future<void> call({
    required String projectName,
    required String projectPath,
    required List<AppStyle> styles,
    required ProjectTheming theming,
    required bool projectExists,
    required bool useScreenUtil,
  }) async {
    final colors = styles.whereType<AppColorStyle>().toList();
    final textStyles = styles.whereType<AppTextStyle>().toList();

    await ColorsGenerator().call(
      projectName: projectName,
      projectPath: projectPath,
      colors: colors,
      projectExists: projectExists,
    );
    await ThemeColorsGenerator().call(
      projectName: projectName,
      projectPath: projectPath,
      colors: colors,
      theming: theming,
      projectExists: projectExists,
    );
    await ThemeTextStylesGenerator().call(
      projectName: projectName,
      projectPath: projectPath,
      textStyles: textStyles,
      colors: colors,
      useScreenUtil: useScreenUtil,
      projectExists: projectExists,
      theming: theming,
    );
  }
}
