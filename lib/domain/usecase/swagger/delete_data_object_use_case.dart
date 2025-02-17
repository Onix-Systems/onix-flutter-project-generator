import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class DeleteDataObjectComponentUseCase {
  final SwaggerRepository _swaggerRepository;

  DeleteDataObjectComponentUseCase(this._swaggerRepository);

  Result<OperationStatus> call({
    required String componentName,
  }) =>
      _swaggerRepository.deleteDataObjectComponent(componentName);
}
