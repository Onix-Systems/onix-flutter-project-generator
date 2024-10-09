import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';

sealed class SwaggerRequestType {
  final BaseSwaggerModelVariableResponse variable;

  SwaggerRequestType(this.variable);

  @override
  String toString() {
    var type = '';
    switch (this) {
      case RequestBody():
        type = 'requestBody';
      case RequestMultipart():
        type = 'MultipartParam';
      case RequestQuery():
        type = 'queryParam';
      case RequestPath():
        type = 'pathParam';
    }
    return '$type - ${variable.type} ${variable.name}';
  }
}

class RequestBody extends SwaggerRequestType {
  RequestBody(super.body);
}

class RequestMultipart extends SwaggerRequestType {
  RequestMultipart(super.body);
}

class RequestQuery extends SwaggerRequestType {
  RequestQuery(super.body);
}

class RequestPath extends SwaggerRequestType {
  RequestPath(super.body);
}
