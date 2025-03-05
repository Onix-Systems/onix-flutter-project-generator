import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:recase/recase.dart';

sealed class RequestParamComponent {
  final String name;
  final SwaggerType type;
  final bool isRequired;
  final bool fromSwagger;
  final bool isEnum;

  RequestParamComponent({
    required this.name,
    required this.type,
    required this.isRequired,
    this.fromSwagger = true,
    this.isEnum = false,
  });

  String getParamBodyDeclaration(
    DataFileType fileType, {
    required bool isRequiredRequestBody,
    required bool forSource,
  }) {
    var requiredCopy = isRequired;
    if (isRequiredRequestBody) {
      requiredCopy = isRequiredRequestBody;
    }
    final requiredPrefix = requiredCopy ? 'required' : '';
    final requiredSuffix = requiredCopy ? '' : '?';

    if (isEnum && forSource) {
      var paramType = 'String';

      if (type is SwaggerArray) {
        paramType = 'List<String>';
      }

      return '$requiredPrefix $paramType$requiredSuffix '
          '${getNameDeclaration()},';
    }

    final body =
        '$requiredPrefix ${type.getTypeDeclaration(fileType)}$requiredSuffix '
        '${getNameDeclaration()},';

    return body;
  }

  String getNameDeclaration() =>
      name.replaceAll(RegExp(r'[^\s\w]'), '').camelCase;

  RequestParamComponent copyWith({
    String? name,
    SwaggerType? type,
    bool? isRequired,
    bool? fromSwagger,
    bool? isEnum,
  }) {
    if (this is RequestBodyComponent) {
      return RequestBodyComponent(
        name: name ?? this.name,
        type: type ?? this.type,
        isRequired: isRequired ?? this.isRequired,
        fromSwagger: fromSwagger ?? this.fromSwagger,
        isEnum: isEnum ?? this.isEnum,
      );
    } else if (this is RequestMultipartComponent) {
      return RequestMultipartComponent(
        name: name ?? this.name,
        type: type ?? this.type,
        isRequired: isRequired ?? this.isRequired,
        fromSwagger: fromSwagger ?? this.fromSwagger,
        isEnum: isEnum ?? this.isEnum,
      );
    } else if (this is RequestQueryComponent) {
      return RequestQueryComponent(
        name: name ?? this.name,
        type: type ?? this.type,
        isRequired: isRequired ?? this.isRequired,
        fromSwagger: fromSwagger ?? this.fromSwagger,
        isEnum: isEnum ?? this.isEnum,
      );
    } else if (this is RequestPathComponent) {
      return RequestPathComponent(
        name: name ?? this.name,
        type: type ?? this.type,
        isRequired: isRequired ?? this.isRequired,
        fromSwagger: fromSwagger ?? this.fromSwagger,
        isEnum: isEnum ?? this.isEnum,
      );
    }
    return this;
  }
}

class RequestBodyComponent extends RequestParamComponent {
  RequestBodyComponent({
    required super.name,
    required super.type,
    required super.isRequired,
    super.isEnum = false,
    super.fromSwagger,
  });

  RequestBodyComponent? updateComponentType(SwaggerType? type) {
    if (type != null && type is SwaggerReference) {
      return copyWith(type: type) as RequestBodyComponent;
    }
    return null;
  }
}

class RequestMultipartComponent extends RequestParamComponent {
  RequestMultipartComponent({
    required super.name,
    required super.type,
    required super.isRequired,
    super.isEnum = false,
    super.fromSwagger,
  });

  RequestMultipartComponent updateComponentType(Component component) {
    final isList = type is SwaggerArray;

    if (isList) {
      return copyWith(
        type: SwaggerArray(
          SwaggerModelVariableResponseV3(
            name: component.name,
            type: component is EnumParamComponent
                ? component.type
                : (component as DataObjectComponent).fileReference,
            isRequired: isRequired,
          ),
        ),
      ) as RequestMultipartComponent;
    }

    return copyWith(
      type: component is EnumParamComponent
          ? component.type
          : (component as DataObjectComponent).fileReference,
    ) as RequestMultipartComponent;
  }
}

class RequestQueryComponent extends RequestParamComponent {
  RequestQueryComponent({
    required super.name,
    required super.type,
    required super.isRequired,
    super.isEnum = false,
    super.fromSwagger,
  });

  RequestQueryComponent updateComponentType(Component component) {
    final isList = type is SwaggerArray;

    if (isList) {
      return copyWith(
        type: SwaggerArray(
          SwaggerModelVariableResponseV3(
            name: component.name,
            type: component is EnumParamComponent
                ? component.type
                : (component as DataObjectComponent).fileReference,
            isRequired: isRequired,
          ),
        ),
      ) as RequestQueryComponent;
    }

    return copyWith(
      type: component is EnumParamComponent
          ? component.type
          : (component as DataObjectComponent).fileReference,
    ) as RequestQueryComponent;
  }
}

class RequestPathComponent extends RequestParamComponent {
  RequestPathComponent({
    required super.name,
    required super.type,
    required super.isRequired,
    super.isEnum = false,
    super.fromSwagger,
  });

  //RequestPathComponent? updateComponentType(SwaggerType? type) {}
}

extension RequestParamComponentExtension on RequestParamComponent {
  String getTypeName() {
    final objectReference = type.getSwaggerObjectReference();
    final enumReference = type.getSwaggerEnumReference();

    if (objectReference != null) {
      return objectReference.reference;
    }

    if (enumReference != null) {
      return enumReference.name;
    }

    return name;
  }
}

extension RequestParamComponentListExtension on List<RequestParamComponent> {
  bool containsName(String name) {
    return any((element) {
      final elementName = element.getTypeName();

      return elementName == name;
    });
  }
}
