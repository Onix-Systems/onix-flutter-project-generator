import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class AppColorsGenerationParams implements BaseGenerationParams {
  final List<AppColorStyle> colors;

  const AppColorsGenerationParams({
    required this.colors,
  });
}
