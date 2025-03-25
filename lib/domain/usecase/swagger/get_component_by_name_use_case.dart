import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class GetComponentByNameUseCase {
  final SwaggerRepository _repository;

  GetComponentByNameUseCase(this._repository);

  Result<Component> call(String name) =>
      _repository.getComponentByName(componentName: name);
}
