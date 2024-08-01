import 'package:onix_flutter_bricks/data/model/swagger/model/base_swagger_model_response.dart';

class SwaggerModelResponseUnsupported extends BaseSwaggerModelResponse {
  SwaggerModelResponseUnsupported({
    required super.name,
    required super.type,
    required super.variables,
  });

  factory SwaggerModelResponseUnsupported.unsupported() {
    return SwaggerModelResponseUnsupported(
      name: '',
      type: '',
      variables: [],
    );
  }
}
