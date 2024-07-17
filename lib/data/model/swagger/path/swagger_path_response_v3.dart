import 'package:onix_flutter_bricks/app/util/enum/swagger_path_request_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/base_swagger_path_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_request_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_response_type.dart';
import 'package:recase/recase.dart';

class SwaggerPathResponseV3 extends BaseSwaggerPathResponse {
  SwaggerPathResponseV3({
    required super.path,
    required super.type,
    required super.primaryTag,
    required super.description,
    required super.operationId,
    required super.input,
    required super.output,
  });

  factory SwaggerPathResponseV3.fromJson(
    String path,
    String type,
    Map<String, dynamic> json,
  ) {
    final inputParameters = List<SwaggerRequestType>.empty(growable: true);
    final responseParams = List<SwaggerResponseType>.empty(growable: true);

    final requestType = SwaggerPathRequestType.fromString(type);
    var tag = 'unnamed';
    var description = '';
    var operationId = '';

    //get primary tag
    if (json.containsKey('tags')) {
      final tags = json.asStringList('tags');
      tag =
          (tags.isNotEmpty) ? tags.first.clearDataComponentsName() : 'unnamed';
    }
    //get summary - description
    if (json.containsKey('description')) {
      final descriptionRaw = json['description'] as String;
      description = descriptionRaw.split('\n').join('///\n');
    }

    if (json.containsKey('operationId')) {
      operationId = json['operationId'];
    } else {
      operationId = '${type}_${path.clearPathToName()}'.camelCase;
    }

    final hasParams = json.containsKey('parameters');
    final hasRequestBody = json.containsKey('requestBody');
    if (hasRequestBody) {
      final requestBodyContent =
          json['requestBody']['content'] as Map<String, dynamic>;
      requestBodyContent.forEach(
        (key, value) {
          final paramVariable = SwaggerModelVariableResponseV3.fromJson(
            'requestBody',
            ['requestBody'],
            value,
            tag,
          );
          if (key.contains('multipart/form-data')) {
            inputParameters.add(
              RequestMultipart(
                SwaggerModelVariableResponseV3(
                  name: paramVariable.name,
                  type: paramVariable.type,
                  isRequired: true,
                ),
              ),
            );
          } else if (key.contains('application/json')) {
            inputParameters.add(
              RequestBody(paramVariable),
            );
          }
        },
      );
    }
    if (hasParams) {
      final parameters = json.asObjectList('parameters');
      for (var param in parameters) {
        final type = param['in'];
        final name = param['name'];
        final isRequired =
            param.containsKey('required') ? param['required'] : false;
        final paramVariable = SwaggerModelVariableResponseV3.fromJson(
          name,
          isRequired ? [name] : [],
          param,
          tag,
        );
        if (type == 'path') {
          inputParameters.add(
            RequestPath(paramVariable),
          );
        } else if (type == 'query') {
          inputParameters.add(
            RequestQuery(paramVariable),
          );
        }
      }
    }

    if (json.containsKey('responses')) {
      final responses = json['responses'] as Map<String, dynamic>;
      responses.forEach(
        (code, value) {
          final responseVariable = SwaggerModelVariableResponseV3.fromJson(
            code,
            [code],
            value,
            tag,
          );

          responseParams.add(
            SwaggerResponseType(responseVariable),
          );
        },
      );
    }

    return SwaggerPathResponseV3(
      path: path,
      type: requestType,
      primaryTag: tag,
      description: description,
      operationId: operationId,
      input: inputParameters,
      output: responseParams,
    );
  }
}
