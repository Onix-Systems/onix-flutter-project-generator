import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

abstract interface class BaseGenerationService<R,
    T extends BaseGenerationParams> {
  Future<R> generate(T params);
}
