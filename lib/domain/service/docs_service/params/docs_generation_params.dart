import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class DocsGenerationParams implements BaseGenerationParams {
  final String projectName;
  final String projectPath;
  final String organization;
  final Set<String> flavors;
  final List<String> platforms;
  final List<String> commands;
  final bool flavorize;

  const DocsGenerationParams({
    required this.projectName,
    required this.projectPath,
    required this.organization,
    required this.flavors,
    required this.platforms,
    required this.commands,
    required this.flavorize,
  });
}
