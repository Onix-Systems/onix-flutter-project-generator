import 'package:onix_flutter_bricks/app/util/extenstion/content_key_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';

class SwaggerModelVariableResponseV3 extends BaseSwaggerModelVariableResponse {
  SwaggerModelVariableResponseV3({
    required super.name,
    required super.type,
    required super.isRequired,
  });

  factory SwaggerModelVariableResponseV3.fromJson(
    String name,
    List<String> requiredVariables,
    ArchType arch,
    Map<String, dynamic> json,
    String from,
  ) {
    final required = json['required'] is bool
        ? json['required'] as bool
        : json.containsKey('required') && requiredVariables.contains(name);

    final rootType = _parseType(
      name,
      from,
      arch,
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
        arch,
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
      var validContent = <String, dynamic>{};
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

          if (schema.containsKey('allOf')) {
            logger.f('allOf: ${schema['allOf']}');
          }

          final contentSchemaType = _parseType(
            name,
            from,
            arch,
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
    ArchType arch,
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
        arch,
        requiredVariables,
        json,
      );
    } else if (json.containsKey(r'$ref')) {
      final typeValue =
          (json[r'$ref'] as String).split('/').last.clearDataComponentsName();
      return SwaggerReference(
        typeValue,
        from: from,
      );
    } else if (json.containsKey('properties')) {
      final properties = json['properties'] as Map<String, dynamic>;
      final parsedVariables = _parseProperties(
        name,
        requiredVariables,
        arch,
        properties,
      );

      return SwaggerAllOf(
        name: name,
        parameters: parsedVariables
            .map(
              (e) => e.type,
            )
            .toList(),
        from: from,
      );
    } else if (json.containsKey('oneOf')) {
      final oneOf = json.asObjectList('oneOf');
      final typeValue = (oneOf.first[r'$ref'] as String)
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
        arch,
        requiredVariables,
        anyOf.first,
      );
    } else if (json.containsKey('allOf')) {
      final parsedVariables = <SwaggerType>[];

      for (final item in json.asObjectList('allOf')) {
        final parsedType =
            _parseType(name, from, arch, requiredVariables, item);

        if (parsedType != null) {
          parsedVariables.add(parsedType);
        }
      }

      if (parsedVariables.length == 1) {
        return parsedVariables.first;
      }

      return SwaggerAllOf(
        name: name,
        parameters: parsedVariables,
        from: from,
      );
    }
    return null;
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
        final swaggerVariable = SwaggerModelVariableResponseV3.fromJson(
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
