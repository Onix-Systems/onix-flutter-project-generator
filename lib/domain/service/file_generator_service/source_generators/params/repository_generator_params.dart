import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/generated_method.dart';

class RepositoryGeneratorParams implements BaseGenerationParams {
  final String sourceFileContent;
  final String projectName;
  final String projectPath;
  final String sourceName;
  final String mutatedPathPrefix;
  final Set<String> imports;
  final List<GeneratedMethod> implMethods;

  RepositoryGeneratorParams({
    required this.sourceFileContent,
    required this.projectName,
    required this.projectPath,
    required this.sourceName,
    required this.mutatedPathPrefix,
    required this.imports,
    required this.implMethods,
  });
}
