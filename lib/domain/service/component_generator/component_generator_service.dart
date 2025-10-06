import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/app/extension/logger_extension.dart';
import 'package:onix_flutter_bricks/app/swagger_const.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/data_components_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_reference.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/component_generator/file_mixin.dart';
import 'package:onix_flutter_bricks/domain/service/component_generator/file_operation_result.dart';
import 'package:onix_flutter_bricks/domain/service/component_generator/params/component_generator_params.dart';
import 'package:recase/recase.dart';

class ComponentGeneratorService
    extends BaseGenerationService<String, ComponentGeneratorParams>
    with FileMixin {
  @override
  Future<String> generate(ComponentGeneratorParams params) async {
    try {
      final projectLibFolder = '${params.projectRootPath}/lib';

      await _createEnums(
        projectLibFolder,
        params.projectName,
        params.components.enums,
        params.components.dataObjects,
        params.arch,
      );

      final addedDataComponents =
          List<DataObjectComponent>.empty(growable: true);

      for (final source in params.components.sources) {
        await _createRequestEnums(
          projectLibFolder,
          params.projectName,
          source.requests,
          params.arch,
        );

        final sourceObjects = source.getSourceObjects();
        final createdComponents = await _createObjects(
          projectLibFolder,
          params.projectName,
          sourceObjects,
          params.components.dataObjects,
          params.arch,
          params.projectExists,
        );
        addedDataComponents.addAll(createdComponents);

        await _createSource(
          params.projectRootPath,
          params.projectName,
          source,
          params.arch,
        );
      }

      addedDataComponents.addAll(params.components.dataObjects);

      final addedComponentsDistinct = addedDataComponents.distinct();

      await _createEntities(
        projectLibFolder,
        params.projectName,
        addedComponentsDistinct,
        params.arch,
        params.components.enums,
        params.projectExists,
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
    await createFolders(rawFolder, '_createSource');

    ///Create declaration
    final declarationFilePath =
        sourceComponent.getDeclarationFilePath(projectLibFolder);

    final declarationBody =
        sourceComponent.getSourceDeclarationBody(projectName);

    final createSourceDeclarationResult = await createFile(
      filePath: declarationFilePath,
      fileBody: declarationBody,
    );

    if (createSourceDeclarationResult == FileOperationResult.alreadyExists) {
      await modifyFile(
        filePath: declarationFilePath,
        body: declarationBody,
        sourceComponent: sourceComponent,
        dataType: DataType.source,
      );
    }

    ///Create Implementation
    final implementationFilePath =
        sourceComponent.getImplementationFilePath(projectLibFolder);

    final implementationBody =
        sourceComponent.getSourceImplementationBody(projectName);
    final createSourceImplementationResult = await createFile(
      filePath: implementationFilePath,
      fileBody: implementationBody,
    );

    if (createSourceImplementationResult == FileOperationResult.alreadyExists) {
      await modifyFile(
        filePath: implementationFilePath,
        body: implementationBody,
        sourceComponent: sourceComponent,
        dataType: DataType.sourceImpl,
      );
    }

    if (createSourceImplementationResult == FileOperationResult.created) {
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
        ..add('getIt.get<RequestProcessor>(),')
        ..add('),);')
        ..add(SwaggerConst.swaggerSourceSLDeclarationKey);

      final imports = importLines.join('\n');
      final code = codeLines.join('\n');
      await sourceSlFile.writeAsString(
        slContent
            .replaceFirst(SwaggerConst.swaggerSLImportsKey, imports)
            .replaceFirst(SwaggerConst.swaggerSourceSLDeclarationKey, code),
      );
    }

    ///Create repository declaration
    final repoDeclarationFolder =
        sourceComponent.getRepositoryDeclarationFolderPath(
      projectLibFolder,
    );
    await createFolders(repoDeclarationFolder, '_createSource');

    final repoDeclarationFilePath =
        sourceComponent.getRepoDeclarationFilePath(projectLibFolder);

    final repoDeclarationBody =
        sourceComponent.getRepoDeclarationBody(projectName, arch);
    final createRepoDeclarationResult = await createFile(
      filePath: repoDeclarationFilePath,
      fileBody: repoDeclarationBody,
    );

    if (createRepoDeclarationResult == FileOperationResult.alreadyExists) {
      await modifyFile(
        filePath: repoDeclarationFilePath,
        body: repoDeclarationBody,
        sourceComponent: sourceComponent,
        dataType: DataType.repo,
      );
    }

    ///Create repo implementation
    final repoImplFolder = sourceComponent.getRepositoryImplFolderPath(
      projectLibFolder,
    );
    await createFolders(repoImplFolder, '_createRepoImpl');

    final repoImplFilePath =
        sourceComponent.getRepoImplementationFilePath(projectLibFolder);

    final repoImplBody = sourceComponent.getRepoImplementationBody(
      projectName,
      arch,
    );
    final createRepoImplementationResult =
        await createFile(filePath: repoImplFilePath, fileBody: repoImplBody);

    if (createRepoImplementationResult == FileOperationResult.alreadyExists) {
      await modifyFile(
        filePath: repoImplFilePath,
        body: repoImplBody,
        sourceComponent: sourceComponent,
        dataType: DataType.repoImpl,
      );
    }

    if (createRepoImplementationResult == FileOperationResult.created) {
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
          //ignore: lines_longer_than_80_chars
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
  }

  Future<List<DataObjectComponent>> _createObjects(
    String projectLibFolder,
    String projectName,
    List<DataObjectReference> references,
    List<DataObjectComponent> components,
    ArchType arch,
    bool projectExists,
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
      await createFolders(fileFolder, '_createObjects');

      final body = dataObject.getObjectBody(
        projectName,
        e.type,
        arch,
      );
      final objectAdditionResult = await createFile(
        filePath: filePath,
        fileBody: body,
        overwrite: projectExists && dataObject.unmodifiable == false,
      );

      if (objectAdditionResult == FileOperationResult.created) {
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
          projectExists,
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
    List<EnumParamComponent> enums,
    bool projectExists,
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
      await createFolders(entityFolder, '_createEntities');

      final entityBody = e.getObjectBody(
        projectName,
        DataFileType.entity,
        arch,
      );

      await createFile(
        filePath: entityPath,
        fileBody: entityBody,
        overwrite: projectExists && e.unmodifiable == false,
      );
    }
    for (final e in addedDataComponents) {
      ///Create mappers
      final mapperRawFolder = e.getObjectMapperFolder(arch);
      final mapperRawPath = e.getObjectMapperFilePath(arch);
      final mapperFolder = '$projectLibFolder/$mapperRawFolder';
      final mapperPath = '$projectLibFolder/$mapperRawPath';

      final requestRawFilePath =
          e.fileReference.getFileImportName(DataFileType.request, arch);
      final responseRawFilePath =
          e.fileReference.getFileImportName(DataFileType.response, arch);
      final requestFilePath = '$projectLibFolder/$requestRawFilePath';
      final responseFilePath = '$projectLibFolder/$responseRawFilePath';
      final isRequestFileExist = File(requestFilePath).existsSync();
      final isResponseFileExist = File(responseFilePath).existsSync();
      if (isRequestFileExist || isResponseFileExist) {
        await createFolders(mapperFolder, '_createMappersEntities');
        final mapperBody = e.getMapperBody(
          projectName: projectName,
          createEntityToRequestMapper: isRequestFileExist,
          createResponseToEntityMapper: isResponseFileExist,
          arch: arch,
          enums: enums,
        );

        await createFile(
          filePath: mapperPath,
          fileBody: mapperBody,
          overwrite: projectExists && e.unmodifiable == false,
        );
      }
    }
  }

  Future<void> _createEnums(
    String projectLibFolder,
    String projectName,
    List<EnumParamComponent> enums,
    List<DataObjectComponent> components,
    ArchType arch,
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
      final folderPath = e.getFolderPath(projectLibFolder, arch);
      await createFolders(folderPath, '_createEnums');
      final filePath = e.getFilePath(projectLibFolder, arch);

      final body = e.getEnumFileBody();
      await createFile(filePath: filePath, fileBody: body);
    }
  }

  Future<void> _createRequestEnums(
    String projectLibFolder,
    String projectName,
    List<RequestComponent> requests,
    ArchType arch,
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
      final folderPath = e.getFolderPath(projectLibFolder, arch);
      await createFolders(folderPath, '_createRequestEnums');
      final filePath = e.getFilePath(projectLibFolder, arch);

      final body = e.getEnumFileBody();
      await createFile(filePath: filePath, fileBody: body);
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
}
