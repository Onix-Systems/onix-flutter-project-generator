import 'package:onix_flutter_bricks/domain/entity/source/method.dart';
import 'package:onix_flutter_bricks/domain/entity/source/path.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class MethodGeneratorParams implements BaseGenerationParams {
  final Method method;
  final Path path;
  final String pathPrefix;
  final Set<String> imports;
  final String projectName;
  final String projectPath;
  final Source source;

  MethodGeneratorParams({
    required this.method,
    required this.path,
    required this.pathPrefix,
    required this.imports,
    required this.projectName,
    required this.projectPath,
    required this.source,
  });
}
