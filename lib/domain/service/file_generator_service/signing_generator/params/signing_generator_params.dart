import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class SingingGeneratorParams implements BaseGenerationParams {
  final String projectFolder;
  final String signingPassword;
  final List<String> signingVars;
  final bool separateFromBrick;

  SingingGeneratorParams({
    required this.projectFolder,
    required this.signingPassword,
    required this.signingVars,
    this.separateFromBrick = false,
  });
}
