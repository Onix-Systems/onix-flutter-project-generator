import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/component_generator/params/component_generator_params.dart';

class CreateSwaggerComponentsUseCase {
  final SwaggerRepository _swaggerRepository;
  final BaseGenerationService<String, ComponentGeneratorParams>
      _componentGenerator;

  const CreateSwaggerComponentsUseCase(
    this._swaggerRepository,
    this._componentGenerator,
  );

  Future<String> call({
    required String projectName,
    required String projectPath,
  }) async {
    final components = _swaggerRepository.components;
    if (components == null) {
      return 'Invalid Data Components';
    }
    await _componentGenerator.generate(
      ComponentGeneratorParams(
        projectName: projectName,
        projectPath: projectPath,
        components: components,
      ),
    );
    return '';
  }
}
