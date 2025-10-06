import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

class DeleteSourceUseCase {
  final SwaggerRepository _swaggerRepository;

  DeleteSourceUseCase(this._swaggerRepository);

  Result<OperationStatus> call(String sourceName) =>
      _swaggerRepository.removeSource(sourceName);
}
