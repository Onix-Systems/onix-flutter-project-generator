import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/params/flavor_generator_params.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class GenerateFlavorsUseCase {
  final FileGeneratorService _fileGeneratorService;

  const GenerateFlavorsUseCase(
    this._fileGeneratorService,
  );

  Future<Result<int>> call({
    required FlavorGeneratorParams params,
  }) async =>
      _fileGeneratorService.generateFlavors(params);
}
