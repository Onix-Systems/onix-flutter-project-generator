import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class GitCliffParams implements BaseGenerationParams {
  final String projectName;
  final String projectPath;

  const GitCliffParams({
    required this.projectName,
    required this.projectPath,
  });

  String get projectFullPath => '$projectPath/$projectName';
}
