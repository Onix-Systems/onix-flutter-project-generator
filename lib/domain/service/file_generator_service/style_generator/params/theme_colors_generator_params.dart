import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/styles_generator_params.dart';
import 'package:onix_flutter_bricks/util/enum/project_theming.dart';

class ThemeColorsGeneratorParams implements BaseGenerationParams {
  final String projectName;
  final String projectPath;
  final List<AppColorStyle> colors;
  final ProjectTheming theming;
  final bool projectExists;

  const ThemeColorsGeneratorParams({
    required this.projectName,
    required this.projectPath,
    required this.colors,
    required this.theming,
    required this.projectExists,
  });

  factory ThemeColorsGeneratorParams.fromStyles(
    StylesGeneratorParams params,
    List<AppColorStyle> colors,
  ) =>
      ThemeColorsGeneratorParams(
        projectName: params.projectName,
        projectPath: params.projectPath,
        colors: colors,
        theming: params.theming,
        projectExists: params.projectExists,
      );
}
