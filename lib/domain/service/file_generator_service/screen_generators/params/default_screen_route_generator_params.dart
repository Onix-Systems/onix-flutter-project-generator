import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';

class DefaultScreenRouteGeneratorParams implements BaseGenerationParams {
  final String projectPath;
  final String projectName;
  final ProjectRouter router;

  DefaultScreenRouteGeneratorParams({
    required this.projectPath,
    required this.projectName,
    required this.router,
  });
}
