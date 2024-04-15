import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class ThemeTextStyleGenerationParams implements BaseGenerationParams {
  final List<AppTextStyle> textStyles;
  final List<AppColorStyle> colors;
  final bool useScreenUtil;
  final String projectName;

  const ThemeTextStyleGenerationParams({
    required this.projectName,
    required this.textStyles,
    required this.colors,
    required this.useScreenUtil,
  });
}
