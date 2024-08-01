import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';

class SwaggerModelVariableResponseDefault
    extends BaseSwaggerModelVariableResponse {
  SwaggerModelVariableResponseDefault({
    required super.name,
    required super.type,
    required super.isRequired,
  });

  factory SwaggerModelVariableResponseDefault.dynamicDefault() {
    return SwaggerModelVariableResponseDefault(
      name: 'default',
      type: SwaggerOperationDefault(),
      isRequired: true,
    );
  }
}
