import 'package:onix_flutter_bricks/core/arch/result/result.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class AddSourceUseCase {
  final SwaggerRepository _swaggerRepository;

  AddSourceUseCase(this._swaggerRepository);

  Result<OperationStatus> call({
    required String sourceName,
    required ArchType arch,
  }) =>
      _swaggerRepository.addSource(sourceName: sourceName, arch: arch);
}
