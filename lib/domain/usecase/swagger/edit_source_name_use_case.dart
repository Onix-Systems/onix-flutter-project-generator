import 'package:onix_flutter_bricks/core/arch/domain/result/result.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

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
