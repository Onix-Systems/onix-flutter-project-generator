import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class InnerEnumGeneratorParams implements BaseGenerationParams {
  final String sourceName;
  final String projectName;
  final String projectPath;
  final DataComponent innerEnum;

  InnerEnumGeneratorParams({
    required this.innerEnum,
    required this.projectName,
    required this.projectPath,
    required this.sourceName,
  });
}
