import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/base_swagger_path_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/swagger_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_request_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/response_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:recase/recase.dart';

class SwaggerMapper {
  List<DataObjectComponent> mapDataObjects(
    SwaggerResponse input,
    List<EnumParamComponent> enums,
  ) {
    final dataObjects = List<DataObjectComponent>.empty(growable: true);
    for (final e in input.swaggerModels) {
      if (e.variables.length == 1 && e.variables.first.type is SwaggerEnum) {
        continue;
      }
      final variables = e.variables.map(
        (variable) {
          final type = variable.type;
          final isEnum = _isEnum(type, enums);

          if (type is SwaggerArray) {
            final arrayTypeIsEnum = _isEnum(type.itemType.type, enums);

            if (arrayTypeIsEnum) {
              final enumValues = enums
                  .firstWhere(
                    (element) =>
                        element.name.pascalCase ==
                        type.itemType.type.getName().pascalCase,
                  )
                  .type
                  .enumValues;

              logger.f('enumValues: $enumValues');

              return DataVariableComponent(
                name: variable.name,
                type: SwaggerArray(
                  SwaggerModelVariableResponseV3(
                    name: type.itemType.name,
                    type: SwaggerEnum(
                      type.itemType.name,
                      enumValues,
                    ),
                    isRequired: type.itemType.isRequired,
                  ),
                ),
                isRequired: variable.isRequired,
                isEnum: isEnum,
              );
            }
          }

          return DataVariableComponent(
            name: variable.name,
            type: type,
            isRequired: variable.isRequired,
            isEnum: isEnum,
          );
        },
      ).toList();
      dataObjects.add(
        DataObjectComponent(
          name: e.name,
          fileReference: SwaggerReference(e.name),
          variables: variables,
        ),
      );
    }
    return dataObjects;
  }

  List<EnumParamComponent> mapEnums(SwaggerResponse input) {
    final enumList = List<EnumParamComponent>.empty(growable: true);
    for (final model in input.swaggerModels) {
      for (final e in model.variables) {
        final enumClass = e.type.getSwaggerEnumReference();
        if (enumClass != null) {
          enumList.add(
            EnumParamComponent(
              name: e.name,
              type: enumClass,
            ),
          );
        }
      }
    }
    return enumList;
  }

  List<SourceComponent> mapSources(
    SwaggerResponse input,
    ArchType arch,
    List<EnumParamComponent> enums,
  ) {
    final sources = List<SourceComponent>.empty(growable: true);
    if (input.swaggerTags.isEmpty) {
      final requests = _mapRequests(input.swaggerPaths, enums);
      sources.add(
        SourceComponent(
          name: 'Default',
          requests: requests,
          arch: arch,
        ),
      );
      return sources;
    }
    for (final tag in input.swaggerTags) {
      final sourceRequests =
          input.swaggerPaths.where((e) => e.primaryTag == tag.name).toList();
      final requests = _mapRequests(sourceRequests, enums);
      sources.add(
        SourceComponent(
          name: tag.name,
          requests: requests,
          arch: arch,
        ),
      );
    }
    return sources;
  }

  List<RequestComponent> _mapRequests(
    List<BaseSwaggerPathResponse> input,
    List<EnumParamComponent> enums,
  ) {
    final requests = List<RequestComponent>.empty(growable: true);
    for (final path in input) {
      final requestResponseParam = _mapResponseParams(path, enums);
      final requestBody = _mapRequestBodyParams(path);
      final multipartParams = _mapRequestMultipartParams(path);
      final queryParams = _mapRequestQueryParams(path, enums);
      final pathParams = _mapRequestPathParams(path, enums);
      final request = RequestComponent(
        path: path.path,
        type: path.type,
        description: path.description,
        operationId: path.operationId,
        response: requestResponseParam,
        requestBody: requestBody,
        multipartBody: multipartParams,
        queryParams: queryParams,
        pathParams: pathParams,
      );
      requests.add(request);
    }

    return requests;
  }

  ResponseParamComponent _mapResponseParams(
    BaseSwaggerPathResponse input,
    List<EnumParamComponent> enums,
  ) {
    final successResponse = input.getSuccessResponse();
    final isEnum = _isEnum(successResponse.variable.type, enums);
    return ResponseParamComponent(
      name: successResponse.variable.name,
      type: successResponse.variable.type,
      isRequired: successResponse.variable.isRequired,
      isEnum: isEnum,
    );
  }

  RequestBodyComponent? _mapRequestBodyParams(BaseSwaggerPathResponse input) {
    final bodyRequest = input.input.firstWhereOrNull((e) => e is RequestBody);
    if (bodyRequest != null) {
      return RequestBodyComponent(
        name: bodyRequest.variable.name,
        type: bodyRequest.variable.type,
        isRequired: bodyRequest.variable.isRequired,
      );
    }
    return null;
  }

  List<RequestMultipartComponent> _mapRequestMultipartParams(
    BaseSwaggerPathResponse input,
  ) {
    final multipartParams = input.input.whereType<RequestMultipart>();
    final paramComponents =
        List<RequestMultipartComponent>.empty(growable: true);
    for (final e in multipartParams) {
      paramComponents.add(
        RequestMultipartComponent(
          name: e.variable.name,
          type: e.variable.type,
          isRequired: e.variable.isRequired,
        ),
      );
    }
    return paramComponents;
  }

  List<RequestQueryComponent> _mapRequestQueryParams(
    BaseSwaggerPathResponse input,
    List<EnumParamComponent> enums,
  ) {
    final queryParams = input.input.whereType<RequestQuery>();
    final paramComponents = List<RequestQueryComponent>.empty(growable: true);
    for (final e in queryParams) {
      final isEnum = _isEnum(e.variable.type, enums);
      paramComponents.add(
        RequestQueryComponent(
          name: e.variable.name,
          type: e.variable.type,
          isRequired: e.variable.isRequired,
          isEnum: isEnum,
        ),
      );
    }
    return paramComponents;
  }

  List<RequestPathComponent> _mapRequestPathParams(
    BaseSwaggerPathResponse input,
    List<EnumParamComponent> enums,
  ) {
    final pathParams = input.input.whereType<RequestPath>();
    final paramComponents = List<RequestPathComponent>.empty(growable: true);
    for (final e in pathParams) {
      final isEnum = _isEnum(e.variable.type, enums);
      paramComponents.add(
        RequestPathComponent(
          name: e.variable.name,
          type: e.variable.type,
          isRequired: e.variable.isRequired,
          isEnum: isEnum,
        ),
      );
    }
    return paramComponents;
  }

  bool _isEnum(SwaggerType type, List<EnumParamComponent> enums) => enums.any(
        (element) =>
            type is SwaggerReference &&
            element.name.pascalCase == type.reference,
      );
}
