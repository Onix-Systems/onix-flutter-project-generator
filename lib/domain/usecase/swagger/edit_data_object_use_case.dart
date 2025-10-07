import 'package:onix_flutter_bricks/core/arch/result/result.dart';
import 'package:onix_flutter_bricks/domain/entity/common/operation_status.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class EditComponentUseCase {
  final SwaggerRepository _swaggerRepository;

  EditComponentUseCase(this._swaggerRepository);

  Result<OperationStatus> call({
    required String oldName,
    required Component component,
  }) =>
      _swaggerRepository.editComponent(
        oldName: oldName,
        component: component,
      );
}
