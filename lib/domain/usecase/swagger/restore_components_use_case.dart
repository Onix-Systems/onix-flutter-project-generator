import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class RestoreComponentsUseCase {
  final SwaggerRepository _swaggerRepository;

  const RestoreComponentsUseCase(this._swaggerRepository);

  void call({
    required Components components,
  }) =>
      _swaggerRepository.restoreComponents(components);
}
