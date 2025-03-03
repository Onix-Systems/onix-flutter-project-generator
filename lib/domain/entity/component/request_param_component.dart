import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
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
}

class RequestMultipartComponent extends RequestParamComponent {
  RequestMultipartComponent({
    required super.name,
    required super.type,
    required super.isRequired,
    super.isEnum = false,
    super.fromSwagger,
  });
}

class RequestQueryComponent extends RequestParamComponent {
  RequestQueryComponent({
    required super.name,
    required super.type,
    required super.isRequired,
    super.isEnum = false,
    super.fromSwagger,
  });
}

class RequestPathComponent extends RequestParamComponent {
  RequestPathComponent({
    required super.name,
    required super.type,
    required super.isRequired,
    super.isEnum = false,
    super.fromSwagger,
  });
}
