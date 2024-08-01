import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';

class SwaggerModelVariableResponseUnsupported
    extends BaseSwaggerModelVariableResponse {
  SwaggerModelVariableResponseUnsupported({
    required super.name,
    required super.type,
    required super.isRequired,
  });

  factory SwaggerModelVariableResponseUnsupported.unsupported() {
    return SwaggerModelVariableResponseUnsupported(
      name: 'default',
      type: SwaggerOperationDefault(),
      isRequired: true,
    );
  }
}
