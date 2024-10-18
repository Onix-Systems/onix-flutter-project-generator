import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';

// ignore: one_member_abstracts
abstract class BaseGenerationService<R, T extends BaseGenerationParams> {
  Future<R> generate(T params);
}

abstract class ScreenGenerationService
    extends BaseGenerationService<bool, ScreenGeneratorParams> {
  @override
  Future<bool> generate(ScreenGeneratorParams params);
}
