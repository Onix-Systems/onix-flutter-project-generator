import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:recase/recase.dart';

class ScreenGeneratorParams implements BaseGenerationParams {
  final String projectRootPath;
  final String projectName;
  final ArchType archType;
  final Screen screen;
  final ProjectRouter router;
  final bool build;
  final bool lastScreenItem;

  ScreenGeneratorParams({
    required this.projectRootPath,
    required this.projectName,
    required this.archType,
    required this.screen,
    required this.router,
    required this.lastScreenItem,
    this.build = false,
  });

  String get normalizedScreenName => screen.name.snakeCase.endsWith('_screen')
      ? screen.name.snakeCase.substring(0, screen.name.length - 7)
      : screen.name.snakeCase;

  bool get isGoRouter => router == ProjectRouter.goRouter;
}
