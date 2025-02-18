import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class GetSwaggerComponentsUseCase {
  final SwaggerRepository _swaggerRepository;

  const GetSwaggerComponentsUseCase(this._swaggerRepository);

  Components call() {
    return _swaggerRepository.components;
  }
}
