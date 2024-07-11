import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_reference_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_reference.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

part 'source_component.freezed.dart';

@freezed
class SourceComponent with _$SourceComponent {
  const SourceComponent._();

  const factory SourceComponent({
    required String name,
    required List<RequestComponent> requests,
  }) = _SourceComponent;

  String getFolderPath(String projectRoot) =>
      '$projectRoot/data/source/remote/${name.snakeCase}';

  String getRepositoryDeclarationFolderPath(String projectRoot) =>
      '$projectRoot/domain/repository/${name.snakeCase}';

  String getRepositoryImplFolderPath(String projectRoot) =>
      '$projectRoot/data/repository/${name.snakeCase}';

  String getDeclarationFilePath(String projectRoot) =>
      '${getFolderPath(projectRoot)}/${name.snakeCase}_source.dart';

  String getImplementationFilePath(String projectRoot) =>
      '${getFolderPath(projectRoot)}/${name.snakeCase}_source_impl.dart';

  String getRepoDeclarationFilePath(String projectRoot) =>
      '${getRepositoryDeclarationFolderPath(projectRoot)}/${name.snakeCase}_repository.dart';

  String getRepoImplementationFilePath(String projectRoot) =>
      '${getRepositoryImplFolderPath(projectRoot)}/${name.snakeCase}_repository_impl.dart';

  String getDeclarationImport(String projectName) =>
      'import \'package:$projectName/data/source/remote/${name.snakeCase}/${name.snakeCase}_source.dart\';';

  String getImplementationImport(String projectName) =>
      'import \'package:$projectName/data/source/remote/${name.snakeCase}/${name.snakeCase}_source_impl.dart\';';

  String getRepoDeclarationImport(String projectName) =>
      'import \'package:$projectName/domain/repository/${name.snakeCase}/${name.snakeCase}_repository.dart\';';

  String getRepoImplementationImport(String projectName) =>
      'import \'package:$projectName/data/repository/${name.snakeCase}/${name.snakeCase}_repository_impl.dart\';';

  String getDeclarationBody(String projectName) {
    final codeLines = List<String>.empty(growable: true);
    codeLines.add('import \'package:dio/dio.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/domain/entity/common/data_response.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/domain/entity/common/operation_status.dart\';');

    ///Add Imports
    final modelImports = _buildSourceImports(projectName);
    codeLines.add(modelImports);

    codeLines.addNewLine();
    codeLines.add('abstract interface class ${name.pascalCase}Source {');
    codeLines.addNewLine();
    for (var e in requests) {
      codeLines.add(e.getRequestDeclaration());
      codeLines.addNewLine();
    }
    codeLines.add('}');
    codeLines.addNewLine();
    return codeLines.join('\n');
  }

  String getImplementationBody(String projectName) {
    final codeLines = List<String>.empty(growable: true);
    codeLines.add(
        'import \'package:$projectName/core/arch/data/remote/clients/dio/api_client.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/domain/entity/common/operation_status.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/data/remote/clients/dio/dio_request_processor/dio_request_processor.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/domain/entity/common/data_response.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/domain/entity/common/operation_status.dart\';');
    codeLines.add('import \'package:dio/dio.dart\';');
    codeLines.add(
        'import \'package:$projectName/data/source/remote/${name.snakeCase}/${name.snakeCase}_source.dart\';');

    ///Add imports
    final modelImports = _buildSourceImports(projectName);
    codeLines.add(modelImports);

    codeLines.add(
        'class ${name.pascalCase}SourceImpl implements ${name.pascalCase}Source {');
    codeLines.addNewLine();
    for (var e in requests) {
      codeLines.add(e.getVariableDeclaration());
    }
    codeLines.addNewLine();
    codeLines.add('final ApiClient _apiClient;');
    codeLines.add('final DioRequestProcessor _dioRequestProcessor;');
    codeLines.addNewLine();
    codeLines.add(
        'const ${name.pascalCase}SourceImpl(this._apiClient, this._dioRequestProcessor);');
    codeLines.addNewLine();
    for (var e in requests) {
      codeLines.add(e.getRequestBody());
      codeLines.addNewLine();
    }
    codeLines.addNewLine();
    codeLines.add('}');
    codeLines.addNewLine();
    return codeLines.join('\n');
  }

  String getRepoDeclarationBody(String projectName) {
    final codeLines = List<String>.empty(growable: true);
    codeLines.add(
        'import \'package:$projectName/core/arch/domain/entity/common/result.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/domain/entity/common/operation_status.dart\';');
    final modelImports = _buildRepositoryImports(projectName);
    codeLines.add(modelImports);
    codeLines.add('abstract interface class ${name.pascalCase}Repository {');
    codeLines.addNewLine();
    for (var e in requests) {
      codeLines.add(e.getRepoDeclarationBody());
      codeLines.addNewLine();
    }

    codeLines.add('}');
    codeLines.addNewLine();
    return codeLines.join('\n');
  }

  String getRepoImplementationBody(String projectName) {
    final codeLines = List<String>.empty(growable: true);
    codeLines.add(
        'import \'package:$projectName/core/arch/domain/entity/common/result.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/domain/entity/common/operation_status.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/domain/entity/failure/api_failure.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/logger/app_logger_impl.dart\';');
    codeLines.add(
        'import \'package:$projectName/core/arch/data/remote/base/map_common_server_error.dart\';');
    final modelImports = _buildRepositoryImports(projectName);
    codeLines.add(modelImports);
    codeLines.add(getRepoDeclarationImport(projectName));
    codeLines.add(getDeclarationImport(projectName));

    ///Get imports for request object mappers
    final mapperImports = List<String>.empty(growable: true);
    for (var e in requests) {
      final requestBody = e.requestBody;

      ///Add request body import
      if (requestBody != null) {
        if (requestBody.type is SwaggerReference) {
          final importLine =
              (requestBody.type as SwaggerReference).getReferenceMapperImport(
            projectName,
          );
          if (!mapperImports.contains(importLine)) {
            mapperImports.add(importLine);
          }
        }
      }

      ///Add response mapper import
      if (e.response.type is SwaggerReference) {
        final importLine =
            (e.response.type as SwaggerReference).getReferenceMapperImport(
          projectName,
        );
        if (!mapperImports.contains(importLine)) {
          mapperImports.add(importLine);
        }
      }
    }

    codeLines.addAll(mapperImports);
    codeLines.add(
        'class ${name.pascalCase}RepositoryImpl implements ${name.pascalCase}Repository {');
    codeLines.add('final ${name.pascalCase}Source _${name.camelCase}Source;');

    ///Declare mappers for request objects
    final mapperVariables = List<String>.empty(growable: true);
    for (var e in requests) {
      final requestBody = e.requestBody;
      if (requestBody != null) {
        if (requestBody.type is SwaggerReference) {
          final mapperVariable = (requestBody.type as SwaggerReference)
              .getReferenceMapperDeclaration();
          if (!mapperVariables.contains(mapperVariable)) {
            mapperVariables.add(mapperVariable);
          }
        }
      }

      ///Add response variable declaration
      if (e.response.type is SwaggerReference) {
        final mapperVariable = (e.response.type as SwaggerReference)
            .getReferenceMapperDeclaration();
        if (!mapperVariables.contains(mapperVariable)) {
          mapperVariables.add(mapperVariable);
        }
      }
    }
    codeLines.addAll(mapperVariables);

    codeLines.add(
        '${name.pascalCase}RepositoryImpl(this._${name.camelCase}Source);');

    codeLines.addNewLine();
    for (var e in requests) {
      codeLines.add(e.getRepoImplementationBody(name.camelCase));
      codeLines.addNewLine();
    }

    codeLines.add('}');
    codeLines.addNewLine();
    return codeLines.join('\n');
  }

  String _buildSourceImports(String projectName) {
    final imports = List<String>.empty(growable: true);
    for (var request in requests) {
      ///build response imports
      ///Add response body import
      final responseFileImport =
          request.response.type.getFileImportName(DataFileType.response);
      if (responseFileImport != null && !imports.contains(responseFileImport)) {
        imports.add(responseFileImport);
      }

      ///Add request body import
      if (request.requestBody != null) {
        final bodyImport =
            request.requestBody?.type.getFileImportName(DataFileType.request);
        if (bodyImport != null && !imports.contains(bodyImport)) {
          imports.add(bodyImport);
        }
      }

      ///Add path params imports
      if (request.pathParams.isNotEmpty) {
        for (var e in request.pathParams) {
          final import = e.type.getFileImportName(DataFileType.request);
          if (import != null && !imports.contains(import)) {
            imports.add(import);
          }
        }
      }

      ///Add query params imports
      if (request.queryParams.isNotEmpty) {
        for (var e in request.queryParams) {
          final import = e.type.getFileImportName(DataFileType.request);
          if (import != null && !imports.contains(import)) {
            imports.add(import);
          }
        }
      }

      ///Add multipart params imports
      if (request.multipartBody.isNotEmpty) {
        for (var e in request.multipartBody) {
          final import = e.type.getFileImportName(DataFileType.request);
          if (import != null && !imports.contains(import)) {
            imports.add(import);
          }
        }
      }
    }
    return imports.map((e) => 'import \'package:$projectName/$e\';').join('\n');
  }

  String _buildRepositoryImports(String projectName) {
    final imports = List<String>.empty(growable: true);
    for (var request in requests) {
      ///build response imports
      ///Add response body import
      final responseFileImport =
          request.response.type.getFileImportName(DataFileType.entity);
      if (responseFileImport != null && !imports.contains(responseFileImport)) {
        imports.add(responseFileImport);
      }

      ///Add request body import
      if (request.requestBody != null) {
        final bodyImport =
            request.requestBody?.type.getFileImportName(DataFileType.entity);
        if (bodyImport != null && !imports.contains(bodyImport)) {
          imports.add(bodyImport);
        }
      }

      ///Add path params imports
      if (request.pathParams.isNotEmpty) {
        for (var e in request.pathParams) {
          final import = e.type.getFileImportName(DataFileType.entity);
          if (import != null && !imports.contains(import)) {
            imports.add(import);
          }
        }
      }

      ///Add query params imports
      if (request.queryParams.isNotEmpty) {
        for (var e in request.queryParams) {
          final import = e.type.getFileImportName(DataFileType.entity);
          if (import != null && !imports.contains(import)) {
            imports.add(import);
          }
        }
      }

      ///Add multipart params imports
      if (request.multipartBody.isNotEmpty) {
        for (var e in request.multipartBody) {
          final import = e.type.getFileImportName(DataFileType.entity);
          if (import != null && !imports.contains(import)) {
            imports.add(import);
          }
        }
      }
    }
    return imports.map((e) => 'import \'package:$projectName/$e\';').join('\n');
  }

  ///Get related object used in source requests (request and response objects)
  List<DataObjectReference> getSourceObjects() {
    final components = List<DataObjectReference>.empty(growable: true);
    for (var request in requests) {
      ///Response object component
      final responseFileType = request.response.type;
      final reference = responseFileType.getSwaggerObjectReference();
      if (reference != null) {
        components.add(
          DataObjectReference(
            type: DataFileType.response,
            fileReference: reference,
          ),
        );
      }

      ///Request body component
      if (request.requestBody != null) {
        final requestFileType = request.requestBody!.type;
        final reference = requestFileType.getSwaggerObjectReference();
        if (reference != null) {
          components.add(
            DataObjectReference(
              type: DataFileType.request,
              fileReference: reference,
            ),
          );
        }
      }
      //Other params
      if (request.multipartBody.isNotEmpty) {
        for (var e in request.multipartBody) {
          final reference = e.type.getSwaggerObjectReference();
          if (reference != null) {
            components.add(
              DataObjectReference(
                type: DataFileType.request,
                fileReference: reference,
              ),
            );
          }
        }
      }
      if (request.pathParams.isNotEmpty) {
        for (var e in request.pathParams) {
          final reference = e.type.getSwaggerObjectReference();
          if (reference != null) {
            components.add(
              DataObjectReference(
                type: DataFileType.request,
                fileReference: reference,
              ),
            );
          }
        }
      }
      if (request.queryParams.isNotEmpty) {
        for (var e in request.queryParams) {
          final reference = e.type.getSwaggerObjectReference();
          if (reference != null) {
            components.add(
              DataObjectReference(
                type: DataFileType.request,
                fileReference: reference,
              ),
            );
          }
        }
      }
    }
    return components;
  }
}
