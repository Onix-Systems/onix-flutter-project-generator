import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class SingingGeneratorParams implements BaseGenerationParams {
  final String projectPath;
  final String projectName;
  final String genPass;
  final List<String> signingVars;

  SingingGeneratorParams({
    required this.projectPath,
    required this.projectName,
    required this.genPass,
    required this.signingVars,
  });
}
