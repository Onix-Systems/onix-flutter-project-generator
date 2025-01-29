import 'package:onix_flutter_bricks/app/util/enum/swagger_path_request_type.dart';
import 'package:onix_flutter_bricks/app/util/enum/swagger_version_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/base_swagger_path_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_request_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_response_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
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
    ArchType arch,
    Map<String, dynamic> json,
  ) {
    final inputParameters = List<SwaggerRequestType>.empty(growable: true);
    final responseParams = List<SwaggerResponseType>.empty(growable: true);

    final requestType = SwaggerPathRequestType.fromString(type);
    var tag = 'unnamed';
    var description = '';
    var operationId = '';

    // get primary tag
    if (json.containsKey('tags')) {
      final tags = json.asStringList('tags');
      tag =
          (tags.isNotEmpty) ? tags.first.clearDataComponentsName() : 'unnamed';
    }
    // get summary - description
    if (json.containsKey('description')) {
      final descriptionRaw = json['description'] as String;
      description = descriptionRaw.split('\n').join('///\n');
    }

    if (json.containsKey('operationId')) {
      operationId = json['operationId'].toString().clearOperationId();
    } else {
      operationId = '${type}_${path.clearPathToName()}'.camelCase;
    }

    final hasParams = json.containsKey('parameters');
    final hasRequestBody = json.containsKey('requestBody');
    if (hasRequestBody) {
      (json['requestBody']['content'] as Map<String, dynamic>).forEach(
        (key, value) {
          final paramVariable = SwaggerModelVariableResponseV3.fromJson(
            'requestBody',
            ['requestBody'],
            arch,
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
      for (final param in parameters) {
        final type = param['in'];
        final name = param['name'];
        final isRequired =
            param.containsKey('required') ? param['required'] : false;
        final paramVariable = SwaggerModelVariableResponseV3.fromJson(
          name,
          isRequired ? [name] : [],
          arch,
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
      (json['responses'] as Map<String, dynamic>).forEach(
        (code, value) {
          if ((value as Map<String, dynamic>)['content'] != null) {
            final content = value['content'] as Map<String, dynamic>;

            if (content.containsKey('application/json')) {
              final contentValue =
                  content['application/json'] as Map<String, dynamic>;
              if (contentValue.containsKey('schema')) {
                final schema = contentValue['schema'] as Map<String, dynamic>;

                if (schema.containsKey('allOf')) {
                  final allOfParams = <BaseSwaggerModelVariableResponse>[];
                  for (final item in schema['allOf']) {
                    final itemSchema = item as Map<String, dynamic>;
                    final isRef = item.containsKey(r'$ref');
                    final name = isRef
                        ? (item[r'$ref'] as String)
                            .split('/')
                            .last
                            .clearDataComponentsName()
                        : item['properties'] != null
                            ? 'properties'
                            : 'unnamed';

                    if (name == 'properties') {
                      (item['properties'] as Map<String, dynamic>).forEach(
                        (key, value) {
                          final contentJson = value as Map<String, dynamic>;
                          final swaggerVariable =
                              SwaggerModelVariableResponseV3.fromJson(
                            key,
                            [],
                            arch,
                            contentJson,
                            tag,
                          );
                          allOfParams.add(swaggerVariable);
                        },
                      );
                    } else {
                      final responseVariable =
                          BaseSwaggerModelVariableResponse.fromJson(
                        SwaggerVersionType.swagger3,
                        name,
                        arch,
                        [],
                        isRef ? itemSchema : {'schema': itemSchema},
                        tag,
                      );

                      allOfParams.add(responseVariable);
                    }
                  }
                  responseParams.add(
                    SwaggerResponseType(
                      SwaggerModelVariableResponseV3(
                        name: code,
                        type: SwaggerAllOf(
                          name: operationId,
                          parameters: allOfParams.map((e) => e.type).toList(),
                        ),
                        isRequired: true,
                      ),
                    ),
                  );
                } else {
                  final responseVariable =
                      SwaggerModelVariableResponseV3.fromJson(
                    code,
                    [code],
                    arch,
                    schema,
                    tag,
                  );

                  responseParams.add(
                    SwaggerResponseType(responseVariable),
                  );
                }
              }
            }
          }
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
