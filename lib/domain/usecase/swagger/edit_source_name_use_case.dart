import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

class EditSourceNameUseCase {
  final SwaggerRepository _swaggerRepository;

  EditSourceNameUseCase(this._swaggerRepository);

  Result<OperationStatus> call({
    required String sourceName,
    required String newName,
  }) =>
      _swaggerRepository.editSourceName(
        sourceName: sourceName,
        newName: newName,
      );
}
