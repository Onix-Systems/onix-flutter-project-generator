


import 'package:onix_flutter_bricks/data/model/swagger/swagger_response.dart';

abstract interface class SwaggerRemoteSource {
  Future<SwaggerResponse> getSwaggerComponents({
    required String url,
  });
}
