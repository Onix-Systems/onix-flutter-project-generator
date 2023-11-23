import 'dart:io';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/app_colors_file_content.dart';

import 'default_colors.dart';

class ColorsGenerator {
  Future<void> call({
    required String projectName,
    required String projectPath,
    required List<AppColorStyle> colors,
  }) async {
    final allColors = colors
      ..addAll(defaultColors.where(
          (element) => !colors.map((e) => e.name).contains(element.name)));

    var themeColorsFile = await File(
            '$projectPath/$projectName/lib/presentation/style/app_colors.dart')
        .create(recursive: true);

    await themeColorsFile
        .writeAsString(AppColorsFileContent.generate(allColors));
  }
}
