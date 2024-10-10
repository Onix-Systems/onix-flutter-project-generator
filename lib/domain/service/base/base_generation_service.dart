import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';

// ignore: one_member_abstracts
abstract class BaseGenerationService<R, T extends BaseGenerationParams> {
  Future<R> generate(T params);
}

abstract class ScreenGenerationService
    extends BaseGenerationService<bool, BaseGenerationParams> {
  @override
  Future<bool> generate(BaseGenerationParams params);
}
