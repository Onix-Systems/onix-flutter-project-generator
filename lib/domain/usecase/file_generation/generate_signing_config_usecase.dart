import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/params/signing_generator_params.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class GenerateSigningConfigUseCase {
  final FileGeneratorService _fileGeneratorService;

  const GenerateSigningConfigUseCase(
    this._fileGeneratorService,
  );

  Future<Result<int>> call({
    required SingingGeneratorParams params,
  }) async =>
      _fileGeneratorService.generateSigning(params);
}
