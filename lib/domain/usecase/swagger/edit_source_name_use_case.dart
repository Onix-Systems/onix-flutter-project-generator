import 'package:onix_flutter_bricks/core/arch/result/result.dart';
import 'package:onix_flutter_bricks/domain/entity/common/operation_status.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

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
