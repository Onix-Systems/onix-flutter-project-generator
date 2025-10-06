import 'package:onix_flutter_bricks/core/arch/domain/result/result.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class DeleteSourceUseCase {
  final SwaggerRepository _swaggerRepository;

  DeleteSourceUseCase(this._swaggerRepository);

  Result<OperationStatus> call(String sourceName) =>
      _swaggerRepository.removeSource(sourceName);
}
