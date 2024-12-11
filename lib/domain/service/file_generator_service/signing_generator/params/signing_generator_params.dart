import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

///[projectFolder] project root folder in
///[signingPassword] password for signing certificate
///[signingVars] certificate parameters
///[separateFromBrick] = true means that generation process run not as a part of a project generation
class SingingGeneratorParams implements BaseGenerationParams {
  final String projectFolder;
  final String signingPassword;
  final List<String> signingVars;
  final bool separateFromBrick;
  final bool overwrite;

  SingingGeneratorParams({
    required this.projectFolder,
    required this.signingPassword,
    required this.signingVars,
    this.separateFromBrick = false,
    this.overwrite = false,
  });
}
