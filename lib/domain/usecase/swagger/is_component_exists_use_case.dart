import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class IsComponentExistsUseCase {
  final SwaggerRepository _repository;

  IsComponentExistsUseCase(this._repository);

  bool call(String componentName) =>
      _repository.isComponentExists(componentName);
}
