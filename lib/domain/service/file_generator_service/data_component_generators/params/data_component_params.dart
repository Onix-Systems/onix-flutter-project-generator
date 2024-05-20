import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class DataComponentParams implements BaseGenerationParams {
  final String projectName;
  final String projectPath;
  final DataComponent dataComponent;

  DataComponentParams({
    required this.projectName,
    required this.projectPath,
    required this.dataComponent,
  });
}
