import 'package:onix_flutter_bricks/app/util/enum/swagger_version_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/swagger_model_response_unsupported.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/swagger_model_response_v2.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/swagger_model_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';

abstract class BaseSwaggerModelResponse {
  final String name;
  final String type;
  final List<BaseSwaggerModelVariableResponse> variables;

  BaseSwaggerModelResponse({
    required this.name,
    required this.type,
    required this.variables,
  });

  factory BaseSwaggerModelResponse.fromJson(
    SwaggerVersionType swaggerVersion,
    String rawModelName,
    ArchType arch,
    Map<String, dynamic> json,
    Map<String, dynamic> allObjects,
  ) {
    switch (swaggerVersion) {
      case SwaggerVersionType.swagger2:
        return SwaggerModelResponseV2.fromJson(rawModelName, arch, json);
      case SwaggerVersionType.swagger3:
        return SwaggerModelResponseV3.fromJson(
            rawModelName, arch, json, allObjects);

      case SwaggerVersionType.unsupported:
        return SwaggerModelResponseUnsupported.unsupported();
    }
  }

  @override
  String toString() {
    final variablesString = variables.map((e) => e.toString()).join('\n');
    return 'class $name\n $variablesString';
  }
}
