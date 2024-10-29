import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/base_swagger_model_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';

class SwaggerModelResponseV3 extends BaseSwaggerModelResponse {
  SwaggerModelResponseV3({
    required super.name,
    required super.type,
    required super.variables,
  });

  factory SwaggerModelResponseV3.fromJson(
    String rawModelName,
    Map<String, dynamic> json,
    Map<String, dynamic> allObjects,
  ) {
    var crossReferences = <BaseSwaggerModelResponse>[];
    if (json.containsKey('allOf')) {
      final allOff = json.asObjectList('allOf');
      crossReferences = _getCrossReferences(
        allOff,
        allObjects,
      );
    }

    final modelName = rawModelName.clearDataComponentsName();

    final variables =
        List<BaseSwaggerModelVariableResponse>.empty(growable: true);
    final type = json['type'];
    final requiredVariables = (json.containsKey('required'))
        ? json.asStringList('required')
        : <String>[];

    if (json.containsKey('allOf')) {
      final allOff = json.asObjectList('allOf');
      final crossReferenceVariables = _parseCrossReferences(
        modelName,
        requiredVariables,
        crossReferences,
        allOff,
      );
      variables.addAll(crossReferenceVariables);
    }
    if (json.containsKey('properties')) {
      final properties = json['properties'] as Map<String, dynamic>;
      final parsedVariables = _parseProperties(
        modelName,
        requiredVariables,
        properties,
      );
      variables.addAll(parsedVariables);
    }

    return SwaggerModelResponseV3(
      name: modelName,
      type: type,
      variables: variables,
    );
  }

  static List<BaseSwaggerModelVariableResponse> _parseProperties(
    String modelName,
    List<String> requiredVariables,
    Map<String, dynamic> properties,
  ) {
    final variables =
        List<BaseSwaggerModelVariableResponse>.empty(growable: true);
    properties.forEach(
      (name, value) {
        final contentJson = value as Map<String, dynamic>;
        final swaggerVariable = SwaggerModelVariableResponseV3.fromJson(
          name,
          requiredVariables,
          contentJson,
          modelName,
        );
        variables.add(swaggerVariable);
      },
    );
    return variables;
  }

  static List<BaseSwaggerModelVariableResponse> _parseCrossReferences(
    String modelName,
    List<String> requiredVariables,
    List<BaseSwaggerModelResponse> crossReferences,
    List<Map<String, dynamic>> allOff,
  ) {
    final variables =
        List<BaseSwaggerModelVariableResponse>.empty(growable: true);
    for (var e in allOff) {
      if (e.containsKey('\$ref')) {
        final typeValue =
            (e['\$ref'] as String).split('/').last.clearDataComponentsName();
        final crossRef = crossReferences.singleWhereOrNull(
          (e) => e.name == typeValue,
        );
        if (crossRef != null) {
          variables.addAll(crossRef.variables);
        }
      } else if (e.containsKey('properties')) {
        final properties = e['properties'] as Map<String, dynamic>;
        final parsedVariables = _parseProperties(
          modelName,
          requiredVariables,
          properties,
        );
        variables.addAll(parsedVariables);
      }
    }
    return variables;
  }

  static List<BaseSwaggerModelResponse> _getCrossReferences(
    List<Map<String, dynamic>> allOff,
    Map<String, dynamic> definitions,
  ) {
    final crossReferences =
        List<BaseSwaggerModelResponse>.empty(growable: true);
    for (var e in allOff) {
      if (!e.containsKey('\$ref')) {
        continue;
      }
      final typeValue = (e['\$ref'] as String).split('/').last;
      if (definitions.containsKey(typeValue)) {
        final crossReference = SwaggerModelResponseV3.fromJson(
          typeValue,
          definitions[typeValue] as Map<String, dynamic>,
          {},
        );
        crossReferences.add(crossReference);
      }
    }
    return crossReferences;
  }
}
