import 'dart:io';

import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/generated_method.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:recase/recase.dart';

class RepositoryFilesGenerator {
  static Future<void> repositoryFileGenerate({
    required String sourceFileContent,
    required String projectName,
    required String projectPath,
    required String sourceName,
  }) async {
    final repositoryPath = await Directory(
            '$projectPath/$projectName/lib/domain/repository/${sourceName.snakeCase}')
        .create(recursive: true);

    var repositoryFile = await File(
            '${repositoryPath.path}/${sourceName.snakeCase}_repository.dart')
        .create();

    final fileContent = sourceFileContent
        .replaceAll('data_response.dart', 'result.dart')
        .replaceAll('<DataResponse<', '<Result<')
        .replaceAll('Response>>', '>>')
        .replaceAll('Source', 'Repository')
        .split(';')
        .map((e) {
      if (e.contains('_response.dart')) {
        return e
            .replaceAll('_response.dart', '.dart')
            .replaceAll('_response/', '/')
            .replaceAll('data/model/remote/', 'domain/entity/');
      }
      return e;
    }).join(';');

    await repositoryFile.writeAsString(fileContent);
  }

  static Future<void> repositoryImplFileGenerate({
    required String projectPath,
    required String projectName,
    required String sourceName,
    required String mutatedPathPrefix,
    required Set<String> imports,
    required List<GeneratedMethod> implMethods,
  }) async {
    final repositoryImplPath = await Directory(
            '$projectPath/$projectName/lib/data/repository/${sourceName.snakeCase}')
        .create(recursive: true);

    var repositoryImplFile = await File(
            '${repositoryImplPath.path}/${sourceName.snakeCase}_repository_impl.dart')
        .create();

    final mappers = <String>{};
    final mappersImports = <String>{};

    for (final method in implMethods) {
      if (method.responseEntityName.isNotEmpty) {
        if (sourceRepository.checkEntityIsEnum(
          entityName: method.responseEntityName.replaceLast('Response', ''),
        )) {
          continue;
        }

        final mapper =
            method.responseEntityName.replaceLast('Response', '').camelCase;

        mappers.add(
            '''final _${mapper}Mappers = ${mapper.pascalCase}Mappers();''');

        final sourceName = sourceRepository.getDataComponentSourceName(mapper);

        mappersImports.add(
            '''import 'package:$projectName/data/mapper/${sourceName.snakeCase}/${mapper.snakeCase}/${mapper.snakeCase}_mapper.dart';''');
      }
    }

    final fileContent =
        '''import 'package:$projectName/core/arch/data/remote/base/map_common_server_error.dart';
import 'package:$projectName/core/arch/domain/entity/common/result.dart';
import 'package:$projectName/core/di/app.dart';
import 'package:$projectName/core/extension/logger_extension.dart';
import 'package:$projectName/core/arch/domain/entity/failure/api_failure.dart';
import 'package:$projectName/core/arch/domain/entity/common/operation_status.dart';
import 'package:$projectName/data/source/remote/${sourceName.snakeCase}/${sourceName.snakeCase}_source.dart';
import 'package:$projectName/domain/repository/${sourceName.snakeCase}/${sourceName.snakeCase}_repository.dart';
${imports.map((import) {
      if (import.contains('_response.dart')) {
        return import
            .replaceAll('_response.dart', '.dart')
            .replaceAll('data/model/remote/', 'domain/entity/');
      }
      return import;
    }).join('\n')}
    
${mappersImports.join('\n')}

class ${sourceName.pascalCase}RepositoryImpl implements ${sourceName.pascalCase}Repository {
  
  final ${sourceName.pascalCase}Source _${sourceName.camelCase}Source;
  
  ${mappers.join('\n')}
  
  ${sourceName.pascalCase}RepositoryImpl({
    required ${sourceName.pascalCase}Source ${sourceName.camelCase}Source,
  }) : _${sourceName.camelCase}Source = ${sourceName.camelCase}Source;
  
  ${implMethods.map((e) => '''@override
        ${e.sourceMethod.replaceAll('DataResponse', 'Result').replaceAll('Response>>', '>>').replaceAll(';', '')} async {
        ${_getRepositoryImplBody(e, mutatedPathPrefix, sourceName.camelCase)}
        }
    '''.replaceAll(('{}'), '')).join('\n')}
}''';

    await repositoryImplFile.writeAsString(fileContent);
  }

  static String _getRepositoryImplBody(
      GeneratedMethod method, String prefix, String sourceName) {
    String sourceParams = method.sourceMethod
        .replaceAll(';', '')
        .split('(')
        .last
        .replaceAll('{required ', '')
        .replaceAll(', })', '')
        .replaceLast(')', '')
        .replaceLast('}', '')
        .replaceLast(',', '');

    if (sourceParams.isNotEmpty) {
      if (sourceParams.contains(',')) {
        sourceParams = sourceParams
            .split(',')
            .map((e) => '${e.split(' ').last}: ${e.split(' ').last}')
            .join(', ');
      } else {
        sourceParams =
            '${sourceParams.split(' ').last}: ${sourceParams.split(' ').last}';
      }

      sourceParams = '$sourceParams,';
    }

    final responseName = method.responseEntityName.replaceLast('Response', '');

    final methodBody = '''
try {
      final response = await _${sourceName}Source.${method.name}($sourceParams);
      if (response.isSuccess()) {
        ${method.sourceMethod.contains('<OperationStatus>') || sourceRepository.checkEntityIsEnum(entityName: responseName) ? 'return Result.success(response.data);' : responseName.isNotEmpty ? '''final result = _${responseName.camelCase}Mappers.mapResponseToEntity(response.data);
        return Result.success(result);''' : 'return Result.success(response.data);'}
      } else {
        final failure = MapCommonServerError.getServerFailureDetails(response);
        return Result.error(failure: failure);
      }
    } catch (e, trace) {
      logger.crash(reason: '${method.name}_API_ERR', error: e, stackTrace: trace);
      //TODO make repository failure
      return Result.error(
        failure: ApiFailure(
          ServerFailure.exception,
          message: e.toString(),
        ),
      );
    }
    ''';

    return methodBody;
  }
}
