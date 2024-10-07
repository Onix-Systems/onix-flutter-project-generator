import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/theme_text_styles_file_content.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/gen/theme_text_styles_file_content_tailor.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/theme_text_style_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/theme_text_style_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/parser/text_styles_parser.dart';
import 'package:onix_flutter_bricks/util/enum/project_theming.dart';

class ThemeTextStylesGenerator
    implements BaseGenerationService<bool, ThemeTextStyleGeneratorParams> {
  final _textStylesParser = TextStylesParser();
  final _defaultTextStylesGenerator = ThemeTextStylesFileContent();
  final _tailorTextStylesGenerator = ThemeTextStylesFileContentTailor();

  @override
  Future<bool> generate(ThemeTextStyleGeneratorParams params) async {
    final libFolder = '${params.projectPath}/${params.projectName}/lib';
    final appTextStylesFile = await File(
            '$libFolder/presentation/style/theme/theme_extension/theme_text_styles.dart')
        .create(recursive: true);

    final parsedTextStyles = _textStylesParser
        .parseFromFile(
          file: appTextStylesFile,
          projectExists: params.projectExists,
          theming: params.theming,
        )
        .where(
          (element) =>
              !params.textStyles.map((e) => e.name).contains(element.name),
        );

    final allTextStyles = params.textStyles..addAll(parsedTextStyles);

    if (params.theming == ProjectTheming.themeTailor) {
      final result = await _tailorTextStylesGenerator.generate(
        ThemeTextStyleGenerationParams(
            textStyles: allTextStyles,
            colors: params.colors,
            projectName: params.projectName,
            useScreenUtil: params.useScreenUtil),
      );
      await appTextStylesFile.writeAsString(result);
    } else {
      final result = await _defaultTextStylesGenerator.generate(
        ThemeTextStyleGenerationParams(
            textStyles: allTextStyles,
            colors: params.colors,
            projectName: params.projectName,
            useScreenUtil: params.useScreenUtil),
      );
      await appTextStylesFile.writeAsString(result);
    }
    return true;
  }
}
