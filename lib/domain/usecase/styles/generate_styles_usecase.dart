import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/styles_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/styles_generator.dart';

class GenerateStylesUseCase {
  final StylesGenerator _stylesGenerator;

  const GenerateStylesUseCase(
    this._stylesGenerator,
  );

  Future<bool> call({required StylesGeneratorParams params}) async =>
      _stylesGenerator.generate(params);
}
