import 'package:onix_flutter_bricks/core/arch/result/result.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class AddSourceRequestUseCase {
  final SwaggerRepository _swaggerRepository;

  AddSourceRequestUseCase(this._swaggerRepository);

  Result<OperationStatus> call({
    required String sourceName,
    required RequestComponent requestComponent,
  }) =>
      _swaggerRepository.addSourceRequest(
        sourceName: sourceName,
        requestComponent: requestComponent.copyWith(fromSwagger: false),
      );
}
