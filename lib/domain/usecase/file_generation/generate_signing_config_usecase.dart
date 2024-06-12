import 'package:onix_flutter_bricks/core/arch/domain/entity/result/result.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';

class GenerateSigningConfigUseCase {
  final FileGeneratorService _fileGeneratorService;

  const GenerateSigningConfigUseCase(
    this._fileGeneratorService,
  );

  Future<Result<dynamic>> call({
    required BaseGenerationParams params,
  }) async =>
      _fileGeneratorService.generateSigning(params);
}
