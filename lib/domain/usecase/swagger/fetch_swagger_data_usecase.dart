import 'package:onix_flutter_bricks/domain/entity/arch/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class FetchSwaggerDataUseCase {
  final SwaggerRepository _swaggerRepository;

  const FetchSwaggerDataUseCase(this._swaggerRepository);

  Future<Result<Components?>> call({
    required String url,
    required ArchType arch,
  }) async {
    return _swaggerRepository.fetchSwaggerData(url: url, arch: arch);
  }
}
