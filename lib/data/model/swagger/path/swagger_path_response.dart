import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/app/swagger_const.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/app/util/enum/swagger_path_input_type.dart';
import 'package:onix_flutter_bricks/app/util/enum/swagger_path_request_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_request_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_response_type.dart';

class SwaggerPathResponse {
  final String path;
  final SwaggerPathRequestType type;
  final String primaryTag;
  final String description;
  final String operationId;
  final List<SwaggerRequestType> input;
  final List<SwaggerResponseType> output;

  SwaggerPathResponse({
    required this.path,
    required this.type,
    required this.primaryTag,
    required this.description,
    required this.operationId,
    required this.input,
    required this.output,
  });

  SwaggerResponseType getSuccessResponse() {
    final successCodeResponse = output.firstWhereOrNull(
      (e) => SwaggerConst.swaggerSuccessCodes.contains(e.variable.name),
    );
    if (successCodeResponse != null) {
      return successCodeResponse;
    }
    final defaultResponse = output.firstWhereOrNull(
      (e) => e.variable.name == 'default',
    );
    if (defaultResponse != null) {
      return defaultResponse;
    }
    return SwaggerResponseType(
      SwaggerModelVariableResponse.dynamicDefault(),
    );
  }

  factory SwaggerPathResponse.fromJsonV3(
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
    }

    final hasParams = json.containsKey('parameters');
    final hasRequestBody = json.containsKey('requestBody');
    if (hasRequestBody) {
      final requestBodyContent =
          json['requestBody']['content'] as Map<String, dynamic>;
      requestBodyContent.forEach(
        (key, value) {
          final paramVariable = SwaggerModelVariableResponse.fromJsonV3(
            'requestBody',
            ['requestBody'],
            value,
            tag,
          );
          if (key == 'multipart/form-data') {
            inputParameters.add(
              RequestMultipart(
                SwaggerModelVariableResponse(
                  name: paramVariable.name,
                  type: paramVariable.type,
                  isRequired: true,
                ),
              ),
            );
          } else if (key == 'application/json') {
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
        final paramVariable = SwaggerModelVariableResponse.fromJsonV3(
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
          final responseVariable = SwaggerModelVariableResponse.fromJsonV3(
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

    return SwaggerPathResponse(
      path: path,
      type: requestType,
      primaryTag: tag,
      description: description,
      operationId: operationId,
      input: inputParameters,
      output: responseParams,
    );
  }

  factory SwaggerPathResponse.fromJsonV2(
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
    if (json.containsKey('summary')) {
      description = json['summary'];
    }

    if (json.containsKey('operationId')) {
      operationId = json['operationId'];
    }

    ///get input parameters
    if (json.containsKey('parameters')) {
      final params = json.asObjectList('parameters');
      for (var param in params) {
        final inType = SwaggerPathInputType.fromString(param['in']);
        final name = param['name'] as String;
        final isRequired = param['required'] as bool;
        final paramVariable = SwaggerModelVariableResponse.fromJsonV2(
          name,
          isRequired ? [name] : [],
          param,
          tag,
        );
        switch (inType) {
          case SwaggerPathInputType.path:
            {
              inputParameters.add(
                RequestPath(paramVariable),
              );
              break;
            }
          case SwaggerPathInputType.query:
            {
              inputParameters.add(
                RequestQuery(paramVariable),
              );
              break;
            }
          case SwaggerPathInputType.formData:
            {
              ///For multipart data params are always required
              inputParameters.add(
                RequestMultipart(
                  SwaggerModelVariableResponse(
                    name: paramVariable.name,
                    type: paramVariable.type,
                    isRequired: true,
                  ),
                ),
              );
              break;
            }
          case SwaggerPathInputType.body:
            {
              inputParameters.add(
                RequestBody(paramVariable),
              );
              break;
            }
          case SwaggerPathInputType.header:
            {
              break;
            }
        }
      }
    }

    ///Get output parameters
    if (json.containsKey('responses')) {
      final responses = json['responses'] as Map<String, dynamic>;

      responses.forEach(
        (code, value) {
          final responseVariable = SwaggerModelVariableResponse.fromJsonV2(
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
    return SwaggerPathResponse(
      path: path,
      type: requestType,
      primaryTag: tag,
      description: description,
      operationId: operationId,
      input: inputParameters,
      output: responseParams,
    );
  }

  @override
  String toString() {
    final inputString = input.map((e) => e.toString()).join('\n');
    final responseString = output.map((e) => e.toString()).join('\n');
    return '----Swagger Request----\npath: $path\n${type.name}\n$primaryTag\n$description\n --Input Parameters--\n $inputString\n --Response Parameters--\n $responseString ';
  }
}
