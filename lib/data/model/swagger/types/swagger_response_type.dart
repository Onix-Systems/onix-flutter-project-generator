import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';

class SwaggerResponseType {
  final BaseSwaggerModelVariableResponse variable;

  SwaggerResponseType(this.variable);

  @override
  String toString() {
    return variable.toString();
  }
}
