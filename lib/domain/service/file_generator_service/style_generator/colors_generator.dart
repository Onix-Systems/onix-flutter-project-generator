import 'dart:io';

import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/app_colors_file_content.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';

import 'default_colors.dart';

class ColorsGenerator {
  Future<void> call({
    required String projectName,
    required String projectPath,
    required List<AppColorStyle> colors,
    required ProjectTheming theming,
  }) async {
    final allColors = colors
      ..addAll(defaultColors.where(
          (element) => !colors.map((e) => e.name).contains(element.name)));

    logger.f(colors.map((e) => e.name).toList().join('\n'));

    var appColorsFile = await File(
            '$projectPath/$projectName/lib/presentation/style/app_colors.dart')
        .create(recursive: true);

    await appColorsFile.writeAsString(AppColorsFileContent.generate(allColors));
  }
}
