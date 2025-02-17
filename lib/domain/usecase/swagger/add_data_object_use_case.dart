import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class AddDataObjectComponentUseCase {
  final SwaggerRepository _swaggerRepository;

  AddDataObjectComponentUseCase(this._swaggerRepository);

  Result<OperationStatus> call({
    required DataObjectComponent component,
  }) =>
      _swaggerRepository.addDataObjectComponent(component);
}
