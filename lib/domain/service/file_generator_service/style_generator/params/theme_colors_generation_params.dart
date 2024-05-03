import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class ThemeColorsGenerationParams implements BaseGenerationParams {
  final List<AppColorStyle> colors;
  final String projectName;

  const ThemeColorsGenerationParams({
    required this.projectName,
    required this.colors,
  });

}
