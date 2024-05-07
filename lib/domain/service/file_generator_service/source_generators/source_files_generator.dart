import 'dart:io';

import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/generated_method.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/source_generator_params.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:recase/recase.dart';

class SourceFilesGenerator implements BaseGenerationService<String> {
  @override
  Future<String> generate(BaseGenerationParams params) async {
    if (params is! SourceGeneratorParams) {
      return '';
    }
    final sourceResult = await _sourceFileGenerate(params);

    await _sourceImplFileGenerate(params);

    return sourceResult;
  }

  Future<String> _sourceFileGenerate(SourceGeneratorParams params) async {
    final path = await Directory(
            '${params.projectPath}/${params.projectName}/lib/data/source/remote/${params.sourceName.snakeCase}/')
        .create(recursive: true);

    final sourceFile =
        await File('${path.path}/${params.sourceName.snakeCase}_source.dart')
            .create();

    final codeLines = List<String>.empty(growable: true);
    codeLines.add(
        'import \'package:${params.projectName}/core/arch/domain/entity/common/data_response.dart\';');
    codeLines.add(
        'import \'package:${params.projectName}/core/arch/domain/entity/common/operation_status.dart\';');
    codeLines.addAll(params.imports);
    codeLines.addNewLine();
    codeLines.add('abstract class ${params.sourceName.pascalCase}Source {');
    codeLines.addAll(params.sourceMethods);
    codeLines.add('}');
    codeLines.addNewLine();

    String sourceFileContent = codeLines.join('\n');

    await sourceFile.writeAsString(sourceFileContent);
    return sourceFileContent;
  }

  Future<void> _sourceImplFileGenerate(SourceGeneratorParams params) async {
    final path = await Directory(
            '${params.projectPath}/${params.projectName}/lib/data/source/remote/${params.sourceName.snakeCase}/')
        .create(recursive: true);

    final sourceImplFile = await File(
            '${path.path}/${params.sourceName.snakeCase}_source_impl.dart')
        .create();

    final codeLines = List<String>.empty(growable: true);
    //Add imports
    codeLines.add(
        'import \'package:${params.projectName}/core/arch/data/remote/clients/dio/api_client.dart\';');
    codeLines.add(
        'import \'package:${params.projectName}/core/arch/data/remote/clients/dio/dio_request_processor/dio_request_processor.dart\';');
    codeLines.add(
        'import \'package:${params.projectName}/core/arch/domain/entity/common/data_response.dart\';');
    codeLines.add(
        'import \'package:${params.projectName}/core/arch/domain/entity/common/operation_status.dart\';');
    codeLines.add(
        'import \'package:${params.projectName}/data/source/remote/${params.sourceName.snakeCase}/${params.sourceName.snakeCase}_source.dart\';');
    codeLines.addAll(params.imports);
    codeLines.addNewLine();

    ///Add file content
    codeLines.add(
        'class ${params.sourceName.pascalCase}SourceImpl implements ${params.sourceName.pascalCase}Source {');
    codeLines.addNewLine();
    codeLines.add('final ApiClient _apiClient;');
    codeLines.add('final DioRequestProcessor _dioRequestProcessor;');
    codeLines.addNewLine();
    codeLines.addAll(params.sourceStaticPaths);
    codeLines.addNewLine();
    codeLines.add(
        '${params.sourceName.pascalCase}SourceImpl(this._apiClient, this._dioRequestProcessor);');
    codeLines.addNewLine();
    final implementationMethods = params.implMethods.map(
      (e) => '''@override
        ${e.sourceMethod.replaceAll(';', '')} async {
        ${_getSourceImplBody(e, params.mutatedPathPrefix)}
        }
    '''
          .replaceAll(('{}'), ''),
    );
    codeLines.addAll(implementationMethods);
    codeLines.addNewLine();
    codeLines.addAll(params.sourceDynamicPaths);
    codeLines.add('}');
    codeLines.addNewLine();

    final fileContent = codeLines.join('\n');

    await sourceImplFile.writeAsString(fileContent);
  }

  static String _getSourceImplBody(GeneratedMethod method, String prefix) {
    final isEnum = dataComponentRepository.isEnum(
        dataComponentName: method.responseEntityName.stripRequestResponse());

    String data = '';

    if (method.requiredParams.isNotEmpty) {
      if (method.requiredParams.contains(',')) {
        if (method.requestEntityName.isNotEmpty &&
            method.requiredParams
                .contains(method.requestEntityName.camelCase)) {
          data = method.requiredParams
              .split(',')
              .where((e) =>
                  method.requestEntityName.isNotEmpty &&
                  e.contains(method.requestEntityName.camelCase))
              .first
              .split(' ')
              .last;
        }
      } else {
        if (method.requestEntityName.isNotEmpty &&
            method.requiredParams
                .contains(method.requestEntityName.camelCase)) {
          data = method.requiredParams.split(' ').last;
        }
      }
    }

    final responseEntityName =
        method.responseEntityName.endsWith('Response') || isEnum
            ? method.responseEntityName
            : '${method.responseEntityName}Response';

    final codeLines = List<String>.empty(growable: true);
    codeLines.add('final request = _apiClient.client.${method.methodType}(');
    final endpoint = method.endpoint
        .split(' ')
        .firstWhere((e) => e.startsWith('_'))
        .split('(')
        .first
        .replaceAll(prefix, '');
    final methodParams = method.pathParams.map((e) => e.name).join(', ');
    codeLines.add(
        '$endpoint${method.pathParams.isNotEmpty ? '($methodParams)' : ''},');
    codeLines.add(method.optionalParams.isNotEmpty
        ? 'queryParameters: params?.toJson(),'
        : '');
    final queryParams = method.queryParams
        .map((e) =>
            '\'${e.name}\': ${e.name}${method.innerEnums.any((element) => element.name == e.type) ? '.name' : ''}')
        .join(',\n');
    codeLines.add(
        ' ${method.optionalParams.isEmpty && method.queryParams.isNotEmpty ? 'queryParameters: {$queryParams,},' : ''}');
    codeLines.add(data.isNotEmpty ? 'data: $data.toJson(),' : '');
    codeLines.add(');');
    codeLines.addNewLine();
    codeLines.add('return _dioRequestProcessor.processRequest(');
    codeLines.add('onRequest: () => request,');
    final responseType = method.responseRuntimeType.isNotEmpty
        ? 'response.data'
        : 'OperationStatus.success';
    final responseName = isEnum ? 'values.first' : 'fromJson(response.data)';
    codeLines.add(
        'onResponse: (response) => ${method.responseEntityName.isNotEmpty ? '$responseEntityName.$responseName' : responseType},);');

    final methodBody = codeLines.join('\n');
    return methodBody;
  }
}
