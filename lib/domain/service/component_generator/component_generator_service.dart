import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/app/extension/logger_extension.dart';
import 'package:onix_flutter_bricks/app/swagger_const.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/data_components_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/arch/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_reference.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/component_generator/params/component_generator_params.dart';
import 'package:recase/recase.dart';

class ComponentGeneratorService
    implements BaseGenerationService<String, ComponentGeneratorParams> {
  const ComponentGeneratorService();

  @override
  Future<String> generate(ComponentGeneratorParams params) async {
    try {
      final projectLibFolder = '${params.projectRootPath}/lib';

      await _createEnums(
        projectLibFolder,
        params.projectName,
        params.components.enums,
        params.components.dataObjects,
      );

      final addedDataComponents =
          List<DataObjectComponent>.empty(growable: true);

      for (final source in params.components.sources) {
        await _createRequestEnums(
          projectLibFolder,
          params.projectName,
          source.requests,
        );

        final sourceObjects = source.getSourceObjects();
        final createdComponents = await _createObjects(
          projectLibFolder,
          params.projectName,
          sourceObjects,
          params.components.dataObjects,
          params.arch,
        );
        addedDataComponents.addAll(createdComponents);

        await _createSource(
          params.projectRootPath,
          params.projectName,
          source,
          params.arch,
        );
      }

      final addedComponentsDistinct = addedDataComponents.distinct();

      await _createEntities(
        projectLibFolder,
        params.projectName,
        addedComponentsDistinct,
        params.arch,
      );

      return '';
    } catch (e, s) {
      logger.crash(error: e, stackTrace: s);
      return e.toString();
    }
  }

  Future<void> _createSource(
    String projectRootPath,
    String projectName,
    SourceComponent sourceComponent,
    ArchType arch,
  ) async {
    final projectLibFolder = '$projectRootPath/lib';
    final rawFolder = sourceComponent.getFolderPath(projectLibFolder);
    await _createFolders(rawFolder, '_createSource');

    ///Create declaration
    final declarationFilePath =
        sourceComponent.getDeclarationFilePath(projectLibFolder);

    final declarationBody =
        sourceComponent.getSourceDeclarationBody(projectName);
    await _createFile(filePath: declarationFilePath, fileBody: declarationBody);

    ///Create Implementation
    final implementationFilePath =
        sourceComponent.getImplementationFilePath(projectLibFolder);

    final implementationBody =
        sourceComponent.getSourceImplementationBody(projectName);
    await _createFile(
      filePath: implementationFilePath,
      fileBody: implementationBody,
    );

    ///Create SL declarations
    final sourceSLPath = '$projectRootPath/${arch.getDiPath()}/source.dart';
    final sourceSlFile = File(sourceSLPath);
    final slContent = await sourceSlFile.readAsString();

    ///SL Imports
    final importLines = List<String>.empty(growable: true)
      ..add(sourceComponent.getDeclarationImport(projectName))
      ..add(sourceComponent.getImplementationImport(projectName))
      ..add(SwaggerConst.swaggerSLImportsKey);

    ///SL Code
    final className = sourceComponent.name.pascalCase;
    final codeLines = List<String>.empty(growable: true)
      ..add(
        'getIt.registerSingleton<${className}Source>(${className}SourceImpl(',
      )
      ..add(
        'getIt.get<ApiClient>(instanceName: DioConst.defaultApiClientName),',
      )
      ..add('getIt.get<DioRequestProcessor>(),')
      ..add('),);')
      ..add(SwaggerConst.swaggerSourceSLDeclarationKey);

    final imports = importLines.join('\n');
    final code = codeLines.join('\n');
    await sourceSlFile.writeAsString(
      slContent
          .replaceFirst(SwaggerConst.swaggerSLImportsKey, imports)
          .replaceFirst(SwaggerConst.swaggerSourceSLDeclarationKey, code),
    );

    ///Create repository declaration
    final repoDeclarationFolder =
        sourceComponent.getRepositoryDeclarationFolderPath(
      projectLibFolder,
    );
    await _createFolders(repoDeclarationFolder, '_createSource');

    final repoDeclarationFilePath =
        sourceComponent.getRepoDeclarationFilePath(projectLibFolder);

    final repoDeclarationBody =
        sourceComponent.getRepoDeclarationBody(projectName);
    await _createFile(
      filePath: repoDeclarationFilePath,
      fileBody: repoDeclarationBody,
    );

    ///Create repo implementation
    final repoImplFolder = sourceComponent.getRepositoryImplFolderPath(
      projectLibFolder,
    );
    await _createFolders(repoImplFolder, '_createRepoImpl');

    final repoImplFilePath =
        sourceComponent.getRepoImplementationFilePath(projectLibFolder);

    final repoImplBody =
        sourceComponent.getRepoImplementationBody(projectName, arch);
    await _createFile(filePath: repoImplFilePath, fileBody: repoImplBody);

    ///Create repos SL declarations
    final repoSLPath = '$projectRootPath/${arch.getDiPath()}/repository.dart';
    final repoSlFile = File(repoSLPath);
    final repoSlContent = await repoSlFile.readAsString();

    ///SL Imports
    final repoImportLines = List<String>.empty(growable: true)
      ..add(sourceComponent.getDeclarationImport(projectName))
      ..add(sourceComponent.getRepoDeclarationImport(projectName))
      ..add(sourceComponent.getRepoImplementationImport(projectName))
      ..add(SwaggerConst.swaggerSLImportsKey);

    final repoClassName = sourceComponent.name.pascalCase;
    final repoSLCodeLines = List<String>.empty(growable: true)
      ..add('getIt.registerLazySingleton<${repoClassName}Repository>(')
      ..add(
        '() => ${repoClassName}RepositoryImpl(getIt<${repoClassName}Source>(),),',
      )
      ..add(');')
      ..add(SwaggerConst.swaggerRepoSLDeclarationKey);
    final repoSLImports = repoImportLines.join('\n');
    final repoSLCode = repoSLCodeLines.join('\n');
    await repoSlFile.writeAsString(
      repoSlContent
          .replaceFirst(SwaggerConst.swaggerSLImportsKey, repoSLImports)
          .replaceFirst(SwaggerConst.swaggerRepoSLDeclarationKey, repoSLCode),
    );
  }

  Future<List<DataObjectComponent>> _createObjects(
    String projectLibFolder,
    String projectName,
    List<DataObjectReference> references,
    List<DataObjectComponent> components,
    ArchType arch,
  ) async {
    ///List of components was created
    final addedDataComponents = List<DataObjectComponent>.empty(growable: true);

    ///go through each reference and create object
    for (final e in references) {
      final dataObject = components.firstWhereOrNull(
        (component) => component.name == e.fileReference.reference,
      );
      if (dataObject == null) {
        continue;
      }

      ///Create File
      final fileRawFolder = dataObject.getFileFolder(e.type, arch);
      final fileRawPath = dataObject.getFilePath(e.type, arch);
      if (fileRawPath.isEmpty || fileRawFolder.isEmpty) {
        continue;
      }
      final fileFolder = '$projectLibFolder/$fileRawFolder';
      final filePath = '$projectLibFolder/$fileRawPath';
      await _createFolders(fileFolder, '_createObjects');

      final body = dataObject.getObjectBody(
        projectName,
        e.type,
        arch,
      );
      final objectAdded = await _createFile(
        filePath: filePath,
        fileBody: body,
      );
      if (objectAdded) {
        addedDataComponents.add(dataObject);
      } else {
        continue;
      }

      final innerReferences = _getObjectInnerReferences(
        e.type,
        dataObject,
      );

      ///recursively add inner objects
      if (innerReferences.isNotEmpty) {
        final createdInnerObjects = await _createObjects(
          projectLibFolder,
          projectName,
          innerReferences,
          components,
          arch,
        );
        addedDataComponents.addAll(createdInnerObjects);
      }
    }
    return addedDataComponents;
  }

  Future<void> _createEntities(
    String projectLibFolder,
    String projectName,
    List<DataObjectComponent> addedDataComponents,
    ArchType arch,
  ) async {
    for (final e in addedDataComponents) {
      ///Create Entities

      final entityRawFolder = e.getFileFolder(DataFileType.entity, arch);
      final entityRawPath = e.getFilePath(DataFileType.entity, arch);
      if (entityRawFolder.isEmpty || entityRawPath.isEmpty) {
        continue;
      }
      final entityFolder = '$projectLibFolder/$entityRawFolder';
      final entityPath = '$projectLibFolder/$entityRawPath';
      await _createFolders(entityFolder, '_createEntities');

      final entityBody = e.getObjectBody(
        projectName,
        DataFileType.entity,
        arch,
      );

      await _createFile(filePath: entityPath, fileBody: entityBody);
    }
    for (final e in addedDataComponents) {
      ///Create mappers
      final mapperRawFolder = e.getObjectMapperFolder(arch);
      final mapperRawPath = e.getObjectMapperFilePath(arch);
      final mapperFolder = '$projectLibFolder/$mapperRawFolder';
      final mapperPath = '$projectLibFolder/$mapperRawPath';
      await _createFolders(mapperFolder, '_createMappersEntities');
      final requestRawFilePath =
          e.fileReference.getFileImportName(DataFileType.request, arch);
      final responseRawFilePath =
          e.fileReference.getFileImportName(DataFileType.response, arch);
      final requestFilePath = '$projectLibFolder/$requestRawFilePath';
      final responseFilePath = '$projectLibFolder/$responseRawFilePath';
      final isRequestFileExist = File(requestFilePath).existsSync();
      final isResponseFileExist = File(responseFilePath).existsSync();
      if (isRequestFileExist || isResponseFileExist) {
        final mapperBody = e.getMapperBody(
          projectName: projectName,
          createEntityToRequestMapper: isRequestFileExist,
          createResponseToEntityMapper: isResponseFileExist,
          arch: arch,
        );

        await _createFile(filePath: mapperPath, fileBody: mapperBody);
      }
    }
  }

  Future<void> _createEnums(
    String projectLibFolder,
    String projectName,
    List<EnumParamComponent> enums,
    List<DataObjectComponent> components,
  ) async {
    final enumsCopy = List.of(enums);
    for (final component in components) {
      for (final variable in component.variables) {
        final innerEnum = variable.type.getSwaggerEnumReference();
        if (innerEnum != null) {
          enumsCopy.add(
            EnumParamComponent(
              name: variable.name,
              type: innerEnum,
            ),
          );
        }
      }
    }

    for (final e in enumsCopy) {
      final folderPath = e.getFolderPath(projectLibFolder);
      await _createFolders(folderPath, '_createEnums');
      final filePath = e.getFilePath(projectLibFolder);

      final body = e.getEnumFileBody();
      await _createFile(filePath: filePath, fileBody: body);
    }
  }

  Future<void> _createRequestEnums(
    String projectLibFolder,
    String projectName,
    List<RequestComponent> requests,
  ) async {
    final enumsCopy = List<EnumParamComponent>.empty(growable: true);
    for (final e in requests) {
      ///Check request
      if (e.requestBody != null) {
        final enumRef = e.requestBody!.type.getSwaggerEnumReference();
        if (enumRef != null) {
          enumsCopy.add(
            EnumParamComponent(
              name: e.requestBody!.name,
              type: enumRef,
            ),
          );
        }
      }

      ///Check response
      final responseEnum = e.response.type.getSwaggerEnumReference();
      if (responseEnum != null) {
        enumsCopy.add(
          EnumParamComponent(
            name: e.response.name,
            type: responseEnum,
          ),
        );
      }

      ///Check query params
      for (final qParam in e.queryParams) {
        final enumRef = qParam.type.getSwaggerEnumReference();
        if (enumRef != null) {
          enumsCopy.add(
            EnumParamComponent(
              name: qParam.name,
              type: enumRef,
            ),
          );
        }
      }

      ///Check path params
      for (final pParam in e.pathParams) {
        final enumRef = pParam.type.getSwaggerEnumReference();
        if (enumRef != null) {
          enumsCopy.add(
            EnumParamComponent(
              name: pParam.name,
              type: enumRef,
            ),
          );
        }
      }
    }

    for (final e in enumsCopy) {
      final folderPath = e.getFolderPath(projectLibFolder);
      await _createFolders(folderPath, '_createRequestEnums');
      final filePath = e.getFilePath(projectLibFolder);

      final body = e.getEnumFileBody();
      await _createFile(filePath: filePath, fileBody: body);
    }
  }

  ///Function to get inner references to objects inside object
  List<DataObjectReference> _getObjectInnerReferences(
    DataFileType rootFileType,
    DataObjectComponent dataObject,
  ) {
    final innerReferences = List<DataObjectReference>.empty(growable: true);
    for (final e in dataObject.variables) {
      final ref = e.type.getSwaggerObjectReference();
      if (ref != null) {
        innerReferences.add(
          DataObjectReference(type: rootFileType, fileReference: ref),
        );
      }
    }
    return innerReferences;
  }

  Future<bool> _createFile({
    required String filePath,
    required String fileBody,
  }) async {
    final file = File(filePath);
    try {
      final isAlreadyExist = file.existsSync();
      if (isAlreadyExist) {
        logger.i('File already exists: $filePath');
        return false;
      }
      await file.create(recursive: true);
      await file.writeAsString(fileBody);
      logger.i('File created: $filePath');
      return true;
    } catch (e) {
      logger.crash(error: e, stackTrace: StackTrace.current);
      return false;
    }
  }

  Future<void> _createFolders(
    String path,
    String methodCaller,
  ) async {
    try {
      final directory = Directory(path);
      if (directory.existsSync()) {
        logger.i('$methodCaller. Directory already exists: $path');
      } else {
        await directory.create(recursive: true);
        logger.i('$methodCaller. Directory created: $path');
      }
    } catch (e) {
      logger.crash(error: e, stackTrace: StackTrace.current);
    }
  }
}
