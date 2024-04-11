import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/colors_parser.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/theme_colors_file_content.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/theme_colors_file_content_tailor.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/theme_colors_generation_params.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';

class ThemeColorsGenerator {
  final _defaultColorsGenerator = ThemeColorsFileContent();
  final _tailorColorsGenerator = ThemeColorsFileContentTailor();

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
      ..addAll(ColorsParser.call(
              file: themeColorsFile, projectExists: projectExists)
          .where(
              (element) => !colors.map((e) => e.name).contains(element.name)));

    if (theming == ProjectTheming.themeTailor) {
      final result = await _tailorColorsGenerator.generate(
        ThemeColorsGenerationParams(
          colors: allColors,
          projectName: projectName,
        ),
      );
      await appColorsFile.writeAsString(result);
    } else {
      final result = await _defaultColorsGenerator.generate(
        ThemeColorsGenerationParams(
          colors: allColors,
          projectName: projectName,
        ),
      );
      await appColorsFile.writeAsString(result);
    }
  }
}
