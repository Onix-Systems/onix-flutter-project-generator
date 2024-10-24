import 'package:onix_flutter_bricks/app/util/enum/swagger_path_input_type.dart';
import 'package:onix_flutter_bricks/app/util/enum/swagger_path_request_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v2.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/base_swagger_path_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_request_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_response_type.dart';
import 'package:onix_flutter_bricks/domain/entity/arch/arch.dart';

class SwaggerPathResponseV2 extends BaseSwaggerPathResponse {
  SwaggerPathResponseV2({
    required super.path,
    required super.type,
    required super.primaryTag,
    required super.description,
    required super.operationId,
    required super.input,
    required super.output,
  });

  factory SwaggerPathResponseV2.fromJson(
    String path,
    String type,
    Arch arch,
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
        final paramVariable = SwaggerModelVariableResponseV2.fromJson(
          name,
          isRequired ? [name] : [],
          arch,
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
                  SwaggerModelVariableResponseV2(
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
          final responseVariable = SwaggerModelVariableResponseV2.fromJson(
            code,
            [code],
            arch,
            value,
            tag,
          );
          responseParams.add(
            SwaggerResponseType(responseVariable),
          );
        },
      );
    }
    return SwaggerPathResponseV2(
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
