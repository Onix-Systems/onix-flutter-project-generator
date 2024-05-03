import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/enum/project_theming.dart';

class StylesGeneratorParams implements BaseGenerationParams {
  final String projectName;
  final String projectPath;
  final List<AppStyle> styles;
  final ProjectTheming theming;
  final bool projectExists;
  final bool useScreenUtil;

  const StylesGeneratorParams({
    required this.projectName,
    required this.projectPath,
    required this.styles,
    required this.theming,
    required this.projectExists,
    required this.useScreenUtil,
  });
}
