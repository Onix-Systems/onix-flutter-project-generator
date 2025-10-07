import 'package:onix_flutter_bricks/core/arch/result/result.dart';
import 'package:onix_flutter_bricks/domain/entity/common/operation_status.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class DeleteComponentUseCase {
  final SwaggerRepository _swaggerRepository;

  DeleteComponentUseCase(this._swaggerRepository);

  Result<OperationStatus> call({
    required Component component,
  }) =>
      _swaggerRepository.deleteComponent(component);
}
