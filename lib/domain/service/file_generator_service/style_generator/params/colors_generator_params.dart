import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/styles_generator_params.dart';

class ColorsGeneratorParams implements BaseGenerationParams {
  final String projectName;
  final String projectPath;
  final bool projectExists;
  final List<AppColorStyle> colors;

  const ColorsGeneratorParams({
    required this.projectName,
    required this.projectPath,
    required this.colors,
    required this.projectExists,
  });

  factory ColorsGeneratorParams.fromStyles(StylesGeneratorParams params,
      List<AppColorStyle> colors,) =>
      ColorsGeneratorParams(
        projectName: params.projectName,
        projectPath: params.projectPath,
        colors: colors,
        projectExists: params.projectExists,
      );
}
