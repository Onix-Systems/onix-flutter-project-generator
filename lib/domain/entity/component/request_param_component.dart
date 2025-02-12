import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:recase/recase.dart';

sealed class RequestParamComponent {
  final String name;
  final SwaggerType type;
  final bool isRequired;

  RequestParamComponent({
    required this.name,
    required this.type,
    required this.isRequired,
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

    final isEnum = type is SwaggerEnum ||
        this is RequestBodyComponent && (this as RequestBodyComponent).isEnum ||
        this is RequestQueryComponent &&
            (this as RequestQueryComponent).isEnum ||
        this is RequestPathComponent && (this as RequestPathComponent).isEnum;

    if (isEnum && forSource) {
      return '$requiredPrefix String$requiredSuffix '
          '${getNameDeclaration()},';
    }

    final body =
        '$requiredPrefix ${type.getTypeDeclaration(fileType)}$requiredSuffix '
        '${getNameDeclaration()},';

    return body;
  }

  String getNameDeclaration() =>
      name.replaceAll(RegExp(r'[^\s\w]'), '').camelCase;
}

class RequestBodyComponent extends RequestParamComponent {
  final bool isEnum;

  RequestBodyComponent({
    required super.name,
    required super.type,
    required super.isRequired,
    this.isEnum = false,
  });
}

class RequestMultipartComponent extends RequestParamComponent {
  RequestMultipartComponent({
    required super.name,
    required super.type,
    required super.isRequired,
  });
}

class RequestQueryComponent extends RequestParamComponent {
  final bool isEnum;

  RequestQueryComponent({
    required super.name,
    required super.type,
    required super.isRequired,
    this.isEnum = false,
  });
}

class RequestPathComponent extends RequestParamComponent {
  final bool isEnum;
  RequestPathComponent({
    required super.name,
    required super.type,
    required super.isRequired,
    this.isEnum = false,
  });
}
