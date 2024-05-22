import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class FastlaneGenerationParams implements BaseGenerationParams {
  final String projectName;
  final String projectPath;
  final String organization;
  final Set<String> flavors;
  final List<String> platforms;

  const FastlaneGenerationParams({
    required this.projectName,
    required this.projectPath,
    required this.organization,
    required this.flavors,
    required this.platforms,
  });
}
