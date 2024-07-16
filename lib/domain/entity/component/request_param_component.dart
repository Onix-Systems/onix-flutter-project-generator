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
    DataFileType fileType,
    bool isRequiredRequestBody,
  ) {
    var requiredCopy = isRequired;
    if (isRequiredRequestBody) {
      requiredCopy = isRequiredRequestBody;
    }
    final requiredPrefix = requiredCopy ? 'required' : '';
    final requiredSuffix = requiredCopy ? '' : '?';
    return '$requiredPrefix ${type.getTypeDeclaration(fileType)}$requiredSuffix ${getNameDeclaration()},';
  }

  String getNameDeclaration() => name.camelCase;
}

class RequestBodyComponent extends RequestParamComponent {
  RequestBodyComponent({
    required super.name,
    required super.type,
    required super.isRequired,
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
  RequestQueryComponent({
    required super.name,
    required super.type,
    required super.isRequired,
  });
}

class RequestPathComponent extends RequestParamComponent {
  RequestPathComponent({
    required super.name,
    required super.type,
    required super.isRequired,
  });
}
