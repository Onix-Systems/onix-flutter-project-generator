import 'package:onix_flutter_bricks/core/arch/result/result.dart';
import 'package:onix_flutter_bricks/domain/entity/common/operation_status.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class EditSourceRequestUseCase {
  final SwaggerRepository _swaggerRepository;

  EditSourceRequestUseCase(this._swaggerRepository);

  Result<OperationStatus> call({
    required String sourceName,
    required RequestComponent oldComponent,
    required RequestComponent requestComponent,
  }) =>
      _swaggerRepository.editSourceRequest(
        sourceName: sourceName,
        oldComponent: oldComponent,
        requestComponent: requestComponent.copyWith(fromSwagger: false),
      );
}
