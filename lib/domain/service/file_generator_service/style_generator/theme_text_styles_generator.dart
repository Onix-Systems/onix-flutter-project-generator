import 'dart:io';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/default_text_styles.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/theme_colors_file_content_tailor.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/theme_text_styles_file_content_tailor.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';

import 'default_colors.dart';
import 'gen/theme_colors_file_content.dart';

class ThemeTextStylesGenerator {
  Future<void> call({
    required String projectName,
    required String projectPath,
    required List<AppTextStyle> textStyles,
    required ProjectTheming theming,
    required bool projectExists,
    required bool useScreenUtil,
  }) async {
    var appTextStylesFile = await File(
            '$projectPath/$projectName/lib/presentation/style/theme/theme_extension/theme_text_styles.dart')
        .create(recursive: true);

    final allTextStyles = textStyles
      ..addAll(DefaultTextStyles.call(
              file: appTextStylesFile, projectExists: projectExists)
          .where((element) => !textStyles.contains(element)));

    logger.f(allTextStyles);

    if (theming == ProjectTheming.themeTailor) {
      await appTextStylesFile.writeAsString(
          ThemeTextStylesFileContentTailor.generate(
              textStyles: allTextStyles,
              projectName: projectName,
              useScreenUtil: useScreenUtil));
    } else {
      // await appTextStylesFile.writeAsString(ThemeColorsFileContent.generate(
      //   colors: allTextStyles,
      //   projectName: projectName,
      //   useScreenUtil: useScreenUtil
      // ));
    }
  }
}
