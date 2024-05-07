import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class ParamsGeneratorParams implements BaseGenerationParams {
  final String methodName;
  final Set<Property> methodParamsNotRequired;
  final String projectName;
  final String projectPath;
  final String sourceName;
  final List<DataComponent> innerEnums;

  ParamsGeneratorParams({
    required this.methodName,
    required this.methodParamsNotRequired,
    required this.projectName,
    required this.projectPath,
    required this.sourceName,
    required this.innerEnums,
  });
}
