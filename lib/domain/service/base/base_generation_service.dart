import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/gen/screen_code_content.dart';

abstract interface class BaseGenerationService<T> {
  Future<T> generate(BaseGenerationParams params);
}

abstract class ScreenGenerationService extends BaseGenerationService<bool> {
  late final ScreenCodeContent screenCodeContent;

  @override
  Future<bool> generate(BaseGenerationParams params);
}
