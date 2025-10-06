import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

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
