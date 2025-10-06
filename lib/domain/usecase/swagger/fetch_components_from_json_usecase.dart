import 'package:onix_flutter_bricks/core/arch/domain/result/result.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class FetchComponentsFromJsonUseCase {
  final SwaggerRepository _swaggerRepository;

  const FetchComponentsFromJsonUseCase(this._swaggerRepository);

  Future<Result<Components>> call(String projectPath) {
    return _swaggerRepository.getComponentsFromConfig(projectPath: projectPath);
  }
}
