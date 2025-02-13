import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

abstract interface class SwaggerRepository {
  Components get components;

  Future<Result<Components>> fetchSwaggerData({
    required String url,
    required ArchType arch,
  });

  void clearComponents();

  Result<OperationStatus> addSource({
    required String sourceName,
    required ArchType arch,
  });

  Result<OperationStatus> removeSource(String sourceName);

  Result<OperationStatus> editSourceName({
    required String sourceName,
    required String newName,
  });

  void isSourceExists(String sourceName);
}
