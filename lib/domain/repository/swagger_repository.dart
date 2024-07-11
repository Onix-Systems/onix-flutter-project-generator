
import 'package:onix_flutter_bricks/core/arch/domain/entity/result/result.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';

abstract class SwaggerRepository {

  Components? components;

  Future<Result<Components>> fetchSwaggerData({
    required String url,
});

  void clearComponents();

}
