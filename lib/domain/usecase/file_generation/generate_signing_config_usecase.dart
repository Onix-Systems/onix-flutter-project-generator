import 'package:onix_flutter_bricks/core/arch/domain/entity/result/result.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/params/signing_generator_params.dart';

class GenerateSigningConfigUseCase {
  final FileGeneratorService _fileGeneratorService;

  const GenerateSigningConfigUseCase(
    this._fileGeneratorService,
  );

  Future<Result<dynamic>> call({
    required SingingGeneratorParams params,
  }) async =>
      _fileGeneratorService.generateSigning(params);
}
