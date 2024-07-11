import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class ComponentGeneratorParams implements BaseGenerationParams {
  final String projectName;
  final String projectPath;
  final Components components;


  const ComponentGeneratorParams({
    required this.projectName,
    required this.projectPath,
    required this.components,
  });
}
