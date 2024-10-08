import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

abstract interface class SwaggerRepository {
  Components? components;

  Future<Result<Components>> fetchSwaggerData({
    required String url,
  });

  void clearComponents();
}
