import 'package:onix_flutter_bricks/app/swagger_const.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';

class SwaggerModelVariableResponse {
  final String name;
  final SwaggerType type;
  final bool isRequired;

  SwaggerModelVariableResponse({
    required this.name,
    required this.type,
    required this.isRequired,
  });

  String getTypeDeclaration(DataFileType fileType) =>
      type.getTypeDeclaration(fileType);

  factory SwaggerModelVariableResponse.dynamicDefault() {
    return SwaggerModelVariableResponse(
      name: 'default',
      type: SwaggerOperationDefault(),
      isRequired: true,
    );
  }

  factory SwaggerModelVariableResponse.fromJsonV3(
    String name,
    List<String> requiredVariables,
    Map<String, dynamic> json,
    String from,
  ) {
    final required = json.containsKey('required') ? json['required'] : false;

    final rootType = _parseContentTypeV3(
      name,
      from,
      requiredVariables,
      json,
    );
    if (rootType != null) {
      return SwaggerModelVariableResponse(
        name: name,
        type: rootType,
        isRequired: required,
      );
    }

    if (json.containsKey('schema')) {
      final schema = json['schema'] as Map<String, dynamic>;
      final schemaType = _parseContentTypeV3(
        name,
        from,
        requiredVariables,
        schema,
      );
      if (schemaType != null) {
        return SwaggerModelVariableResponse(
          name: name,
          type: schemaType,
          isRequired: required,
        );
      }
    } else if (json.containsKey('content')) {
      final content = json['content'] as Map<String, dynamic>;
      if (content.containsKey('*/*')) {
        final any = content['*/*'] as Map<String, dynamic>;
        if (any.containsKey('schema')) {
          final schema = any['schema'] as Map<String, dynamic>;
          final contentSchemaType = _parseContentTypeV3(
            name,
            from,
            requiredVariables,
            schema,
          );
          if (contentSchemaType != null) {
            return SwaggerModelVariableResponse(
              name: name,
              type: contentSchemaType,
              isRequired: required,
            );
          }
        }
      }
    }

    return SwaggerModelVariableResponse(
      name: name,
      type: SwaggerOperationDefault(),
      isRequired: required,
    );
  }

  factory SwaggerModelVariableResponse.fromJsonV2(
    String name,
    List<String> requiredVariables,
    Map<String, dynamic> json,
    String from,
  ) {
    SwaggerType? type;

    ///Check type
    if (json.containsKey('enum')) {
      final enumTypes = json.asStringList('enum');
      type = SwaggerEnum(
        name.clearEnumComponentName(),
        enumTypes,
        from: from,
      );
    } else if (json.containsKey('type')) {
      type = _parseType(
        name,
        from,
        requiredVariables,
        json,
      );
    } else if (json.containsKey('\$ref')) {
      final typeValue =
          (json['\$ref'] as String).split('/').last.clearDataComponentsName();
      type = SwaggerReference(
        typeValue,
        from: from,
      );
    } else if (json.containsKey('schema')) {
      if (json['schema'].containsKey('type')) {
        type = _parseType(
          name,
          from,
          requiredVariables,
          json['schema'],
        );
      } else {
        final typeValue = (json['schema']['\$ref'] as String)
            .split('/')
            .last
            .clearDataComponentsName();
        type = SwaggerReference(
          typeValue,
          from: from,
        );
      }
    }
    final isRequired = requiredVariables.contains(name);
    return SwaggerModelVariableResponse(
      name: name,
      type: type ?? SwaggerOperationDefault(),
      isRequired: (type == null) ? true : isRequired,
    );
  }

  static SwaggerType _parseType(
    String name,
    String from,
    List<String> requiredVariables,
    Map<String, dynamic> json,
  ) {
    final typeValue = json['type'];
    if (typeValue == 'file') {
      return SwaggerFile();
    } else if (typeValue == 'array') {
      final arrayVariable = SwaggerModelVariableResponse.fromJsonV2(
        name,
        requiredVariables,
        json['items'],
        from,
      );
      return SwaggerArray(
        arrayVariable,
        from: from,
      );
    } else {
      if (!SwaggerConst.swaggerPrimitives.contains(typeValue)) {
        return SwaggerOperationDefault();
      }
      return SwaggerVariable(
        typeValue,
        from: from,
      );
    }
  }

  static SwaggerType? _parseContentTypeV3(
    String name,
    String from,
    List<String> requiredVariables,
    Map<String, dynamic> json,
  ) {
    SwaggerType? type;

    ///Check type
    if (json.containsKey('enum')) {
      final enumTypes = json.asStringList('enum');
      type = SwaggerEnum(
        name.clearEnumComponentName(),
        enumTypes,
        from: from,
      );
    } else if (json.containsKey('type')) {
      type = _parseType(
        name,
        from,
        requiredVariables,
        json,
      );
    } else if (json.containsKey('\$ref')) {
      final typeValue =
          (json['\$ref'] as String).split('/').last.clearDataComponentsName();
      type = SwaggerReference(
        typeValue,
        from: from,
      );
    } else if (json.containsKey('oneOf')) {
      final oneOf = json.asObjectList('oneOf');
      final typeValue = (oneOf.first['\$ref'] as String)
          .split('/')
          .last
          .clearDataComponentsName();
      type = SwaggerReference(
        typeValue,
        from: from,
      );
    }
    return type;
  }

  @override
  String toString() {
    final typeSuffix = isRequired ? '' : '?';
    return '${type.toString()}$typeSuffix $name';
  }
}
