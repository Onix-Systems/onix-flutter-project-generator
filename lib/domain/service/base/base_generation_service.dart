import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

abstract interface class BaseGenerationService<T> {
  Future<T> generate(BaseGenerationParams params);
}
