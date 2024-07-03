import 'dart:io';

import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/source/generated_method.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/repository_generator_params.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:recase/recase.dart';

class RepositoryFilesGenerator implements BaseGenerationService<bool> {
  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! RepositoryGeneratorParams) {
      return false;
    }

    await _repositoryFileGenerate(params);

    await _repositoryImplFileGenerate(params);

    return true;
  }

  Future<void> _repositoryFileGenerate(RepositoryGeneratorParams params) async {
    final repositoryPath = await Directory(
            '${params.projectPath}/${params.projectName}/lib/domain/repository/${params.sourceName.snakeCase}')
        .create(recursive: true);

    var repositoryFile = await File(
            '${repositoryPath.path}/${params.sourceName.snakeCase}_repository.dart')
        .create();

    final fileContent = params.sourceFileContent
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

  Future<void> _repositoryImplFileGenerate(
      RepositoryGeneratorParams params) async {
    final repositoryImplPath = await Directory(
            '${params.projectPath}/${params.projectName}/lib/data/repository/${params.sourceName.snakeCase}')
        .create(recursive: true);

    var repositoryImplFile = await File(
            '${repositoryImplPath.path}/${params.sourceName.snakeCase}_repository_impl.dart')
        .create();

    final mappers = <String>{};
    final mappersImports = <String>{};

    for (final method in params.implMethods) {
      if (method.responseEntityName.isNotEmpty) {
        final isEnum = dataComponentRepository.isEnum(
          dataComponentName:
              method.responseEntityName.replaceLast('Response', ''),
        );
        if (isEnum) {
          continue;
        }

        final mapper =
            method.responseEntityName.replaceLast('Response', '').camelCase;

        mappers.add(
            '''final _${mapper}Mappers = ${mapper.pascalCase}Mappers();''');

        final sourceName = dataComponentRepository
                .getDataComponentByName(dataComponentName: mapper)
                ?.sourceName ??
            '';

        mappersImports.add(
            '''import 'package:${params.projectName}/data/mapper/${sourceName.snakeCase}/${mapper.snakeCase}/${mapper.snakeCase}_mapper.dart';''');
      }
    }

    final codeLines = List<String>.empty(growable: true);

    ///Imports
    codeLines.add(
        'import \'package:${params.projectName}/core/arch/data/remote/base/map_common_server_error.dart\';');
    codeLines.add(
        'import \'package:${params.projectName}/core/arch/domain/entity/common/result.dart\';');
    codeLines.add(
        'import \'package:${params.projectName}/core/arch/logger/app_logger_impl.dart\';');
    codeLines.add(
        'import \'package:${params.projectName}/core/arch/domain/entity/failure/api_failure.dart\';');
    codeLines.add(
        'import \'package:${params.projectName}/core/arch/domain/entity/common/operation_status.dart\';');
    codeLines.add(
        'import \'package:${params.projectName}/data/source/remote/${params.sourceName.snakeCase}/${params.sourceName.snakeCase}_source.dart\';');
    codeLines.add(
        'import \'package:${params.projectName}/domain/repository/${params.sourceName.snakeCase}/${params.sourceName.snakeCase}_repository.dart\';');
    final modelImports = params.imports.map(
      (import) {
        if (import.contains('_response.dart')) {
          return import
              .replaceAll('_response.dart', '.dart')
              .replaceAll('data/model/remote/', 'domain/entity/');
        }
        return import;
      },
    );
    codeLines.addAll(modelImports);
    codeLines.addAll(mappersImports);
    codeLines.addNewLine();

    ///Class code content
    codeLines.add(
        'class ${params.sourceName.pascalCase}RepositoryImpl implements ${params.sourceName.pascalCase}Repository {');
    codeLines.addNewLine();
    codeLines.add(
        'final ${params.sourceName.pascalCase}Source _${params.sourceName.camelCase}Source;');
    codeLines.addNewLine();
    codeLines.addAll(mappers);
    codeLines.addNewLine();
    codeLines.add('${params.sourceName.pascalCase}RepositoryImpl({');
    codeLines.add(
        'required ${params.sourceName.pascalCase}Source ${params.sourceName.camelCase}Source,');
    codeLines.add(
        '}) : _${params.sourceName.camelCase}Source = ${params.sourceName.camelCase}Source;');
    codeLines.addNewLine();
    final implementationMethods = params.implMethods.map(
      (e) {
        final bodyLines = List<String>.empty(growable: true);
        bodyLines.add('@override');
        final sourceMethod = e.sourceMethod
            .replaceAll('DataResponse', 'Result')
            .replaceAll('Response>>', '>>')
            .replaceAll(';', '');
        bodyLines.add('$sourceMethod async {');
        bodyLines.add(_getRepositoryImplBody(
            e, params.mutatedPathPrefix, params.sourceName.camelCase));
        bodyLines.add('}');
        bodyLines.addNewLine();
        return bodyLines.join('\n').replaceAll(('{}'), '');
      },
    );
    codeLines.addAll(implementationMethods);
    codeLines.add('}');
    codeLines.addNewLine();

    final fileContent = codeLines.join('\n');

    await repositoryImplFile.writeAsString(fileContent);
  }

  static String _getRepositoryImplBody(
    GeneratedMethod method,
    String prefix,
    String sourceName,
  ) {
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

    final codeLines = List<String>.empty(growable: true);
    codeLines.addNewLine();
    codeLines.add('try {');
    codeLines.add(
        'final response = await _${sourceName}Source.${method.name}($sourceParams);');
    codeLines.add('if (response.isSuccess()) {');
    final sourceMethodDeclaration = responseName.isNotEmpty
        ? [
            'final result = _${responseName.camelCase}Mappers.mapResponseToEntity(response.data);',
            'return Result.success(result);'
          ].join('\n')
        : 'return Result.success(response.data);';
    final sourceMethod = method.sourceMethod.contains('<OperationStatus>') ||
            dataComponentRepository.isEnum(dataComponentName: responseName)
        ? 'return Result.success(response.data);'
        : sourceMethodDeclaration;
    codeLines.add(sourceMethod);
    codeLines.add('} else {');
    codeLines.add(
        'final failure = MapCommonServerError.getServerFailureDetails(response);');
    codeLines.add('return Result.error(failure: failure);');
    codeLines.add('}');
    codeLines.add('} catch (e, trace) {');
    codeLines.add(
        'logger.crash(reason: \'${method.name}_API_ERR\', error: e, stackTrace: trace);');
    codeLines.add('//TODO make repository failure');
    codeLines.add('return Result.error(');
    codeLines.add('failure: ApiFailure(');
    codeLines.add('ServerFailure.exception,');
    codeLines.add('message: e.toString(),');
    codeLines.add('),);}');
    codeLines.addNewLine();
    final methodBody = codeLines.join('\n');

    return methodBody;
  }
}
