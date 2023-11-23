import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/colors_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/theme_colors_generator.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';

class GenerateStyles {
  Future<void> call({
    required String projectName,
    required String projectPath,
    required List<AppStyle> styles,
    required ProjectTheming theming,
  }) async {
    await ColorsGenerator().call(
      projectName: projectName,
      projectPath: projectPath,
      colors: styles.whereType<AppColorStyle>().toList(),
    );
    await ThemeColorsGenerator().call(
      projectName: projectName,
      projectPath: projectPath,
      colors: styles.whereType<AppColorStyle>().toList(),
      theming: theming,
    );
  }
}
