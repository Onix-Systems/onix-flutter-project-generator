import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/app/swagger_const.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_reference.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/component_generator/params/component_generator_params.dart';
import 'package:recase/recase.dart';

class ComponentGeneratorService implements BaseGenerationService<String> {
  final _addedDataComponents = List<DataObjectComponent>.empty(growable: true);

  @override
  Future<String> generate(BaseGenerationParams params) async {
    if (params is! ComponentGeneratorParams) {
      return 'Incorrect params';
    }

    final projectLibFolder = '${params.projectPath}/${params.projectName}/lib';

    _addedDataComponents.clear();

    await _createEnums(
      projectLibFolder,
      params.projectName,
      params.components.enums,
      params.components.dataObjects,
    );

    for (var i = 0; i < params.components.sources.length; i++) {
      final source = params.components.sources[i];
      final sourceObjects = source.getSourceObjects();
      await _createObjects(
        projectLibFolder,
        params.projectName,
        sourceObjects,
        params.components.dataObjects,
      );

      await _createEntities(
        projectLibFolder,
        params.projectName,
      );

      await _createSource(
        projectLibFolder,
        params.projectName,
        source,
      );
    }

    return '';
  }

  Future<void> _createSource(
    String projectLibFolder,
    String projectName,
    SourceComponent sourceComponent,
  ) async {
    final rawFolder = sourceComponent.getFolderPath(projectLibFolder);
    await _createFolders(rawFolder);

    ///Create declaration
    final declarationFilePath =
        sourceComponent.getDeclarationFilePath(projectLibFolder);

    final declarationBody = sourceComponent.getDeclarationBody(projectName);
    await _createFile(filePath: declarationFilePath, fileBody: declarationBody);

    ///Create Implementation
    final implementationFilePath =
        sourceComponent.getImplementationFilePath(projectLibFolder);

    final implementationBody =
        sourceComponent.getImplementationBody(projectName);
    await _createFile(
        filePath: implementationFilePath, fileBody: implementationBody);

    ///Create SL declarations
    final sourceSLPath = '$projectLibFolder/core/di/source.dart';
    final sourceSlFile = File(sourceSLPath);
    final slContent = await sourceSlFile.readAsString();

    ///SL Imports
    final importLines = List<String>.empty(growable: true);
    importLines.add(sourceComponent.getDeclarationImport(projectName));
    importLines.add(sourceComponent.getImplementationImport(projectName));
    importLines.add(SwaggerConst.swaggerSLImportsKey);

    ///SL Code
    final className = sourceComponent.name.pascalCase;
    final codeLines = List<String>.empty(growable: true);
    codeLines.add(
        'getIt.registerSingleton<${className}Source>(${className}SourceImpl(');
    codeLines.add(
        'getIt.get<ApiClient>(instanceName: DioConst.defaultApiClientName),');
    codeLines.add('getIt.get<DioRequestProcessor>(),');
    codeLines.add('),);');
    codeLines.add(SwaggerConst.swaggerSourceSLDeclarationKey);
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
    await _createFolders(repoDeclarationFolder);

    final repoDeclarationFilePath =
        sourceComponent.getRepoDeclarationFilePath(projectLibFolder);

    final repoDeclarationBody =
        sourceComponent.getRepoDeclarationBody(projectName);
    await _createFile(
        filePath: repoDeclarationFilePath, fileBody: repoDeclarationBody);

    ///Create repo implementation
    final repoImplFolder = sourceComponent.getRepositoryImplFolderPath(
      projectLibFolder,
    );
    await _createFolders(repoImplFolder);

    final repoImplFilePath =
        sourceComponent.getRepoImplementationFilePath(projectLibFolder);

    final repoImplBody = sourceComponent.getRepoImplementationBody(projectName);
    await _createFile(filePath: repoImplFilePath, fileBody: repoImplBody);

    ///Create repos SL declarations
    final repoSLPath = '$projectLibFolder/core/di/repository.dart';
    final repoSlFile = File(repoSLPath);
    final repoSlContent = await repoSlFile.readAsString();

    ///SL Imports
    final repoImportLines = List<String>.empty(growable: true);
    repoImportLines.add(sourceComponent.getDeclarationImport(projectName));
    repoImportLines.add(sourceComponent.getRepoDeclarationImport(projectName));
    repoImportLines
        .add(sourceComponent.getRepoImplementationImport(projectName));
    repoImportLines.add(SwaggerConst.swaggerSLImportsKey);

    final repoClassName = sourceComponent.name.pascalCase;
    final repoSLCodeLines = List<String>.empty(growable: true);
    repoSLCodeLines
        .add('getIt.registerLazySingleton<${repoClassName}Repository>(');
    repoSLCodeLines.add(
        '() => ${repoClassName}RepositoryImpl(getIt<${repoClassName}Source>()),');
    repoSLCodeLines.add(');');
    repoSLCodeLines.add(SwaggerConst.swaggerRepoSLDeclarationKey);
    final repoSLImports = repoImportLines.join('\n');
    final repoSLCode = repoSLCodeLines.join('\n');
    await repoSlFile.writeAsString(
      repoSlContent
          .replaceFirst(SwaggerConst.swaggerSLImportsKey, repoSLImports)
          .replaceFirst(SwaggerConst.swaggerRepoSLDeclarationKey, repoSLCode),
    );
  }

  Future<void> _createObjects(
    String projectLibFolder,
    String projectName,
    List<DataObjectReference> references,
    List<DataObjectComponent> components,
  ) async {
    ///List of components was created

    ///go through each reference and create object
    for (var e in references) {
      final dataObject = components.firstWhereOrNull(
        (component) => component.name == e.fileReference.reference,
      );
      if (dataObject == null) {
        continue;
      }

      ///Create File
      final fileRawFolder = dataObject.getFileFolder(e.type);
      final fileRawPath = dataObject.getFilePath(e.type);
      if (fileRawPath.isEmpty || fileRawFolder.isEmpty) {
        continue;
      }
      final fileFolder = '$projectLibFolder/$fileRawFolder';
      final filePath = '$projectLibFolder/$fileRawPath';
      await _createFolders(fileFolder);

      final body = dataObject.getObjectBody(
        projectName,
        e.type,
      );
      final objectAdded = await _createFile(filePath: filePath, fileBody: body);
      if (objectAdded) {
        _addedDataComponents.add(dataObject);
      }

      final innerReferences = _getObjectInnerReferences(
        e.type,
        dataObject,
      );

      ///recursively add inner objects
      if(innerReferences.isNotEmpty){
        await _createObjects(
          projectLibFolder,
          projectName,
          innerReferences,
          components,
        );
      }

    }
  }

  Future<void> _createEntities(
    String projectLibFolder,
    String projectName,
  ) async {
    for (var e in _addedDataComponents) {
      ///Create Entities

      final entityRawFolder = e.getFileFolder(DataFileType.entity);
      final entityRawPath = e.getFilePath(DataFileType.entity);
      if (entityRawFolder.isEmpty || entityRawPath.isEmpty) {
        continue;
      }
      final entityFolder = '$projectLibFolder/$entityRawFolder';
      final entityPath = '$projectLibFolder/$entityRawPath';
      await _createFolders(entityFolder);

      final entityBody = e.getObjectBody(
        projectName,
        DataFileType.entity,
      );

      await _createFile(filePath: entityPath, fileBody: entityBody);

      ///Create mappers
      final mapperRawFolder = e.getObjectMapperFolder();
      final mapperRawPath = e.getObjectMapperFilePath();
      final mapperFolder = '$projectLibFolder/$mapperRawFolder';
      final mapperPath = '$projectLibFolder/$mapperRawPath';
      await _createFolders(mapperFolder);
      final requestRawFilePath =
          e.fileReference.getFileImportName(DataFileType.request);
      final responseRawFilePath =
          e.fileReference.getFileImportName(DataFileType.response);
      final requestFilePath = '$projectLibFolder/$requestRawFilePath';
      final responseFilePath = '$projectLibFolder/$responseRawFilePath';
      final isRequestFileExist = await File(requestFilePath).exists();
      final isResponseFileExist = await File(responseFilePath).exists();
      if (isRequestFileExist || isResponseFileExist) {
        final mapperBody = e.getMapperBody(
          projectName: projectName,
          createEntityToRequestMapper: isRequestFileExist,
          createResponseToEntityMapper: isResponseFileExist,
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
    final enumsCopy = List.from(enums, growable: true);
    for (var component in components) {
      for (var variable in component.variables) {
        final innerEnum = variable.type.getSwaggerEnumReference();
        if (innerEnum !=null) {
          enumsCopy.add(
            EnumParamComponent(
              name: variable.name,
              type: innerEnum,
            ),
          );
        }
      }
    }

    for (var e in enumsCopy) {
      final folderPath = e.getFolderPath(projectLibFolder);
      await _createFolders(folderPath);
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
    for (var e in dataObject.variables) {
      if (e.type is SwaggerReference) {
        final ref = e.type as SwaggerReference;
        innerReferences.add(
          DataObjectReference(type: rootFileType, fileReference: ref),
        );
      } else if (e.type is SwaggerArray) {
        final array = e.type as SwaggerArray;
        if (array.itemType is SwaggerReference) {
          final ref = array.itemType as SwaggerReference;
          innerReferences.add(
            DataObjectReference(type: rootFileType, fileReference: ref),
          );
        }
      }
    }
    return innerReferences;
  }

  Future<bool> _createFile({
    required String filePath,
    required String fileBody,
  }) async {
    final file = File(filePath);
    final isAlreadyExist = await file.exists();
    if (isAlreadyExist) {
      return false;
    }

    await file.create();
    await file.writeAsString(fileBody);
    return true;
  }

  Future<void> _createFolders(String path) async {
    final directory = Directory(path);
    final exist = await directory.exists();
    if (!exist) {
      await Directory(path).create(recursive: true);
    }
  }
}
