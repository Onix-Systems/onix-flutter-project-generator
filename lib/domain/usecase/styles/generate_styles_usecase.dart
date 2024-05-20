import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/styles_generator_params.dart';

class GenerateStylesUseCase {
  final FileGeneratorService _fileGeneratorService;

  const GenerateStylesUseCase(
    this._fileGeneratorService,
  );

  Future<bool> call({required StylesGeneratorParams params}) async =>
      _fileGeneratorService.generateStyles(params);
}
