import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class ColorsGenerationParams implements BaseGenerationParams {
  final List<AppColorStyle> colors;

  const ColorsGenerationParams({
    required this.colors,
  });
}
