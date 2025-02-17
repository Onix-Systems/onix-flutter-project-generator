import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class EditDataObjectComponentUseCase {
  final SwaggerRepository _swaggerRepository;

  EditDataObjectComponentUseCase(this._swaggerRepository);

  Result<OperationStatus> call({
    required String oldName,
    required DataObjectComponent component,
  }) =>
      _swaggerRepository.editDataObjectComponent(
        oldName: oldName,
        dataObject: component,
      );
}
