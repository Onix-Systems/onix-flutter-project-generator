import 'package:onix_flutter_bricks/core/arch/result/result.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class DeleteSourceRequestUseCase {
  final SwaggerRepository _swaggerRepository;

  DeleteSourceRequestUseCase(this._swaggerRepository);

  Result<OperationStatus> call({
    required String sourceName,
    required RequestComponent requestComponent,
  }) =>
      _swaggerRepository.deleteSourceRequest(
        sourceName: sourceName,
        requestComponent: requestComponent,
      );
}
