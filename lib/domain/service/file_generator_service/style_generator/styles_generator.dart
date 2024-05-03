import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/colors_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/colors_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/styles_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/theme_colors_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/theme_text_style_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/theme_colors_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/theme_text_styles_generator.dart';

class StylesGenerator implements BaseGenerationService<bool> {
  final BaseGenerationService _colorsGenerator = ColorsGenerator();
  final BaseGenerationService _themeColorsGenerator = ThemeColorsGenerator();
  final BaseGenerationService _themeTextStylesGenerator =
      ThemeTextStylesGenerator();

  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! StylesGeneratorParams) {
      return false;
    }
    final colors = params.styles.whereType<AppColorStyle>().toList();
    final textStyles = params.styles.whereType<AppTextStyle>().toList();


    ///Generate colors
    await _colorsGenerator.generate(
      ColorsGeneratorParams.fromStyles(
        params,
        colors,
      ),
    );

    ///Generate theme colors
    await _themeColorsGenerator.generate(
      ThemeColorsGeneratorParams.fromStyles(
        params,
        colors,
      ),
    );
    await _themeTextStylesGenerator.generate(
      ThemeTextStyleGeneratorParams.fromStyles(
        params,
        colors,
        textStyles,
      ),
    );
    return true;
  }
}
