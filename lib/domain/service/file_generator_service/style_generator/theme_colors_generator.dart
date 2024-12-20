import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/theme_colors_file_content.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/theme_colors_file_content_tailor.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/theme_colors_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/theme_colors_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/parser/colors_parser.dart';
import 'package:onix_flutter_bricks/util/enum/project_theming.dart';

class ThemeColorsGenerator
    implements BaseGenerationService<bool, ThemeColorsGeneratorParams> {
  final _colorParser = ColorsParser();
  final _defaultColorsGenerator = ThemeColorsFileContent();
  final _tailorColorsGenerator = ThemeColorsFileContentTailor();

  @override
  Future<bool> generate(ThemeColorsGeneratorParams params) async {
    final libFolder = '${params.projectPath}/${params.projectName}/lib';
    final appColorsFile = await File(
      '$libFolder/presentation/style/theme/theme_extension/theme_colors.dart',
    ).create(recursive: true);

    final themeColorsFile =
        File('$libFolder/presentation/style/app_colors.dart');

    final parsedColors = _colorParser
        .parseFromFile(
          file: themeColorsFile,
          projectExists: params.projectExists,
        )
        .where(
          (element) => !params.colors.map((e) => e.name).contains(element.name),
        );

    final allColors = params.colors..addAll(parsedColors);

    if (params.theming == ProjectTheming.themeTailor) {
      final result = await _tailorColorsGenerator.generate(
        ThemeColorsGenerationParams(
          colors: allColors,
          projectName: params.projectName,
        ),
      );
      await appColorsFile.writeAsString(result);
    } else {
      final result = await _defaultColorsGenerator.generate(
        ThemeColorsGenerationParams(
          colors: allColors,
          projectName: params.projectName,
        ),
      );
      await appColorsFile.writeAsString(result);
    }
    return true;
  }
}
