import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/base_swagger_model_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v2.dart';
import 'package:onix_flutter_bricks/domain/entity/arch/arch_type.dart';

class SwaggerModelResponseV2 extends BaseSwaggerModelResponse {
  SwaggerModelResponseV2({
    required super.name,
    required super.type,
    required super.variables,
  });

  factory SwaggerModelResponseV2.fromJson(
    String rawModelName,
    ArchType arch,
    Map<String, dynamic> json,
  ) {
    final modelName = rawModelName.clearDataComponentsName();

    var variables =
        List<BaseSwaggerModelVariableResponse>.empty(growable: true);
    final type = json['type'];
    final requiredVariables = (json.containsKey('required'))
        ? json.asStringList('required')
        : <String>[];

    if (json.containsKey('properties')) {
      final properties = json['properties'] as Map<String, dynamic>;
      variables = _parseProperties(
        modelName,
        requiredVariables,
        arch,
        properties,
      );
    }

    return SwaggerModelResponseV2(
      name: modelName,
      type: type,
      variables: variables,
    );
  }

  static List<BaseSwaggerModelVariableResponse> _parseProperties(
    String modelName,
    List<String> requiredVariables,
    ArchType arch,
    Map<String, dynamic> properties,
  ) {
    final variables =
        List<BaseSwaggerModelVariableResponse>.empty(growable: true);

    properties.forEach(
      (name, value) {
        final contentJson = value as Map<String, dynamic>;
        final swaggerVariable = SwaggerModelVariableResponseV2.fromJson(
          name,
          requiredVariables,
          arch,
          contentJson,
          modelName,
        );
        variables.add(swaggerVariable);
      },
    );
    return variables;
  }
}
