import 'dart:io';

import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/generated_method.dart';
import 'package:recase/recase.dart';

class SourceFilesGenerator {
  static Future<String> sourceFileGenerate({
    required String projectName,
    required String sourceName,
    required Set<String> imports,
    required List<String> sourceMethods,
  }) async {
    final path =
        await Directory('lib/data/source/remote/${sourceName.snakeCase}/')
            .create(recursive: true);

    final sourceFile =
        await File('${path.path}/${sourceName.snakeCase}_source.dart').create();

    String sourceFileContent =
        '''import 'package:$projectName/core/arch/domain/entity/common/data_response.dart';
import 'package:$projectName/core/arch/domain/entity/common/operation_status.dart';
${imports.join('\n')}

abstract class ${sourceName.pascalCase}Source {
  ${sourceMethods.join('\n  ')}
}''';

    await sourceFile.writeAsString(sourceFileContent);
    return sourceFileContent;
  }

  static Future<void> sourceImplFileGenerate({
    required String projectName,
    required String sourceName,
    required String mutatedPathPrefix,
    required Set<String> imports,
    required List<String> sourceStaticPaths,
    required List<String> sourceDynamicPaths,
    required List<GeneratedMethod> implMethods,
  }) async {
    final path =
        await Directory('lib/data/source/remote/${sourceName.snakeCase}/')
            .create(recursive: true);

    final sourceImplFile =
        await File('${path.path}/${sourceName.snakeCase}_source_impl.dart')
            .create();

    final fileContent =
        '''import 'package:$projectName/core/arch/data/remote/clients/dio/api_client.dart';
import 'package:$projectName/core/arch/data/remote/clients/dio/dio_request_processor/dio_request_processor.dart';
import 'package:$projectName/core/arch/domain/entity/common/data_response.dart';
import 'package:$projectName/core/arch/domain/entity/common/operation_status.dart';
import 'package:$projectName/data/source/remote/${sourceName.snakeCase}/${sourceName.snakeCase}_source.dart';
${imports.join('\n')}

class ${sourceName.pascalCase}SourceImpl implements ${sourceName.pascalCase}Source {

  final ApiClient _apiClient;
  final DioRequestProcessor _dioRequestProcessor;
  
  ${sourceStaticPaths.join('\n')}
    
  ${sourceName.pascalCase}SourceImpl(this._apiClient, this._dioRequestProcessor);
  
  ${implMethods.map((e) => '''@override
        ${e.sourceMethod.replaceAll(';', '')} async {
        ${_getSourceImplBody(e, mutatedPathPrefix)}
        }
    '''.replaceAll(('{}'), '')).join('\n')}
    
  ${sourceDynamicPaths.join('\n')}
}''';

    await sourceImplFile.writeAsString(fileContent);
  }

  static String _getSourceImplBody(GeneratedMethod method, String prefix) {
    final isEnum = sourceRepository.checkEntityIsEnum(
        entityName: method.responseEntityName);

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

    final methodBody = '''
final request = _apiClient.client.${method.methodType}(
   ${method.endpoint.split(' ').firstWhere((e) => e.startsWith('_')).split('(').first.replaceAll(prefix, '')}${method.pathParams.isNotEmpty ? '(${method.pathParams.map((e) => e.name).join(', ')})' : ''},
   ${method.optionalParams.isNotEmpty ? 'queryParameters: params?.toJson(),' : ''}
   ${method.optionalParams.isEmpty && method.queryParams.isNotEmpty ? 'queryParameters: {${method.queryParams.map((e) => '\'${e.name}\': ${e.name}${method.innerEnums.any((element) => element.name == e.type) ? '.name' : ''}').join(',\n')},},' : ''}
   ${data.isNotEmpty ? 'data: $data.toJson(),' : ''}
   );

 return _dioRequestProcessor.processRequest(
 onRequest: () => request,
 onResponse: (response) => ${method.responseEntityName.isNotEmpty ? '$responseEntityName.${isEnum ? 'values.first' : 'fromJson(response.data)'}' : method.responseRuntimeType.isNotEmpty ? 'response.data' : 'OperationStatus.success'},);
    ''';

    return methodBody;
  }
}
