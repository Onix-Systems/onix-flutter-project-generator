import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class DocsGenerationParams extends BaseGenerationParams {
  final String projectName;
  final String projectPath;
  final Set<String> flavors;
  final List<String> platforms;
  final List<String> commands;

  DocsGenerationParams({
    required this.projectName,
    required this.projectPath,
    required this.flavors,
    required this.platforms,
    required this.commands,
  });
}
