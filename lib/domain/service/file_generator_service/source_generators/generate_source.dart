import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/domain/entity/source/method.dart';
import 'package:onix_flutter_bricks/domain/entity/source/method_parameter.dart';
import 'package:onix_flutter_bricks/domain/entity/source/path.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class GenerateSource {
  Future<void> call({
    required String projectName,
    required String projectPath,
    required Source source,
  }) async {
    final path = await Directory(
            '$projectPath/$projectName/lib/data/source/remote/${source.name.snakeCase}')
        .create(recursive: true);

    var sourceFile =
        await File('${path.path}/${source.name.snakeCase}_source.dart')
            .create();

    var sourceImplFile =
        await File('${path.path}/${source.name.snakeCase}_source_impl.dart')
            .create();

    final repositoryPath = await Directory(
            '$projectPath/$projectName/lib/domain/repository/${source.name.snakeCase}')
        .create(recursive: true);

    final repositoryImplPath = await Directory(
            '$projectPath/$projectName/lib/data/repository/${source.name.snakeCase}')
        .create(recursive: true);

    var repositoryFile = await File(
            '${repositoryPath.path}/${source.name.snakeCase}_repository.dart')
        .create();

    var repositoryImplFile = await File(
            '${repositoryImplPath.path}/${source.name.snakeCase}_repository_impl.dart')
        .create();

    await _generateDI(
      sourceName: source.name,
      projectName: projectName,
      projectPath: projectPath,
    );

    final sourceMethods = <String>[];
    final implMethods = <GeneratedMethod>[];
    final pathPrefix = _getPathsPrefix(source.paths);

    final mutatedPathPrefix =
        pathPrefix.replaceAll('/', '_').replaceAll('-', '_').pascalCase;

    final imports = <String>{};
    final sourceStaticPaths = <String>[];
    final sourceDynamicPaths = <String>[];

    for (final path in source.paths) {
      for (final method in path.methods) {
        final sourceMethod = _generateMethod(
          method: method,
          path: path,
          pathPrefix: pathPrefix,
          source: source,
          projectName: projectName,
          imports: imports,
          projectPath: projectPath,
        );

        sourceMethods.add(sourceMethod);

        final endpoint = path.path.contains('{')
            ? _getDynamicPath(
                    dynamicPath: path.path,
                    methodType: method.methodType.name,
                    params:
                        method.params.where((e) => e.place == 'path').toList())
                .replaceAll(mutatedPathPrefix, '')
            : 'final _${method.methodType.name}${path.path.replaceAll('/', '_').replaceAll('-', '_').replaceAll(mutatedPathPrefix, '').pascalCase}Path = \'${path.path}\';';

        final params = sourceMethod
            .split('(')
            .last
            .split(')')
            .first
            .split('{')
            .last
            .split('}')
            .first
            .split(',');

        implMethods.add(GeneratedMethod(
          path: path.path,
          sourceMethod: sourceMethod,
          innerEnums: method.innerEnums,
          name: sourceMethod.split('> ')[1].split('(').first,
          methodType: method.methodType.name,
          endpoint: endpoint,
          responseEntityName: method.responseEntityName,
          requestEntityName: method.requestEntityName,
          responseRuntimeType: method.responseRuntimeType,
          queryParams: method.params.where((e) => e.place == 'query').toList(),
          pathParams: method.params.where((e) => e.place == 'path').toList(),
          optionalParams: params
              .where((e) => e.contains(' params'))
              .join(', ')
              .trim() /*.replaceAll(' params', '? params')*/,
          requiredParams:
              params.where((e) => e.contains('required')).join(', ').trim(),
        ));

        if (path.path.contains('{')) {
          sourceDynamicPaths.add(_getDynamicPath(
                  dynamicPath: path.path,
                  methodType: method.methodType.name,
                  params:
                      method.params.where((e) => e.place == 'path').toList())
              .replaceAll(mutatedPathPrefix, ''));
        } else {
          sourceStaticPaths.add(
              'final _${method.methodType.name}${path.path.replaceAll('/', '_').replaceAll('-', '_').pascalCase}Path = \'${path.path}\';'
                  .replaceAll(mutatedPathPrefix, ''));
        }
      }
    }

    String fileContent =
        '''import 'package:$projectName/core/arch/domain/entity/common/data_response.dart';
import 'package:$projectName/core/arch/domain/entity/common/operation_status.dart';
${imports.join('\n')}

abstract class ${source.name.pascalCase}Source {
  ${sourceMethods.join('\n  ')}
}''';

    await sourceFile.writeAsString(fileContent);

    fileContent = fileContent
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

    fileContent =
        '''import 'package:$projectName/core/arch/data/remote/api_client.dart';
import 'package:$projectName/core/arch/data/remote/dio_request_processor/dio_request_processor.dart';
import 'package:$projectName/core/arch/domain/entity/common/data_response.dart';
import 'package:$projectName/core/arch/domain/entity/common/operation_status.dart';
import 'package:$projectName/data/source/remote/${source.name.snakeCase}/${source.name.snakeCase}_source.dart';
${imports.join('\n')}

class ${source.name.pascalCase}SourceImpl implements ${source.name.pascalCase}Source {

  final ApiClient _apiClient;
  final DioRequestProcessor _dioRequestProcessor;
  
  ${sourceStaticPaths.join('\n')}
    
  ${source.name.pascalCase}SourceImpl(this._apiClient, this._dioRequestProcessor);
  
  ${implMethods.map((e) => '''@override
        ${e.sourceMethod.replaceAll(';', '')} async {
        ${_getSourceImplBody(e, mutatedPathPrefix)}
        }
    '''.replaceAll(('{}'), '')).join('\n')}
    
  ${sourceDynamicPaths.join('\n')}
}''';

    await sourceImplFile.writeAsString(fileContent);

    final mappers = <String>{};
    final mappersImports = <String>{};

    for (final method in implMethods) {
      if (method.responseEntityName.isNotEmpty) {
        if (_checkEntityIsEnum(
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

    fileContent =
        '''import 'package:$projectName/core/arch/data/remote/base/map_common_server_error.dart';
import 'package:$projectName/core/arch/domain/entity/common/result.dart';
import 'package:$projectName/core/di/app.dart';
import 'package:$projectName/core/extension/logger_extension.dart';
import 'package:$projectName/core/arch/domain/entity/failure/api_failure.dart';
import 'package:$projectName/core/arch/domain/entity/common/operation_status.dart';
import 'package:$projectName/data/source/remote/${source.name.snakeCase}/${source.name.snakeCase}_source.dart';
import 'package:$projectName/domain/repository/${source.name.snakeCase}/${source.name.snakeCase}_repository.dart';
${imports.map((import) {
      if (import.contains('_response.dart')) {
        return import
            .replaceAll('_response.dart', '.dart')
            .replaceAll('data/model/remote/', 'domain/entity/');
      }
      return import;
    }).join('\n')}
    
${mappersImports.join('\n')}

class ${source.name.pascalCase}RepositoryImpl implements ${source.name.pascalCase}Repository {
  
  final ${source.name.pascalCase}Source _${source.name.camelCase}Source;
  
  ${mappers.join('\n')}
  
  ${source.name.pascalCase}RepositoryImpl({
    required ${source.name.pascalCase}Source ${source.name.camelCase}Source,
  }) : _${source.name.camelCase}Source = ${source.name.camelCase}Source;
  
  ${implMethods.map((e) => '''@override
        ${e.sourceMethod.replaceAll('DataResponse', 'Result').replaceAll('Response>>', '>>') /*.replaceAll(' params', '? params')*/
                .replaceAll(';', '')} async {
        ${_getRepositoryImplBody(e, mutatedPathPrefix, source.name.camelCase)}
        }
    '''.replaceAll(('{}'), '')).join('\n')}
}''';

    await repositoryImplFile.writeAsString(fileContent);
  }

  String _getPathsPrefix(List<Path> paths) {
    if (paths.isEmpty) {
      return '/';
    }

    final sortedPaths = paths.map((e) => e.path.replaceFirst('/', '')).toList();

    sortedPaths
        .sort((a, b) => a.split('/').length.compareTo(b.split('/').length));

    final pathParts = sortedPaths.first.split('/');

    String prefix = '';

    for (var i = 0; i <= pathParts.length; i++) {
      if (sortedPaths.every(
          (element) => element.startsWith(pathParts.sublist(0, i).join('/')))) {
        prefix = pathParts.sublist(0, i).join('/');
      }
    }

    return '/$prefix';
  }

  String _parsePathMethod(String path, String prefix, Source source) {
    final pathParts = <String>[];

    if (prefix.contains('{')) {
      pathParts.addAll(prefix.split('/'));
    } else {
      pathParts.addAll(path.replaceFirst(prefix, '').split('/'));
    }

    String result = pathParts.last.startsWith('{')
        ? '${pathParts.sublist(0, pathParts.length - 1).join('/').pascalCase}By${pathParts.last.replaceAll(RegExp('[{}]'), '').pascalCase}'
        : pathParts.join('/').pascalCase;

    if (result.contains('{')) {
      final resultParts = result.split('{');
      final lastPart = resultParts.last.split('}').last;

      result =
          '${resultParts.first}${resultParts.first.endsWith(source.name) ? '' : source.name}$lastPart';
    }

    return result.isEmpty ? prefix.replaceFirst('/', '').pascalCase : result;
  }

  String _generateMethod({
    required Method method,
    required Path path,
    required String pathPrefix,
    required Set<String> imports,
    required String projectName,
    required String projectPath,
    required Source source,
  }) {
    final responseIsEnum =
        _checkEntityIsEnum(entityName: method.responseEntityName);

    final responseEntityName =
        method.responseEntityName.endsWith('Response') || responseIsEnum
            ? method.responseEntityName
            : '${method.responseEntityName}Response';

    final requestEntityName =
        method.requestEntityName.endsWith('Request') || responseIsEnum
            ? method.requestEntityName
            : '${method.requestEntityName}Request';

    if (method.responseEntityName.isNotEmpty) {
      final sourceName = sourceRepository
          .getDataComponentSourceName(method.responseEntityName);

      if (responseIsEnum) {
        imports.add(
            "import 'package:$projectName/domain/entity/${sourceName.snakeCase}/${method.responseEntityName.stripRequestResponse().snakeCase}/${method.responseEntityName.snakeCase}.dart';");
      } else {
        imports.add(
            "import 'package:$projectName/data/model/remote/${sourceName.snakeCase}/${method.responseEntityName.stripRequestResponse().snakeCase}/${responseEntityName.snakeCase}.dart';");
      }
    }

    if (method.requestEntityName.isNotEmpty) {
      final sourceName =
          sourceRepository.getDataComponentSourceName(method.requestEntityName);

      if (!(method.innerEnums.isNotEmpty &&
          !method.innerEnums
              .any((element) => element.name == method.requestEntityName))) {
        imports.add(
            "import 'package:$projectName/data/model/remote/${sourceName.snakeCase}/${method.requestEntityName.stripRequestResponse().snakeCase}/${requestEntityName.snakeCase}.dart';");
      }
    }

    final methodParamsNotRequired =
        _generateMethodImports(method, imports, projectName, projectPath);

    final methodRequestBodyPart = method.requestEntityName.isNotEmpty
        ? 'required ${method.requestEntityName.endsWith('Request') ? method.requestEntityName : '${method.requestEntityName}Request'} ${method.requestEntityName.camelCase}'
        : '';

    final methodRequestParamsPart = method.params.isNotEmpty
        ? method.params
            .where((param) => !param.nullable)
            .map((param) => 'required ${param.type} ${param.name.camelCase}')
            .join(', ')
        : '';

    String methodParams =
        '$methodRequestBodyPart${methodRequestBodyPart.isNotEmpty ? ', ' : ''}$methodRequestParamsPart${methodRequestParamsPart.isNotEmpty ? ', ' : ''}';

    final methodName =
        '${method.methodType.name}${_parsePathMethod(path.path, pathPrefix, source)}';

    methodParams =
        '{$methodParams${methodParamsNotRequired.isNotEmpty ? '${methodName.pascalCase}Params? params,' : ''}}';

    if (methodParams == '{}') methodParams = '';

    String generatedMethod =
        'Future<${method.responseEntityName.isNotEmpty ? 'DataResponse<$responseEntityName>' : method.responseRuntimeType.isNotEmpty ? 'DataResponse<${method.responseRuntimeType}>' : 'DataResponse<OperationStatus>'}> $methodName($methodParams);';

    if (methodParamsNotRequired.isNotEmpty) {
      imports.add(
          "import 'package:$projectName/data/source/remote/${source.name.snakeCase}/params/${methodName.snakeCase}_params.dart';");
      _generateMethodParamsFile(
        methodName: methodName,
        methodParamsNotRequired: methodParamsNotRequired,
        projectName: projectName,
        projectPath: projectPath,
        source: source,
        innerEnums: method.innerEnums,
      );
    }

    if (method.innerEnums.isNotEmpty) {
      for (final innerEnum in method.innerEnums) {
        imports.add(
            "import 'package:$projectName/data/model/remote/${source.name.snakeCase}/enums/${innerEnum.name.snakeCase}.dart';");

        _generateMethodInnerEnumFile(
          innerEnum: innerEnum,
          projectName: projectName,
          projectPath: projectPath,
          source: source,
        );
      }
    }

    return generatedMethod;
  }

  Set<Property> _generateMethodImports(Method method, Set<String> imports,
      String projectName, String projectPath) {
    final methodParamsNotRequired = <Property>{};

    if (method.params.isNotEmpty) {
      for (final parameter in method.params) {
        if (parameter.type.isNotEmpty) {
          if (!parameter.nullable) {
            /*final sourceName = sourceRepository.sources
                .firstWhereOrNull((source) =>
                    source.dataComponents.firstWhereOrNull(
                        (element) => element.name == parameter.type) !=
                    null)
                ?.name;*/

            final sourceName = sourceRepository
                .getDataComponentSourceName(parameter.type.snakeCase);

            if (sourceName.isNotEmpty &&
                !method.innerEnums.any((element) =>
                    element.name.snakeCase == parameter.type.snakeCase)) {
              imports.add(
                  "import 'package:$projectName/domain/entity/${sourceName.snakeCase}/${parameter.type.snakeCase}/${parameter.type.snakeCase}.dart';");
            }
          } else {
            methodParamsNotRequired.add(parameter);
          }
        }
      }
    }

    return methodParamsNotRequired;
  }

  FutureOr<void> _generateMethodParamsFile({
    required String methodName,
    required Set<Property> methodParamsNotRequired,
    required String projectName,
    required String projectPath,
    required Source source,
    required List<DataComponent> innerEnums,
  }) async {
    final imports = <String>{};

    imports.add("import 'package:json_annotation/json_annotation.dart';");

    if (methodParamsNotRequired.isNotEmpty) {
      for (final parameter in methodParamsNotRequired) {
        if (parameter.type.isNotEmpty) {
          for (final importSource in sourceRepository.sources) {
            for (final entity in importSource.dataComponents) {
              if (parameter.type.contains(entity.name)) {
                innerEnums.map((e) => e.name).contains(entity.name)
                    ? imports.add(
                        "import 'package:$projectName/data/model/remote/${entity.sourceName.snakeCase}/enums/${entity.name.snakeCase}.dart';\n")
                    : imports.add(
                        "import 'package:$projectName/domain/entity/${entity.sourceName.snakeCase}/${entity.name.snakeCase}/${entity.name.snakeCase}.dart';\n");
              }
            }
          }
        }
      }
    }

    final parameters = methodParamsNotRequired
        .map((param) =>
            '${TypeMatcher.getDartType(param.type)}? ${param.name.camelCase.replaceAll(RegExp('[\\[\\]]'), '')}')
        .join(';\n');

    final fileContent = '''${imports.map((e) => e).join('')}
    
part '${methodName.snakeCase}_params.g.dart';

@JsonSerializable()
class ${methodName.pascalCase}Params{
  $parameters;
  
  ${methodName.pascalCase}Params({${methodParamsNotRequired.map((param) => 'this.${param.name.camelCase.replaceAll(RegExp('[\\[\\]]'), '')}').join(',\n')}});
        
  Map<String, dynamic> toJson() => _\$${methodName.pascalCase}ParamsToJson(this);
}    
''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/source/remote/${source.name.snakeCase}/params')
        .create(recursive: true);

    var file =
        await File('${path.path}/${methodName.snakeCase}_params.dart').create();

    await file.writeAsString(fileContent);
  }

  FutureOr<void> _generateMethodInnerEnumFile({
    required DataComponent innerEnum,
    required String projectName,
    required String projectPath,
    required Source source,
  }) async {
    final path = await Directory(
            '$projectPath/$projectName/lib/data/model/remote/${source.name.snakeCase}/enums')
        .create(recursive: true);

    var file =
        await File('${path.path}/${innerEnum.name.snakeCase}.dart').create();

    final fileContent = '''enum ${innerEnum.name.pascalCase}{
      ${innerEnum.properties.map((e) => e.name.snakeCase).join(',\n')}
    }''';

    await file.writeAsString(fileContent);
  }

  String _getDynamicPath(
      {required String dynamicPath,
      required String methodType,
      required List<MethodParameter> params}) {
    String pathName = dynamicPath.replaceAll('/', '_').replaceAll('-', '_');

    final splittedPath = dynamicPath.split('/');

    for (final part in splittedPath) {
      if (part.contains('{')) {
        dynamicPath = dynamicPath.replaceAll('{', '\$').replaceAll('}', '');
      }
    }

    for (String part in pathName.split('_')) {
      if (part.contains('{')) {
        String partReplace = part;

        if (part == pathName.split('_').last) {
          partReplace = 'by_$partReplace';
        } else {
          partReplace = '';
        }

        partReplace =
            partReplace.replaceAll('{', '').replaceAll('}', '').pascalCase;
        pathName = pathName.replaceFirst(part, partReplace);
      }
    }

    return 'String _$methodType${pathName.pascalCase}Path(${params.map((e) => '${e.type} ${e.name.replaceAll('-', '_').camelCase}').join(', ')}) => \'$dynamicPath\';';
  }

  String _getSourceImplBody(GeneratedMethod method, String prefix) {
    final isEnum = _checkEntityIsEnum(entityName: method.responseEntityName);

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

  String _getRepositoryImplBody(
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
        ${method.sourceMethod.contains('<OperationStatus>') || _checkEntityIsEnum(entityName: responseName) ? 'return Result.success(response.data);' : responseName.isNotEmpty ? '''final result = _${responseName.camelCase}Mappers.mapResponseToEntity(response.data);
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

  bool _checkEntityIsEnum({required String entityName}) {
    bool result = false;

    for (final source in sourceRepository.sources) {
      for (final entity in source.dataComponents) {
        if (entity.name == entityName) {
          result = entity.isEnum;
        }
      }
    }

    if (sourceRepository.sources.any((element) => element.paths.any((path) =>
        path.methods.any((method) => method.innerEnums
            .any((innerEnum) => innerEnum.name == entityName))))) {
      result = true;
    }
    return result;
  }

  Future<void> _generateDI({
    required String sourceName,
    required String projectName,
    required String projectPath,
  }) async {
    var getItSourceFile =
        File('$projectPath/$projectName/lib/core/di/source.dart');

    var getItRepositoryFile =
        File('$projectPath/$projectName/lib/core/di/repository.dart');

    var dioConstFile = File(
        '$projectPath/$projectName/lib/core/arch/data/remote/dio_const.dart');

    var getItSourceFileContent = await getItSourceFile.readAsString();

    await getItSourceFile.writeAsString(getItSourceFileContent.replaceFirst(
        '//{imports end}',
        '''import 'package:$projectName/data/source/remote/${sourceName.snakeCase}/${sourceName.snakeCase}_source.dart';
import 'package:$projectName/data/source/remote/${sourceName.snakeCase}/${sourceName.snakeCase}_source_impl.dart';
//{imports end}''').replaceFirst(')); //{sources end}', '''))
        ..registerSingleton<${sourceName.pascalCase}Source>(${sourceName.pascalCase}SourceImpl(
       getIt.get<ApiClient>(instanceName: DioConst.${sourceName.camelCase}ApiInstance),
       getIt.get<DioRequestProcessor>(),
     )); //{sources end}'''));

    var dioConstFileContent = await dioConstFile.readAsString();

    await dioConstFile.writeAsString(dioConstFileContent.replaceFirst(
        '//{dio const end}',
        '''static const String ${sourceName.camelCase}ApiInstance = '${sourceName.snakeCase}Api';
static const String ${sourceName.camelCase}ApiBaseUrl = 'http://localhost:8080';

//{dio const end}'''));

    var getItRepositoryFileContent = await getItRepositoryFile.readAsString();

    await getItRepositoryFile.writeAsString(getItRepositoryFileContent.replaceFirst(
        '//{imports end}',
        '''import 'package:$projectName/domain/repository/${sourceName.snakeCase}/${sourceName.snakeCase}_repository.dart';
import 'package:$projectName/data/repository/${sourceName.snakeCase}/${sourceName.snakeCase}_repository_impl.dart';
import 'package:$projectName/data/source/remote/${sourceName.snakeCase}/${sourceName.snakeCase}_source.dart';
//{imports end}''').replaceFirst('); //{repositories end}', ''')
        ..registerSingleton<${sourceName.pascalCase}Repository>(
       ${sourceName.pascalCase}RepositoryImpl(${sourceName.camelCase}Source: getIt<${sourceName.pascalCase}Source>()),
     ); //{repositories end}'''));
  }
}

class GeneratedMethod {
  final String path;
  final String name;
  final String endpoint;
  final String methodType;
  final String sourceMethod;
  final String responseEntityName;
  final String requestEntityName;
  final String responseRuntimeType;
  final String requiredParams;
  final String optionalParams;
  final List<MethodParameter> queryParams;
  final List<MethodParameter> pathParams;
  final List<DataComponent> innerEnums;

  GeneratedMethod({
    required this.path,
    required this.name,
    required this.endpoint,
    required this.methodType,
    required this.sourceMethod,
    required this.responseEntityName,
    required this.requestEntityName,
    this.responseRuntimeType = '',
    required this.requiredParams,
    required this.optionalParams,
    required this.queryParams,
    required this.pathParams,
    this.innerEnums = const [],
  });

  @override
  String toString() {
    return 'Name: $name\nPath: $path\nEndpoint: $endpoint\nMethodType: $methodType\nResponseEntityName: $responseEntityName\nQueryParams: $queryParams\nRequiredParams: $requiredParams\nOptionalParams: $optionalParams';
  }
}
