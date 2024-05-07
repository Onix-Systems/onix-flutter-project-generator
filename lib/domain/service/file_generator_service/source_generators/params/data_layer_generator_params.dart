import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

class DataLayerGeneratorParams implements BaseGenerationParams {
  final String projectName;
  final String projectPath;
  final Source source;

  DataLayerGeneratorParams({
    required this. projectName,
    required this. projectPath,
    required this. source,
  });
}
