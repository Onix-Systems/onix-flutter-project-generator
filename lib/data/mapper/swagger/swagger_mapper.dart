import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/base_swagger_path_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/swagger_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_request_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/response_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';

class SwaggerMapper {
  List<DataObjectComponent> mapDataObjects(SwaggerResponse input) {
    final dataObjects = List<DataObjectComponent>.empty(growable: true);
    for (var e in input.swaggerModels) {
      final variables = e.variables
          .map(
            (variable) => DataVariableComponent(
              name: variable.name,
              type: variable.type,
              isRequired: variable.isRequired,
            ),
          )
          .toList();
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
    for (var model in input.swaggerModels) {
      for (var e in model.variables) {
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

  List<SourceComponent> mapSources(SwaggerResponse input) {
    final sources = List<SourceComponent>.empty(growable: true);
    for (var tag in input.swaggerTags) {
      final sourceRequests =
          input.swaggerPaths.where((e) => e.primaryTag == tag.name).toList();
      final requests = _mapRequests(sourceRequests);
      sources.add(
        SourceComponent(
          name: tag.name,
          requests: requests,
        ),
      );
    }
    return sources;
  }

  List<RequestComponent> _mapRequests(List<BaseSwaggerPathResponse> input) {
    final requests = List<RequestComponent>.empty(growable: true);
    for (var path in input) {
      final requestResponseParam = _mapResponseParams(path);
      final requestBody = _mapRequestBodyParams(path);
      final multipartParams = _mapRequestMultipartParams(path);
      final queryParams = _mapRequestQueryParams(path);
      final pathParams = _mapRequestPathParams(path);
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

  ResponseParamComponent _mapResponseParams(BaseSwaggerPathResponse input) {
    final successResponse = input.getSuccessResponse();
    return ResponseParamComponent(
      name: successResponse.variable.name,
      type: successResponse.variable.type,
      isRequired: successResponse.variable.isRequired,
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
    for (var e in multipartParams) {
      paramComponents.add(
        RequestMultipartComponent(
            name: e.variable.name,
            type: e.variable.type,
            isRequired: e.variable.isRequired),
      );
    }
    return paramComponents;
  }

  List<RequestQueryComponent> _mapRequestQueryParams(
    BaseSwaggerPathResponse input,
  ) {
    final queryParams = input.input.whereType<RequestQuery>();
    final paramComponents = List<RequestQueryComponent>.empty(growable: true);
    for (var e in queryParams) {
      paramComponents.add(
        RequestQueryComponent(
            name: e.variable.name,
            type: e.variable.type,
            isRequired: e.variable.isRequired),
      );
    }
    return paramComponents;
  }

  List<RequestPathComponent> _mapRequestPathParams(
    BaseSwaggerPathResponse input,
  ) {
    final pathParams = input.input.whereType<RequestPath>();
    final paramComponents = List<RequestPathComponent>.empty(growable: true);
    for (var e in pathParams) {
      paramComponents.add(
        RequestPathComponent(
            name: e.variable.name,
            type: e.variable.type,
            isRequired: e.variable.isRequired),
      );
    }
    return paramComponents;
  }
}
