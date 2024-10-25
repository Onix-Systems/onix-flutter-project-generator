import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

abstract interface class SwaggerRepository {
  Components? components;

  Future<Result<Components>> fetchSwaggerData({
    required String url,
    required ArchType arch,
  });

  void clearComponents();
}
