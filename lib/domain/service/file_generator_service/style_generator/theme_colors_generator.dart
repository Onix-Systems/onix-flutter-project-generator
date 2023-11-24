import 'dart:io';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/theme_colors_file_content_tailor.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';

import 'default_colors.dart';
import 'gen/theme_colors_file_content.dart';

class ThemeColorsGenerator {
  Future<void> call({
    required String projectName,
    required String projectPath,
    required List<AppColorStyle> colors,
    required ProjectTheming theming,
    required bool projectExists,
  }) async {
    var appColorsFile = await File(
            '$projectPath/$projectName/lib/presentation/style/theme/theme_extension/theme_colors.dart')
        .create(recursive: true);

    var themeColorsFile = File(
        '$projectPath/$projectName/lib/presentation/style/app_colors.dart');

    final allColors = colors
      ..addAll(DefaultColors.call(
              file: themeColorsFile, projectExists: projectExists)
          .where(
              (element) => !colors.map((e) => e.name).contains(element.name)));

    if (theming == ProjectTheming.themeTailor) {
      await appColorsFile.writeAsString(ThemeColorsFileContentTailor.generate(
        colors: allColors,
        projectName: projectName,
      ));
    } else {
      await appColorsFile.writeAsString(ThemeColorsFileContent.generate(
        colors: allColors,
        projectName: projectName,
      ));
    }
  }
}
