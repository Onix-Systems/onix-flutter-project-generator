import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/app/swagger_const.dart';
import 'package:onix_flutter_bricks/app/util/enum/swagger_path_request_type.dart';
import 'package:onix_flutter_bricks/app/util/enum/swagger_version_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/swagger_path_response_unsupported.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/swagger_path_response_v2.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/swagger_path_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_request_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_response_type.dart';
import 'package:onix_flutter_bricks/domain/entity/arch/arch.dart';

abstract class BaseSwaggerPathResponse {
  final String path;
  final SwaggerPathRequestType type;
  final String primaryTag;
  final String description;
  final String operationId;
  final List<SwaggerRequestType> input;
  final List<SwaggerResponseType> output;

  BaseSwaggerPathResponse({
    required this.path,
    required this.type,
    required this.primaryTag,
    required this.description,
    required this.operationId,
    required this.input,
    required this.output,
  });

  factory BaseSwaggerPathResponse.fromJson(
    SwaggerVersionType swaggerVersion,
    String path,
    String type,
    Arch arch,
    Map<String, dynamic> json,
  ) {
    switch (swaggerVersion) {
      case SwaggerVersionType.swagger2:
        return SwaggerPathResponseV2.fromJson(path, type, arch, json);
      case SwaggerVersionType.swagger3:
        return SwaggerPathResponseV3.fromJson(path, type, arch, json);
      case SwaggerVersionType.unsupported:
        return SwaggerPathResponseUnsupported.unsupported();
    }
  }

  SwaggerResponseType getSuccessResponse() {
    final successCodeResponse = output.firstWhereOrNull(
      (e) => SwaggerConst.swaggerSuccessCodes.contains(e.variable.name),
    );
    if (successCodeResponse != null) {
      return successCodeResponse;
    }
    final defaultResponse = output.firstWhereOrNull(
      (e) => e.variable.name == 'default',
    );
    if (defaultResponse != null) {
      return defaultResponse;
    }
    return SwaggerResponseType(
      BaseSwaggerModelVariableResponse.dynamicDefault(),
    );
  }

  @override
  String toString() {
    final inputString = input.map((e) => e.toString()).join('\n');
    final responseString = output.map((e) => e.toString()).join('\n');
    return '----Swagger Request----\npath: $path\n${type.name}\n$primaryTag\n$description\n --Input Parameters--\n $inputString\n --Response Parameters--\n $responseString ';
  }
}
