import 'package:onix_flutter_bricks/core/arch/result/result.dart';
import 'package:onix_flutter_bricks/domain/entity/common/operation_status.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class DeleteSourceUseCase {
  final SwaggerRepository _swaggerRepository;

  DeleteSourceUseCase(this._swaggerRepository);

  Result<OperationStatus> call(String sourceName) =>
      _swaggerRepository.removeSource(sourceName);
}
