import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class ClearSwaggerComponentsUseCase {
  final SwaggerRepository _swaggerRepository;

  const ClearSwaggerComponentsUseCase(this._swaggerRepository);

  void call({
    bool empty = false,
  }) =>
      _swaggerRepository.clearComponents(empty: empty);
}
