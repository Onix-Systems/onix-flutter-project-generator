import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';

class ScreenGeneratorParams implements BaseGenerationParams {
  final String projectPath;
  final String projectName;
  final Screen screen;
  final ProjectRouter router;
  final bool build;

  ScreenGeneratorParams({
    required this.projectPath,
    required this.projectName,
    required this.screen,
    required this.router,
    this.build = false,
  });
}
