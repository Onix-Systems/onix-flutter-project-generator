import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/styles_generator_params.dart';
import 'package:onix_flutter_bricks/util/enum/project_theming.dart';

class ThemeTextStyleGeneratorParams implements BaseGenerationParams {
  final String projectName;
  final String projectPath;
  final List<AppTextStyle> textStyles;
  final List<AppColorStyle> colors;
  final ProjectTheming theming;
  final bool projectExists;
  final bool useScreenUtil;

  const ThemeTextStyleGeneratorParams({
    required this.projectName,
    required this.projectPath,
    required this.textStyles,
    required this.colors,
    required this.theming,
    required this.projectExists,
    required this.useScreenUtil,
  });

  factory ThemeTextStyleGeneratorParams.fromStyles(
    StylesGeneratorParams params,
    List<AppColorStyle> colors,
    List<AppTextStyle> textStyles,
  ) =>
      ThemeTextStyleGeneratorParams(
        projectName: params.projectName,
        projectPath: params.projectPath,
        textStyles: textStyles,
        colors: colors,
        useScreenUtil: params.useScreenUtil,
        projectExists: params.projectExists,
        theming: params.theming,
      );
}
