import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/generated_method.dart';

class SourceGeneratorParams implements BaseGenerationParams {
  final String projectPath;
  final String projectName;
  final String sourceName;
  final Set<String> imports;
  final List<String> sourceMethods;
  final List<String> sourceStaticPaths;
  final List<String> sourceDynamicPaths;
  final List<GeneratedMethod> implMethods;
  final String mutatedPathPrefix;

  SourceGeneratorParams({
    required this.projectPath,
    required this.projectName,
    required this.sourceName,
    required this.imports,
    required this.sourceMethods,
    required this.sourceStaticPaths,
    required this.sourceDynamicPaths,
    required this.implMethods,
    required this.mutatedPathPrefix,
  });
}
