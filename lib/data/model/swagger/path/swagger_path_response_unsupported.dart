import 'package:onix_flutter_bricks/app/util/enum/swagger_path_request_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/base_swagger_path_response.dart';

class SwaggerPathResponseUnsupported extends BaseSwaggerPathResponse {
  SwaggerPathResponseUnsupported({
    required super.path,
    required super.type,
    required super.primaryTag,
    required super.description,
    required super.operationId,
    required super.input,
    required super.output,
  });

  factory SwaggerPathResponseUnsupported.unsupported() =>
      SwaggerPathResponseUnsupported(
        path: '',
        type: SwaggerPathRequestType.get,
        primaryTag: '',
        description: '',
        operationId: '',
        input: [],
        output: [],
      );
}
