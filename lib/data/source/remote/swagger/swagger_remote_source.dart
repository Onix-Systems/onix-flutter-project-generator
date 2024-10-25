import 'package:onix_flutter_bricks/data/model/swagger/swagger_response.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';

// ignore: one_member_abstracts
abstract interface class SwaggerRemoteSource {
  Future<SwaggerResponse> getSwaggerComponents({
    required String url,
    required ArchType arch,
  });
}
