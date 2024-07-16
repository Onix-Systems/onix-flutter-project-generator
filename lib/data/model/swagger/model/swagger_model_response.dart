import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/swagger_model_variable_response.dart';

class SwaggerModelResponse {
  final String name;
  final String type;
  final List<SwaggerModelVariableResponse> variables;

  SwaggerModelResponse({
    required this.name,
    required this.type,
    required this.variables,
  });

  factory SwaggerModelResponse.fromJsonV3(
    String rawModelName,
    Map<String, dynamic> json,
    List<SwaggerModelResponse> crossReferences,
  ) {
    var modelName = rawModelName.clearDataComponentsName();

    var variables = List<SwaggerModelVariableResponse>.empty(growable: true);
    final type = json['type'];
    final requiredVariables = (json.containsKey('required'))
        ? json.asStringList('required')
        : <String>[];

    if (json.containsKey('allOf')) {
      final allOff = json.asObjectList('allOf');
      final crossReferenceVariables = _parseCrossReferencesV3(
        modelName,
        requiredVariables,
        crossReferences,
        allOff,
      );
      variables.addAll(crossReferenceVariables);
    }
    if (json.containsKey('properties')) {
      final properties = json['properties'] as Map<String, dynamic>;
      final parsedVariables = _parsePropertiesV3(
        modelName,
        requiredVariables,
        properties,
      );
      variables.addAll(parsedVariables);
    }

    return SwaggerModelResponse(
      name: modelName,
      type: type,
      variables: variables,
    );
  }

  factory SwaggerModelResponse.fromJsonV2(
    String rawModelName,
    Map<String, dynamic> json,
  ) {
    var modelName = rawModelName.clearDataComponentsName();

    var variables = List<SwaggerModelVariableResponse>.empty(growable: true);
    final type = json['type'];
    final requiredVariables = (json.containsKey('required'))
        ? json.asStringList('required')
        : <String>[];

    if (json.containsKey('properties')) {
      final properties = json['properties'] as Map<String, dynamic>;
      variables = _parsePropertiesV2(
        modelName,
        requiredVariables,
        properties,
      );
    }

    return SwaggerModelResponse(
      name: modelName,
      type: type,
      variables: variables,
    );
  }

  @override
  String toString() {
    final variablesString = variables.map((e) => e.toString()).join('\n');
    return 'class $name\n $variablesString';
  }

  static List<SwaggerModelVariableResponse> _parsePropertiesV2(
    String modelName,
    List<String> requiredVariables,
    Map<String, dynamic> properties,
  ) {
    final variables = List<SwaggerModelVariableResponse>.empty(growable: true);

    properties.forEach(
      (name, value) {
        final contentJson = value as Map<String, dynamic>;
        final swaggerVariable = SwaggerModelVariableResponse.fromJsonV2(
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

  static List<SwaggerModelVariableResponse> _parsePropertiesV3(
    String modelName,
    List<String> requiredVariables,
    Map<String, dynamic> properties,
  ) {
    final variables = List<SwaggerModelVariableResponse>.empty(growable: true);
    properties.forEach(
      (name, value) {
        final contentJson = value as Map<String, dynamic>;
        final swaggerVariable = SwaggerModelVariableResponse.fromJsonV3(
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

  static List<SwaggerModelVariableResponse> _parseCrossReferencesV3(
    String modelName,
    List<String> requiredVariables,
    List<SwaggerModelResponse> crossReferences,
    List<Map<String, dynamic>> allOff,
  ) {
    final variables = List<SwaggerModelVariableResponse>.empty(growable: true);
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
        final parsedVariables = _parsePropertiesV3(
          modelName,
          requiredVariables,
          properties,
        );
        variables.addAll(parsedVariables);
      }
    }
    return variables;
  }
}
