import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

///[projectFolder] project root folder in
///[flavors] set of flavors to generate
///[separateFromBrick] = true means that generation process run not as a part of a project generation
class FlavorGeneratorParams implements BaseGenerationParams {
  final String projectFolder;
  final List<String> flavors;
  final bool separateFromBrick;

  FlavorGeneratorParams({
    required this.projectFolder,
    required this.flavors,
    this.separateFromBrick = false,
  });

  @override
  String toString() {
    return 'projectFolder: $projectFolder,\nflavors: $flavors,\nseparateFromBrick: $separateFromBrick';
  }
}
