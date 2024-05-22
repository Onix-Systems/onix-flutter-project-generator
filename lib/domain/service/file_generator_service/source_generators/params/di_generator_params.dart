import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class DiGeneratorParams implements BaseGenerationParams {
  final String sourceName;
  final String projectName;
  final String projectPath;

  DiGeneratorParams({
    required this.sourceName,
    required this.projectName,
    required this.projectPath,
  });
}
