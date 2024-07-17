import 'package:onix_flutter_bricks/app/swagger_const.dart';
import 'package:recase/recase.dart';

extension VariableNameExtension on String {
  String clearDataComponentsName() {
    final cleanFromSpaces = pascalCase.replaceAll(RegExp(r"[^\s\w]"), '');
    if (cleanFromSpaces.contains(SwaggerConst.swaggerRequestKey)) {
      return cleanFromSpaces.replaceAll(SwaggerConst.swaggerRequestKey, '');
    }
    if (cleanFromSpaces.contains(SwaggerConst.swaggerResponseKey)) {
      return cleanFromSpaces.replaceAll(SwaggerConst.swaggerResponseKey, '');
    }
    if (cleanFromSpaces.contains(SwaggerConst.swaggerRequestTitleKey)) {
      return cleanFromSpaces.replaceAll(
          SwaggerConst.swaggerRequestTitleKey, '');
    }
    if (cleanFromSpaces.contains(SwaggerConst.swaggerResponseTitleKey)) {
      return cleanFromSpaces.replaceAll(
          SwaggerConst.swaggerResponseTitleKey, '');
    }
    return cleanFromSpaces;
  }

  String clearEnumComponentName() {
    final cleanFromSpaces = pascalCase.replaceAll(RegExp(r"[^\s\w]"), '');
    if (cleanFromSpaces.contains(SwaggerConst.swaggerTypeKey)) {
      return cleanFromSpaces.replaceAll(SwaggerConst.swaggerTypeKey, '');
    }
    if (cleanFromSpaces.contains(SwaggerConst.swaggerTypeTitleKey)) {
      return cleanFromSpaces.replaceAll(SwaggerConst.swaggerTypeTitleKey, '');
    }
    return cleanFromSpaces;
  }

  String clearPathToName() {
    final cleanFromSpaces =
        replaceAll('/', ' ').replaceAll(RegExp(r"[^\s\w]"), '').snakeCase;
    return cleanFromSpaces;
  }
}
