import 'dart:io';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/colors_parser.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/app_colors_file_content.dart';

class ColorsGenerator {
  Future<void> call({
    required String projectName,
    required String projectPath,
    required List<AppColorStyle> colors,
    required bool projectExists,
  }) async {
    var themeColorsFile = await File(
            '$projectPath/$projectName/lib/presentation/style/app_colors.dart')
        .create(recursive: true);

    final allColors = colors
      ..addAll(ColorsParser.call(
              file: themeColorsFile, projectExists: projectExists)
          .where(
              (element) => !colors.map((e) => e.name).contains(element.name)));

    await themeColorsFile
        .writeAsString(AppColorsFileContent.generate(allColors));
  }
}
