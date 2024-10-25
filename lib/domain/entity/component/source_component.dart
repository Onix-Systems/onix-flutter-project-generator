import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_reference_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/domain/entity/arch/arch_type.dart';
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
    required ArchType arch,
  }) = _SourceComponent;

  String getFolderPath(String projectRoot) =>
      '$projectRoot/data/source/remote/${name.snakeCase}';

  String getRepositoryDeclarationFolderPath(String projectRoot) =>
      arch == ArchType.clean
          ? '$projectRoot/domain/repository/${name.snakeCase}'
          : '$projectRoot/data/repository/${name.snakeCase}';

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
      "import 'package:$projectName/data/source/remote/${name.snakeCase}/${name.snakeCase}_source.dart';";

  String getImplementationImport(String projectName) =>
      "import 'package:$projectName/data/source/remote/${name.snakeCase}/${name.snakeCase}_source_impl.dart';";

  String getRepoDeclarationImport(String projectName) => arch == ArchType.clean
      ? "import 'package:$projectName/domain/repository/${name.snakeCase}/${name.snakeCase}_repository.dart';"
      : "import 'package:$projectName/data/repository/${name.snakeCase}/${name.snakeCase}_repository.dart';";

  String getRepoImplementationImport(String projectName) =>
      "import 'package:$projectName/data/repository/${name.snakeCase}/${name.snakeCase}_repository_impl.dart';";

  String getSourceDeclarationBody(String projectName) {
    final codeLines = List<String>.empty(growable: true);

    ///Add Imports
    final modelImports = _buildSourceImports(projectName);
    codeLines
      ..add(modelImports)
      ..addNewLine()
      ..add('abstract interface class ${name.pascalCase}Source {')
      ..addNewLine();
    for (final e in requests) {
      codeLines
        ..add(e.getRequestDeclaration())
        ..addNewLine();
    }
    codeLines
      ..add('}')
      ..addNewLine();
    return codeLines.join('\n');
  }

  String getSourceImplementationBody(String projectName) {
    final codeLines = List<String>.empty(growable: true)
      ..add("import 'package:dio/dio.dart';")
      ..add(
        "import 'package:$projectName/data/source/remote/${name.snakeCase}/${name.snakeCase}_source.dart';",
      );

    ///Add imports
    final modelImports = _buildSourceImports(projectName);
    codeLines
      ..add(modelImports)
      ..add(
        'class ${name.pascalCase}SourceImpl implements ${name.pascalCase}Source {',
      )
      ..addNewLine();
    for (final e in requests) {
      codeLines.add(e.getVariableDeclaration());
    }
    codeLines
      ..addNewLine()
      ..add('final ApiClient _apiClient;')
      ..add('final DioRequestProcessor _dioRequestProcessor;')
      ..addNewLine()
      ..add(
        'const ${name.pascalCase}SourceImpl(this._apiClient, this._dioRequestProcessor,);',
      )
      ..addNewLine();
    for (final e in requests) {
      codeLines
        ..add(e.getRequestBody())
        ..addNewLine();
    }
    codeLines
      ..addNewLine()
      ..add('}')
      ..addNewLine();
    return codeLines.join('\n');
  }

  String getRepoDeclarationBody(String projectName) {
    final codeLines = List<String>.empty(growable: true);
    final modelImports = _buildRepositoryImports(projectName);
    codeLines
      ..add(modelImports)
      ..add('abstract interface class ${name.pascalCase}Repository {')
      ..addNewLine();
    for (final e in requests) {
      codeLines
        ..add(e.getRepoDeclarationBody())
        ..addNewLine();
    }

    codeLines
      ..add('}')
      ..addNewLine();
    return codeLines.join('\n');
  }

  String getRepoImplementationBody(String projectName, ArchType arch) {
    final codeLines = <String>{};
    final modelImports = _buildRepositoryImports(projectName);
    codeLines
      ..add(
        "import 'package:$projectName/${arch.getLoggerPath()}';",
      )
      ..add(modelImports)
      ..add(getRepoDeclarationImport(projectName))
      ..add(getDeclarationImport(projectName));

    ///Get imports for request object mappers
    final mapperImports = List<String>.empty(growable: true);
    for (final e in requests) {
      final requestBody = e.requestBody;

      ///Add request body import
      if (requestBody != null) {
        final requestReference = requestBody.type.getSwaggerObjectReference();
        if (requestReference != null) {
          final importLine =
              requestReference.getReferenceMapperImport(projectName, arch);
          if (!mapperImports.contains(importLine)) {
            mapperImports.add(importLine);
          }
        }
      }

      ///Add response mapper import
      final responseReference = e.response.type.getSwaggerObjectReference();
      if (responseReference != null) {
        final importLine =
            responseReference.getReferenceMapperImport(projectName, arch);
        if (!mapperImports.contains(importLine)) {
          mapperImports.add(importLine);
        }
      }
    }

    codeLines
      ..addAll(mapperImports)
      ..add(
        'class ${name.pascalCase}RepositoryImpl implements ${name.pascalCase}Repository {',
      )
      ..add('final ${name.pascalCase}Source _${name.camelCase}Source;');

    ///Declare mappers for request objects
    final mapperVariables = List<String>.empty(growable: true);
    for (final e in requests) {
      final requestBody = e.requestBody;
      if (requestBody != null) {
        final requestReference = requestBody.type.getSwaggerObjectReference();
        if (requestReference != null) {
          final mapperVariable =
              requestReference.getReferenceMapperDeclaration();
          if (!mapperVariables.contains(mapperVariable)) {
            mapperVariables.add(mapperVariable);
          }
        }
      }

      ///Add response variable declaration
      final responseReference = e.response.type.getSwaggerObjectReference();
      if (responseReference != null) {
        final mapperVariable =
            responseReference.getReferenceMapperDeclaration();
        if (!mapperVariables.contains(mapperVariable)) {
          mapperVariables.add(mapperVariable);
        }
      }
    }
    codeLines
      ..addAll(mapperVariables)
      ..add('${name.pascalCase}RepositoryImpl(this._${name.camelCase}Source,);')
      ..addNewLine();
    for (final e in requests) {
      codeLines
        ..add(e.getRepoImplementationBody(name.camelCase))
        ..addNewLine();
    }

    codeLines
      ..add('}')
      ..addNewLine();
    return codeLines.join('\n');
  }

  String _buildSourceImports(String projectName) {
    final imports = <String>{}
      ..add("import 'package:onix_flutter_core/onix_flutter_core.dart';");

    for (final request in requests) {
      ///build response imports
      ///Add response body import
      final responseFileImport = request.response.type
          .getFullFileImport(projectName, DataFileType.response, arch);
      if (responseFileImport != null && !imports.contains(responseFileImport)) {
        imports.add(responseFileImport);
      }

      ///Add request body import
      if (request.requestBody != null) {
        final bodyImport = request.requestBody?.type
            .getFullFileImport(projectName, DataFileType.request, arch);
        if (bodyImport != null && !imports.contains(bodyImport)) {
          imports.add(bodyImport);
        }
      }

      ///Add path params imports
      if (request.pathParams.isNotEmpty) {
        for (final e in request.pathParams) {
          final import =
              e.type.getFullFileImport(projectName, DataFileType.request, arch);
          if (import != null && !imports.contains(import)) {
            imports.add(import);
          }
        }
      }

      ///Add query params imports
      if (request.queryParams.isNotEmpty) {
        for (final e in request.queryParams) {
          final import =
              e.type.getFullFileImport(projectName, DataFileType.request, arch);
          if (import != null && !imports.contains(import)) {
            imports.add(import);
          }
        }
      }

      ///Add multipart params imports
      if (request.multipartBody.isNotEmpty) {
        for (final e in request.multipartBody) {
          final import =
              e.type.getFullFileImport(projectName, DataFileType.request, arch);
          if (import != null && !imports.contains(import)) {
            imports.add(import);
          }
        }
      }
    }
    return imports.map((e) => e).join('\n');
  }

  String _buildRepositoryImports(String projectName) {
    final imports = <String>{}
      ..add("import 'package:onix_flutter_core/onix_flutter_core.dart';")
      ..add(
        "import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';",
      );

    for (final request in requests) {
      ///build response imports
      ///Add response body import
      final responseFileImport = request.response.type
          .getFullFileImport(projectName, DataFileType.entity, arch);
      if (responseFileImport != null && !imports.contains(responseFileImport)) {
        imports.add(responseFileImport);
      }

      ///Add request body import
      if (request.requestBody != null) {
        final bodyImport = request.requestBody?.type
            .getFullFileImport(projectName, DataFileType.entity, arch);
        if (bodyImport != null && !imports.contains(bodyImport)) {
          imports.add(bodyImport);
        }
      }

      ///Add path params imports
      if (request.pathParams.isNotEmpty) {
        for (final e in request.pathParams) {
          final import =
              e.type.getFullFileImport(projectName, DataFileType.entity, arch);
          if (import != null && !imports.contains(import)) {
            imports.add(import);
          }
        }
      }

      ///Add query params imports
      if (request.queryParams.isNotEmpty) {
        for (final e in request.queryParams) {
          final import =
              e.type.getFullFileImport(projectName, DataFileType.entity, arch);
          if (import != null && !imports.contains(import)) {
            imports.add(import);
          }
        }
      }

      ///Add multipart params imports
      if (request.multipartBody.isNotEmpty) {
        for (final e in request.multipartBody) {
          final import =
              e.type.getFullFileImport(projectName, DataFileType.entity, arch);
          if (import != null && !imports.contains(import)) {
            imports.add(import);
          }
        }
      }
    }
    return imports.map((e) => e).join('\n');
  }

  ///Get related object used in source requests (request and response objects)
  List<DataObjectReference> getSourceObjects() {
    final components = List<DataObjectReference>.empty(growable: true);
    for (final request in requests) {
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
        for (final e in request.multipartBody) {
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
        for (final e in request.pathParams) {
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
        for (final e in request.queryParams) {
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
