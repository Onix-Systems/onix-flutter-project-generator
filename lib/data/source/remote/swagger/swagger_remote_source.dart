import 'package:onix_flutter_bricks/data/model/swagger/swagger_response.dart';

// ignore: one_member_abstracts
abstract interface class SwaggerRemoteSource {
  Future<SwaggerResponse> getSwaggerComponents({
    required String url,
  });
}
