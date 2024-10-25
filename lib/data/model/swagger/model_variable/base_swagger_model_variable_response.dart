import 'package:flutter/foundation.dart';
import 'package:onix_flutter_bricks/app/swagger_const.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/enum/swagger_version_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_default.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_unsupported.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v2.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/arch/arch_type.dart';

abstract class BaseSwaggerModelVariableResponse {
  final String name;
  final SwaggerType type;
  final bool isRequired;

  BaseSwaggerModelVariableResponse({
    required this.name,
    required this.type,
    required this.isRequired,
  });

  factory BaseSwaggerModelVariableResponse.fromJson(
    SwaggerVersionType swaggerVersion,
    String name,
    ArchType arch,
    List<String> requiredVariables,
    Map<String, dynamic> json,
    String from,
  ) {
    switch (swaggerVersion) {
      case SwaggerVersionType.swagger2:
        return SwaggerModelVariableResponseV2.fromJson(
          name,
          requiredVariables,
          arch,
          json,
          from,
        );
      case SwaggerVersionType.swagger3:
        return SwaggerModelVariableResponseV3.fromJson(
          name,
          requiredVariables,
          arch,
          json,
          from,
        );
      case SwaggerVersionType.unsupported:
        return SwaggerModelVariableResponseUnsupported.unsupported();
    }
  }

  factory BaseSwaggerModelVariableResponse.dynamicDefault() {
    return SwaggerModelVariableResponseDefault.dynamicDefault();
  }

  String getTypeDeclaration(DataFileType fileType) =>
      type.getTypeDeclaration(fileType);

  @override
  String toString() {
    final typeSuffix = isRequired ? '' : '?';
    return '$type$typeSuffix $name';
  }

  @protected
  static SwaggerType parseSimpleType(
    String name,
    String from,
    ArchType arch,
    List<String> requiredVariables,
    Map<String, dynamic> json,
  ) {
    final typeValue = json['type'];
    if (typeValue == 'file') {
      return SwaggerFile();
    } else if (typeValue == 'array') {
      final arrayVariable = SwaggerModelVariableResponseV2.fromJson(
        name,
        requiredVariables,
        arch,
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
}
