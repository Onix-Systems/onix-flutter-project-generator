import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/enum/swagger_path_request_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/response_param_component.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

part 'request_component.freezed.dart';

@freezed
class RequestComponent with _$RequestComponent {
  const RequestComponent._();

  const factory RequestComponent({
    required String operationId,
    required String path,
    required SwaggerPathRequestType type,
    required String description,
    required RequestBodyComponent? requestBody,
    required List<RequestMultipartComponent> multipartBody,
    required List<RequestQueryComponent> queryParams,
    required List<RequestPathComponent> pathParams,
    required ResponseParamComponent response,
  }) = _RequestComponent;

  bool hasInputParameters() {
    return requestBody != null ||
        multipartBody.isNotEmpty ||
        queryParams.isNotEmpty ||
        pathParams.isNotEmpty;
  }

  ///Write REST API ath declaration
  String getVariableDeclaration() {
    /// If there pathParams - build declaration as functions and
    /// pass params into the path
    if (pathParams.isNotEmpty) {
      final codeLines = List<String>.empty(growable: true);
      final paramsDeclaration = pathParams
          .map(
            (e) => e.getParamBodyDeclaration(
              DataFileType.request,
              true,
            ),
          )
          .join('\n');
      codeLines
          .add('String _${operationId.camelCase}({$paramsDeclaration}) =>');
      final names = pathParams.map((e) => e.name);
      var pathWithParams = path;
      for (final e in names) {
        pathWithParams = pathWithParams.replaceAll('{$e}', '\$${e.camelCase}');
      }
      codeLines.add("'$pathWithParams';");
      return codeLines.join('\n');
    }

    ///Build regular declaration
    return "static const  _${operationId.camelCase} = '$path';";
  }

  ///Create declaration for request in source interface
  String getRequestDeclaration() {
    final codeLines = List<String>.empty(growable: true);
    final responseType =
        response.type.getTypeDeclaration(DataFileType.response);

    codeLines
        .add('Future<DataResponse<$responseType>> ${operationId.camelCase}(');

    ///Create function input params
    final functionParams = _buildFunctionParams(DataFileType.request);
    if (functionParams.isNotEmpty) {
      codeLines.add('{');
    }
    codeLines.add(functionParams);
    if (functionParams.isNotEmpty) {
      codeLines.add('}');
    }
    codeLines.add(');');
    return codeLines.join('\n');
  }

  ///Create request function for source implementation
  String getRequestBody() {
    final codeLines = List<String>.empty(growable: true);
    final responseType =
        response.type.getTypeDeclaration(DataFileType.response);
    final responseClosure =
        response.type.getDefaultParserClosure(DataFileType.response);
    codeLines
      ..addAll(_descriptionArray())

      ///Function start
      ..add('@override')

      ///Declare a new function
      ..add(
        'Future<DataResponse<$responseType>> ${operationId.camelCase}(',
      );

    ///Create function input params
    final functionParams = _buildFunctionParams(DataFileType.request);
    if (functionParams.isNotEmpty) {
      codeLines.add('{');
    }
    codeLines.add(functionParams);
    if (functionParams.isNotEmpty) {
      codeLines.add('}');
    }
    codeLines.add(') async {');

    ///If multipart params not empty - create multipart parameter variables
    if (multipartBody.isNotEmpty) {
      final multipartFiles = multipartBody.where(
        (e) => e.type is SwaggerFile,
      );
      for (final e in multipartFiles) {
        codeLines.add(
            'final ${e.getNameDeclaration()}MultipartFile = await MultipartFile.fromFile(${e.getNameDeclaration()});');
      }

      ///create form data
      codeLines.add('final formData = FormData.fromMap({');
      for (final e in multipartBody) {
        if (e.type is SwaggerFile) {
          codeLines.add("'${e.name}': ${e.getNameDeclaration()}MultipartFile,");
        } else {
          codeLines.add("'${e.name}': ${e.getNameDeclaration()},");
        }
      }
      codeLines..add('},);')
      ..addNewLine();
    }

    ///If query params not empty - create query parameter variables
    if (queryParams.isNotEmpty) {
      codeLines.add('final queryParams = {');
      for (final e in queryParams) {
        codeLines.add("'${e.name}': ${e.getNameDeclaration()},");
      }
      codeLines..add('};')
      ..addNewLine();
    }

    ///If create a new request
    codeLines.add('final request = _apiClient.client.${type.name}(');

    ///Get request URL path
    if (pathParams.isNotEmpty) {
      ///f path params exist call request Url declaration as function with params
      final paramsDeclaration = pathParams
          .map((e) => '${e.getNameDeclaration()}: ${e.getNameDeclaration()},')
          .join('\n');
      codeLines.add('_${operationId.camelCase}($paramsDeclaration),');
    } else {
      codeLines.add('_${operationId.camelCase},');
    }

    ///Add request body, if exist
    if (requestBody != null) {
      final isObjectReference = requestBody!.type.isObjectReference();
      if (isObjectReference) {
        final requestBodyType = requestBody!.type;
        if (requestBodyType is SwaggerArray) {
          codeLines.add(
              'data: ${requestBody!.name.camelCase}.map((e)=> e.toJson()),');
        } else {
          codeLines.add('data: ${requestBody!.name.camelCase}.toJson(),');
        }
      } else {
        codeLines.add('data: ${requestBody!.name.camelCase},');
      }

      ///Add multipart body, if exist
    } else if (multipartBody.isNotEmpty) {
      codeLines.add('data: formData,');
    }

    ///Add query parameters, if exist
    if (queryParams.isNotEmpty) {
      codeLines.add('queryParameters: queryParams,');
    }
    codeLines
      ..add(');')

      ///End request build
      ..addNewLine()

      ///Call dio request processor
      ..add('return _dioRequestProcessor.processRequest(')
      ..add('onRequest: () => request,')
      ..add('onResponse: (response) {')
      ..add(responseClosure)
      ..add('},);}');

    return codeLines.join('\n');
  }

  String getRepoDeclarationBody() {
    final codeLines = List<String>.empty(growable: true);
    final returnType = response.type.getTypeDeclaration(DataFileType.entity);
    codeLines
      ..addAll(_descriptionArray())
      ..add('Future<Result<$returnType>> ${operationId.camelCase}(');

    ///Create function input params
    final functionParams = _buildFunctionParams(DataFileType.entity);
    if (functionParams.isNotEmpty) {
      codeLines.add('{');
    }
    codeLines.add(functionParams);
    if (functionParams.isNotEmpty) {
      codeLines.add('}');
    }
    codeLines.add(');');
    return codeLines.join('\n');
  }

  String getRepoImplementationBody(String repoName) {
    final returnType = response.type.getTypeDeclaration(DataFileType.entity);
    final codeLines = List<String>.empty(growable: true)
      ..add('@override')
      ..addAll(_descriptionArray())
      ..add('Future<Result<$returnType>> ${operationId.camelCase}(');

    ///Create function input params
    final functionParams = _buildFunctionParams(DataFileType.entity);
    if (functionParams.isNotEmpty) {
      codeLines.add('{');
    }
    codeLines.add(functionParams);
    if (functionParams.isNotEmpty) {
      codeLines.add('}');
    }
    codeLines
      ..add(') async {')
      ..add('try {');
    if (requestBody != null) {
      if (requestBody!.type is SwaggerReference) {
        final body = requestBody!.type as SwaggerReference;
        final requestBodyType = body.getTypeDeclaration(DataFileType.none);
        final requestBodyName = requestBody!.getNameDeclaration();
        codeLines.add(
          'final ${requestBodyType.camelCase}RequestBody = _${requestBodyType.camelCase}Mappers.mapEntityToRequest($requestBodyName);',
        );
      } else if (requestBody!.type is SwaggerArray) {
        final array = requestBody!.type as SwaggerArray;
        if (array.itemType.type is SwaggerReference) {
          final ref = array.itemType.type as SwaggerReference;
          final requestBodyName = requestBody!.getNameDeclaration();
          final requestBodyType = ref.getTypeDeclaration(DataFileType.none);
          codeLines.add(
            'final ${requestBodyType.camelCase}RequestBody = $requestBodyName.map(_${requestBodyType.camelCase}Mappers.mapEntityToRequest,).toList();',
          );
        }
      }
    }
    codeLines.add(
        'final result = await _${repoName}Source.${operationId.camelCase}(');
    //TODO
    final sourceCallParams = _buildSourceCallParams(DataFileType.none);
    codeLines
      ..add(sourceCallParams)
      ..add(');')
      ..addNewLine()
      ..add('if (result.isSuccess()) {');
    if (response.type is SwaggerReference) {
      final ref = response.type as SwaggerReference;
      final responseName = ref.getTypeDeclaration(DataFileType.none).camelCase;
      codeLines
        ..add(
          'final ${responseName}Object = _${responseName}Mappers.mapResponseToEntity(result.data);',
        )
        ..add('return Result.success(${responseName}Object);');
    } else if (response.type is SwaggerArray) {
      final array = response.type as SwaggerArray;
      if (array.itemType.type is SwaggerReference) {
        final ref = array.itemType.type as SwaggerReference;
        final responseName =
            ref.getTypeDeclaration(DataFileType.none).camelCase;
        codeLines
          ..add(
            'final ${responseName}Objects = result.data.map(_${responseName}Mappers.mapResponseToEntity,).toList();',
          )
          ..add('return Result.success(${responseName}Objects);');
      } else {
        codeLines.add('return Result.success(result.data);');
      }
    } else {
      codeLines.add('return Result.success(result.data);');
    }
    codeLines
      ..add('} else {')
      ..add(
        'return Result.error(failure: MapCommonServerError.getServerFailureDetails(result),);',
      )
      ..add('}')
      ..add('} catch (e, trace) {')
      ..add(
        "logger.crash(reason: '${operationId.camelCase}', error: e, stackTrace: trace,);",
      )
      ..add('return Result.error(')
      ..add('failure: ApiFailure(')
      ..add('ServerFailure.exception,')
      ..add('message: e.toString(),')
      ..add('),);}')
      ..add('}');
    return codeLines.join('\n');
  }

  ///Build function input parameters
  String _buildFunctionParams(DataFileType fileType) {
    final codeLines = List<String>.empty(growable: true);
    if (requestBody != null) {
      codeLines.add(
        requestBody?.getParamBodyDeclaration(
              fileType,
              true,
            ) ??
            '',
      );
    }
    if (multipartBody.isNotEmpty) {
      for (final e in multipartBody) {
        codeLines.add(
          e.getParamBodyDeclaration(
            fileType,
            true,
          ),
        );
      }
    }
    if (queryParams.isNotEmpty) {
      for (final e in queryParams) {
        codeLines.add(
          e.getParamBodyDeclaration(
            fileType,
            false,
          ),
        );
      }
    }
    if (pathParams.isNotEmpty) {
      for (final e in pathParams) {
        codeLines.add(
          e.getParamBodyDeclaration(
            fileType,
            false,
          ),
        );
      }
    }
    return codeLines.join('\n');
  }

  String _buildSourceCallParams(DataFileType fileType) {
    final codeLines = List<String>.empty(growable: true);
    if (requestBody != null) {
      final body = requestBody!;
      final requestBodyName = body.getNameDeclaration();
      final isObjectReference = requestBody!.type.isObjectReference();
      if (isObjectReference) {
        final ref = body.type.getSwaggerObjectReference();
        if (ref != null) {
          final requestBodyType = ref.getTypeDeclaration(
            DataFileType.none,
          );
          codeLines.add(
            '$requestBodyName: ${requestBodyType.camelCase}RequestBody,',
          );
        }
      } else {
        codeLines.add('$requestBodyName: ${requestBody!.name.camelCase},');
      }
    }
    if (multipartBody.isNotEmpty) {
      for (final e in multipartBody) {
        codeLines.add('${e.getNameDeclaration()}: ${e.getNameDeclaration()},');
      }
    }
    if (queryParams.isNotEmpty) {
      for (final e in queryParams) {
        codeLines.add('${e.getNameDeclaration()}: ${e.getNameDeclaration()},');
      }
    }
    if (pathParams.isNotEmpty) {
      for (final e in pathParams) {
        codeLines.add('${e.getNameDeclaration()}: ${e.getNameDeclaration()},');
      }
    }
    return codeLines.join('\n');
  }

  List<String> _descriptionArray() {
    if (description.isEmpty) return <String>[];

    final formattedArray = <String>[];
    final descriptionArray = description.replaceAll('///', '').split('\n');

    for (final desc in descriptionArray) {
      if (desc.isEmpty) {
        continue;
      }

      formattedArray.add('/// $desc');
    }

    return formattedArray;
  }
}
