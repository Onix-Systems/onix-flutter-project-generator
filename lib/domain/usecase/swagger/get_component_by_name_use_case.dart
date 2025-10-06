import 'package:onix_flutter_bricks/core/arch/domain/result/result.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class GetComponentByNameUseCase {
  final SwaggerRepository _repository;

  GetComponentByNameUseCase(this._repository);

  Result<Component> call(String name) =>
      _repository.getComponentByName(componentName: name);
}
