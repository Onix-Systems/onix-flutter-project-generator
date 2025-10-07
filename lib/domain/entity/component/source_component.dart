import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_reference_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_reference.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class SourceComponent {
  final String name;
  final List<RequestComponent> requests;
  final ArchType arch;
  final bool fromSwagger;
  final bool unmodifiable;

  SourceComponent({
    required String name,
    required this.requests,
    required this.arch,
    this.fromSwagger = true,
    this.unmodifiable = false,
  }) : name = name.pascalCase;

  SourceComponent copyWith({
    String? name,
    List<RequestComponent>? requests,
    ArchType? arch,
    bool? fromSwagger,
    bool? unmodifiable,
  }) {
    return SourceComponent(
      name: name ?? this.name,
      requests: requests ?? this.requests,
      arch: arch ?? this.arch,
      fromSwagger: fromSwagger ?? this.fromSwagger,
      unmodifiable: unmodifiable ?? this.unmodifiable,
    );
  }

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

  String getEnumImport(String projectName, SwaggerType type) {
    if (type is SwaggerArray) {
      final import =
          "import 'package:$projectName/${arch.getEnumPath()}/${type.itemType.type.getName().snakeCase}.dart';";
      return import;
    }
    return "import 'package:$projectName/${arch.getEnumPath()}/${type.toString().snakeCase}.dart';";
  }

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
        'class ${name.pascalCase}SourceImpl '
        'implements ${name.pascalCase}Source {',
      )
      ..addNewLine();
    for (final e in requests) {
      codeLines.add(e.getVariableDeclaration());
    }
    codeLines
      ..addNewLine()
      ..add('final ApiClient _apiClient;')
      ..add('final RequestProcessor _dioRequestProcessor;')
      ..addNewLine()
      ..add(
        'const ${name.pascalCase}SourceImpl(this._apiClient, '
        'this._dioRequestProcessor,);',
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

  String getRepoDeclarationBody(String projectName, ArchType arch) {
    final codeLines = List<String>.empty(growable: true);
    final modelImports = _buildRepositoryImports(projectName, arch);
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

  String getRepoImplementationBody(
    String projectName,
    ArchType arch,
  ) {
    final codeLines = <String>{};
    final modelImports = _buildRepositoryImports(projectName, arch);
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
        _addMapperImports(requestBody, projectName, arch, mapperImports);
      }

      if (e.multipartBody.isNotEmpty) {
        for (final multipart in e.multipartBody) {
          _addMapperImports(multipart, projectName, arch, mapperImports);
        }
      }

      if (e.queryParams.isNotEmpty) {
        for (final queryParam in e.queryParams) {
          _addMapperImports(queryParam, projectName, arch, mapperImports);
        }
      }

      ///Add response mapper import
      if (!e.response.isEnum) {
        final responseReference = e.response.type.getSwaggerObjectReference();
        if (responseReference != null) {
          final importLine =
              responseReference.getReferenceMapperImport(projectName, arch);
          if (!mapperImports.contains(importLine)) {
            mapperImports.add(importLine);
          }
        }
      }
    }

    codeLines
      ..addAll(mapperImports)
      ..add(
        //ignore: lines_longer_than_80_chars
        'class ${name.pascalCase}RepositoryImpl implements ${name.pascalCase}Repository {',
      )
      ..add('final ${name.pascalCase}Source _${name.camelCase}Source;')
      ..add('final _dioServerErrorMapper = DioServerErrorMapper();');

    ///Declare mappers for request objects
    final mapperVariables = List<String>.empty(growable: true);
    for (final e in requests) {
      final requestBody = e.requestBody;
      if (requestBody != null) {
        _addMapperVariables(requestBody, mapperVariables);
      }

      final multipartBody = e.multipartBody;

      if (multipartBody.isNotEmpty) {
        for (final multipart in multipartBody) {
          _addMapperVariables(multipart, mapperVariables);
        }
      }

      if (e.queryParams.isNotEmpty) {
        for (final queryParam in e.queryParams) {
          _addMapperVariables(queryParam, mapperVariables);
        }
      }

      ///Add response variable declaration
      if (!e.response.isEnum) {
        final responseReference = e.response.type.getSwaggerObjectReference();
        if (responseReference != null) {
          final mapperVariable =
              responseReference.getReferenceMapperDeclaration();
          if (!mapperVariables.contains(mapperVariable)) {
            mapperVariables.add(mapperVariable);
          }
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

  void _addMapperVariables(
    RequestParamComponent requestComponent,
    List<String> mapperVariables,
  ) {
    if (requestComponent.isEnum || requestComponent.type is SwaggerEnum) {
      return;
    }
    final requestReference = requestComponent.type.getSwaggerObjectReference();
    if (requestReference != null) {
      final mapperVariable = requestReference.getReferenceMapperDeclaration();
      if (!mapperVariables.contains(mapperVariable)) {
        mapperVariables.add(mapperVariable);
      }
    }
  }

  void _addMapperImports(
    RequestParamComponent requestComponent,
    String projectName,
    ArchType arch,
    List<String> mapperImports,
  ) {
    if (requestComponent.isEnum || requestComponent.type is SwaggerEnum) {
      return;
    }

    final queryParamReference =
        requestComponent.type.getSwaggerObjectReference();

    if (queryParamReference != null) {
      final importLine =
          queryParamReference.getReferenceMapperImport(projectName, arch);
      if (!mapperImports.contains(importLine)) {
        mapperImports.add(importLine);
      }
    }
  }

  String _buildSourceImports(String projectName) {
    final imports = <String>{}
      ..add(
          "import 'package:onix_flutter_core/onix_flutter_core.dart' hide OperationStatus;")
      ..add(
          "import 'package:$projectName/core/arch/domain/entity/common/operation_status.dart';");

    for (final request in requests) {
      ///build response imports
      ///Add response body import

      if (request.response.isEnum) {
        final import = getEnumImport(projectName, request.response.type);

        if (!imports.contains(import)) {
          imports.add(import);
        }
      } else {
        final responseFileImport = request.response.type
            .getFullFileImport(projectName, DataFileType.response, arch);

        if (responseFileImport != null &&
            !imports.contains(responseFileImport)) {
          imports.add(responseFileImport);
        }
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
          _getImport(e, projectName, imports);
        }
      }

      ///Add query params imports
      if (request.queryParams.isNotEmpty) {
        for (final e in request.queryParams) {
          _getImport(e, projectName, imports);
        }
      }

      ///Add multipart params imports
      if (request.multipartBody.isNotEmpty) {
        for (final e in request.multipartBody) {
          _getImport(e, projectName, imports);
        }
      }
    }
    return imports.map((e) => e).join('\n');
  }

  void _getImport(
    RequestParamComponent e,
    String projectName,
    Set<String> imports,
  ) {
    if (!e.isEnum &&
        !(e.type is SwaggerArray &&
            (e.type as SwaggerArray).itemType.type is SwaggerEnum)) {
      final import =
          e.type.getFullFileImport(projectName, DataFileType.request, arch);
      if (import != null && !imports.contains(import)) {
        imports.add(import);
      }
    }
  }

  String _buildRepositoryImports(String projectName, ArchType arch) {
    final imports = <String>{}
      ..add(
        "import 'package:onix_flutter_core_models/onix_flutter_core_models.dart' hide Result;",
      )
      ..add(
        "import 'package:$projectName/core/arch/result/result.dart';",
      )
      ..add(
        "import 'package:$projectName/core/arch/domain/entity/common/operation_status.dart';",
      )
      ..add(
        arch == ArchType.clean
            ? "import 'package:$projectName/core/arch/data/remote/dio/dio_server_error_mapper.dart';"
            : "import 'package:$projectName/data/dio_server_error_mapper.dart';",
      );

    for (final request in requests) {
      ///build response imports
      ///Add response body import
      if (request.response.isEnum) {
        final import = getEnumImport(projectName, request.response.type);
        if (!imports.contains(import)) {
          imports.add(import);
        }
      } else {
        final responseFileImport = request.response.type
            .getFullFileImport(projectName, DataFileType.entity, arch);
        if (responseFileImport != null &&
            !imports.contains(responseFileImport)) {
          imports.add(responseFileImport);
        }
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
          if (e.isEnum) {
            final import = getEnumImport(projectName, e.type);
            if (!imports.contains(import)) {
              imports.add(import);
            }
          } else {
            final import = e.type
                .getFullFileImport(projectName, DataFileType.entity, arch);
            if (import != null && !imports.contains(import)) {
              imports.add(import);
            }
          }
        }
      }

      ///Add query params imports
      if (request.queryParams.isNotEmpty) {
        for (final e in request.queryParams) {
          if (e.isEnum) {
            final import = getEnumImport(projectName, e.type);
            if (!imports.contains(import)) {
              imports.add(import);
            }
          } else {
            final import = e.type
                .getFullFileImport(projectName, DataFileType.entity, arch);
            if (import != null && !imports.contains(import)) {
              imports.add(import);
            }
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

  void mergeWith(SourceComponent other) {
    requests.addAll(other.requests);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'requests': requests.map((e) => e.toJson()).toList(),
    };
  }

  factory SourceComponent.fromJson(Map<String, dynamic> json) {
    return SourceComponent(
      name: json['name'] as String,
      requests: (json['requests'] as List<dynamic>)
          .map((e) => RequestComponent.fromJson(e))
          .toList(),
      arch: ArchType.clean,
      fromSwagger: false,
      unmodifiable: true,
    );
  }

  @override
  String toString() {
    //ignore: lines_longer_than_80_chars
    return 'SourceComponent(name: $name, requests: $requests, arch: $arch, fromSwagger: $fromSwagger)';
  }
}
