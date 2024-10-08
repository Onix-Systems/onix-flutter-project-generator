import 'package:onix_flutter_bricks/app/util/extenstion/content_key_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';

class SwaggerModelVariableResponseV3 extends BaseSwaggerModelVariableResponse {
  SwaggerModelVariableResponseV3({
    required super.name,
    required super.type,
    required super.isRequired,
  });

  factory SwaggerModelVariableResponseV3.fromJson(
    String name,
    List<String> requiredVariables,
    Map<String, dynamic> json,
    String from,
  ) {
    final required = json.containsKey('required') ? json['required'] : false;

    final rootType = _parseType(
      name,
      from,
      requiredVariables,
      json,
    );

    if (rootType != null) {
      return SwaggerModelVariableResponseV3(
        name: name,
        type: rootType,
        isRequired: required,
      );
    }

    if (json.containsKey('schema')) {
      final schema = json['schema'] as Map<String, dynamic>;
      final schemaType = _parseType(
        name,
        from,
        requiredVariables,
        schema,
      );
      if (schemaType != null) {
        return SwaggerModelVariableResponseV3(
          name: name,
          type: schemaType,
          isRequired: required,
        );
      }
    } else if (json.containsKey('content')) {
      final content = json['content'] as Map<String, dynamic>;
      Map<String, dynamic> validContent = {};
      content.forEach(
        (key, value) {
          if (key.isValidResponseContentKey()) {
            validContent = value;
          }
        },
      );
      if (validContent.isNotEmpty) {
        if (validContent.containsKey('schema')) {
          final schema = validContent['schema'] as Map<String, dynamic>;
          final contentSchemaType = _parseType(
            name,
            from,
            requiredVariables,
            schema,
          );
          if (contentSchemaType != null) {
            return SwaggerModelVariableResponseV3(
              name: name,
              type: contentSchemaType,
              isRequired: required,
            );
          }
        }
      }
    }

    return SwaggerModelVariableResponseV3(
      name: name,
      type: SwaggerOperationDefault(),
      isRequired: required,
    );
  }

  static SwaggerType? _parseType(
    String name,
    String from,
    List<String> requiredVariables,
    Map<String, dynamic> json,
  ) {
    ///Check type
    if (json.containsKey('enum')) {
      final enumTypes = json.asStringList('enum');
      return SwaggerEnum(
        name.clearEnumComponentName(),
        enumTypes,
        from: from,
      );
    } else if (json.containsKey('type')) {
      return BaseSwaggerModelVariableResponse.parseSimpleType(
        name,
        from,
        requiredVariables,
        json,
      );
    } else if (json.containsKey('\$ref')) {
      final typeValue =
          (json['\$ref'] as String).split('/').last.clearDataComponentsName();
      return SwaggerReference(
        typeValue,
        from: from,
      );
    } else if (json.containsKey('oneOf')) {
      final oneOf = json.asObjectList('oneOf');
      final typeValue = (oneOf.first['\$ref'] as String)
          .split('/')
          .last
          .clearDataComponentsName();
      return SwaggerReference(
        typeValue,
        from: from,
      );
    } else if (json.containsKey('anyOf')) {
      final anyOf = json.asObjectList('anyOf');
      if (anyOf.isEmpty) return null;
      return BaseSwaggerModelVariableResponse.parseSimpleType(
        name,
        from,
        requiredVariables,
        anyOf.first,
      );
    }
    return null;
  }
}
