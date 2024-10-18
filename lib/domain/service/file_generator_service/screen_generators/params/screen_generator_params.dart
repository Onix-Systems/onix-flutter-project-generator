import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:recase/recase.dart';

class ScreenGeneratorParams implements BaseGenerationParams {
  final String projectPath;
  final String projectName;
  final Screen screen;
  final ProjectRouter router;
  final bool build;
  final bool lastScreenItem;

  ScreenGeneratorParams({
    required this.projectPath,
    required this.projectName,
    required this.screen,
    required this.router,
    required this.lastScreenItem,
    this.build = false,
  });
}

extension ScreenNameNormalizer on ScreenGeneratorParams {
  String get normalizedScreenName => screen.name.snakeCase.endsWith('_screen')
      ? screen.name.snakeCase.substring(0, screen.name.length - 7)
      : screen.name.snakeCase;
}
