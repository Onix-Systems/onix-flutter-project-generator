import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class GetComponentsUseCase {
  final SwaggerRepository _swaggerRepository;

  const GetComponentsUseCase(this._swaggerRepository);

  Components call() {
    return _swaggerRepository.components;
  }
}
