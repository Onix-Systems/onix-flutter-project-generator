import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/app_colors_file_content.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/colors_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/colors_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/parser/colors_parser.dart';

class ColorsGenerator implements BaseGenerationService<bool> {
  final _colorParser = ColorsParser();
  final _appColorsGenerator = AppColorsFileContent();

  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! ColorsGeneratorParams) {
      return false;
    }
    var themeColorsFile = await File(
            '${params.projectPath}/${params.projectName}/lib/presentation/style/app_colors.dart')
        .create(recursive: true);

    final parsedColors = _colorParser
        .parseFromFile(
          file: themeColorsFile,
          projectExists: params.projectExists,
        )
        .where(
          (element) => !params.colors.map((e) => e.name).contains(element.name),
        );

    final allColors = params.colors..addAll(parsedColors);

    final result = await _appColorsGenerator.generate(
      ColorsGenerationParams(colors: allColors),
    );
    await themeColorsFile.writeAsString(result);
    return true;
  }
}
