import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class ClearSwaggerComponentsUseCase {
  final SwaggerRepository _swaggerRepository;

  const ClearSwaggerComponentsUseCase(this._swaggerRepository);

  void call() => _swaggerRepository.clearComponents();
}
