import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/enum.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method_parameter.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/path.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

class GenerateSource {
  Future<void> call({
    required String projectName,
    required String projectPath,
    required SourceWrapper sourceWrapper,
    required Set<SourceWrapper> allSources,
  }) async {
    final path = await Directory(
            '$projectPath/$projectName/lib/data/source/remote/${sourceWrapper.name.snakeCase}')
        .create(recursive: true);

    var file =
        await File('${path.path}/${sourceWrapper.name.snakeCase}_source.dart')
            .create();

    var implFile = await File(
            '${path.path}/${sourceWrapper.name.snakeCase}_source_impl.dart')
        .create();

    final sourceMethods = <String>[];
    final implMethods = <GeneratedMethod>[];
    final pathPrefix = _getPathsPrefix(sourceWrapper.paths);

    final mutatedPathPrefix =
        pathPrefix.replaceAll('/', '_').replaceAll('-', '_').pascalCase;

    final imports = <String>{};
    final sourceStaticPaths = <String>[];
    final sourceDynamicPaths = <String>[];

    for (final path in sourceWrapper.paths) {
      for (final method in path.methods) {
        final sourceMethod = _generateMethod(
          method: method,
          path: path,
          pathPrefix: pathPrefix,
          sourceWrapper: sourceWrapper,
          projectName: projectName,
          imports: imports,
          allSources: allSources,
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

        final responseIsEnum = _checkEntityIsEnum(
            entityName: method.responseEntityName, allSources: allSources);

        implMethods.add(GeneratedMethod(
          path: path.path,
          sourceMethod: sourceMethod,
          innerEnum: method.innerEnum,
          name: sourceMethod.split(' ')[1].split('(').first,
          methodType: method.methodType.name,
          endpoint: endpoint,
          responseEntityName: method.responseEntityName.isNotEmpty
              ? responseIsEnum
                  ? method.responseEntityName
                  : '${method.responseEntityName}Response'
              : '',
          requestEntityName: method.requestEntityName.isNotEmpty
              ? '${method.requestEntityName}Request'
              : '',
          queryParams: method.params.where((e) => e.place == 'query').toList(),
          pathParams: method.params.where((e) => e.place == 'path').toList(),
          optionalParams: params
              .where((e) => e.contains(' params'))
              .join(', ')
              .trim()
              .replaceAll(' params', '? params'),
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

    for (final method in implMethods) {
      logger.wtf(
          '${method.name}:\npathParams: ${method.pathParams}\nqueryParams: ${method.queryParams}');
      method.body =
          await _getMethodImplBody(method, allSources, mutatedPathPrefix);
    }

    String fileContent =
        '''import 'package:$projectName/core/arch/domain/entity/common/data_response.dart';
import 'package:$projectName/core/arch/domain/entity/common/operation_status.dart';
${imports.join('\n')}

abstract class ${sourceWrapper.name.pascalCase}Source {
  ${sourceMethods.join('\n  ')}
}''';

    await file.writeAsString(fileContent);

    fileContent =
        '''import 'package:$projectName/core/arch/data/remote/api_client.dart';
import 'package:$projectName/core/arch/data/remote/dio_request_processor/dio_request_processor.dart';
import 'package:$projectName/core/arch/domain/entity/common/data_response.dart';
import 'package:$projectName/core/arch/domain/entity/common/operation_status.dart';
import 'package:$projectName/data/source/remote/${sourceWrapper.name.snakeCase}/${sourceWrapper.name.snakeCase}_source.dart';
${imports.join('\n')}

class ${sourceWrapper.name.pascalCase}SourceImpl implements ${sourceWrapper.name.pascalCase}Source {

  final ApiClient _apiClient;
  final DioRequestProcessor _dioRequestProcessor;
  
  ${sourceStaticPaths.join('\n')}
    
  ${sourceWrapper.name.pascalCase}SourceImpl(this._apiClient, this._dioRequestProcessor);
  
  ${implMethods.map((e) => '''@override
        ${e.sourceMethod.replaceAll(' params', '? params').replaceAll(';', '')} async {
        ${e.body}
        }
    '''.replaceAll(('{}'), '')).join('\n')}
    
  ${sourceDynamicPaths.join('\n')}
}''';

    await implFile.writeAsString(fileContent);
  }

  String _getPathsPrefix(List<Path> paths) {
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

  String _parsePathMethod(
      String path, String prefix, SourceWrapper sourceWrapper) {
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
          '${resultParts.first}${resultParts.first.endsWith(sourceWrapper.name) ? '' : sourceWrapper.name}$lastPart';
    }

    return result.isEmpty ? prefix.replaceFirst('/', '').pascalCase : result;
  }

  String _generateMethod(
      {required Method method,
      required Path path,
      required String pathPrefix,
      required Set<String> imports,
      required String projectName,
      required String projectPath,
      required SourceWrapper sourceWrapper,
      required Set<SourceWrapper> allSources}) {
    final responseIsEnum = _checkEntityIsEnum(
        entityName: method.responseEntityName, allSources: allSources);

    if (method.responseEntityName.isNotEmpty) {
      final source = allSources.firstWhere((source) =>
          source.entities.firstWhereOrNull(
              (element) => element.name == method.responseEntityName) !=
          null);

      if (responseIsEnum) {
        imports.add(
            "import 'package:$projectName/domain/entity/${source.name.snakeCase}/${method.responseEntityName.snakeCase}/${method.responseEntityName.snakeCase}.dart';");
      } else {
        imports.add(
            "import 'package:$projectName/data/model/remote/${source.name.snakeCase}/${method.responseEntityName.snakeCase}/${method.responseEntityName.snakeCase}_response.dart';");
      }
    }

    if (method.requestEntityName.isNotEmpty) {
      final source = allSources.firstWhere((source) =>
          source.entities.firstWhereOrNull(
              (element) => element.name == method.requestEntityName) !=
          null);

      if (!(method.innerEnum != null &&
          method.requestEntityName != method.innerEnum!.name)) {
        imports.add(
            "import 'package:$projectName/data/model/remote/${source.name.snakeCase}/${method.requestEntityName.snakeCase}/${method.requestEntityName.snakeCase}_request.dart';");
      }
    }

    final methodParamsNotRequired = _generateMethodImports(
        method, allSources, imports, projectName, projectPath, sourceWrapper);

    final methodRequestBodyPart = method.requestEntityName.isNotEmpty
        ? 'required ${method.requestEntityName}Request ${method.requestEntityName.camelCase}Request'
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
        '${method.methodType.name}${_parsePathMethod(path.path, pathPrefix, sourceWrapper)}';

    methodParams =
        '{$methodParams${methodParamsNotRequired.isNotEmpty ? '${methodName.pascalCase}Params params,' : ''}}';

    if (methodParams == '{}') methodParams = '';

    String generatedMethod =
        'Future<${method.responseEntityName.isNotEmpty ? 'DataResponse<${method.responseEntityName}${responseIsEnum ? '' : 'Response'}>' : 'DataResponse<OperationStatus>'}> $methodName($methodParams);';

    if (methodParamsNotRequired.isNotEmpty) {
      imports.add(
          "import 'package:$projectName/data/source/remote/${sourceWrapper.name.snakeCase}/params/${methodName.snakeCase}_params.dart';");
      _generateMethodParamsFile(
        methodName: methodName,
        methodParamsNotRequired: methodParamsNotRequired,
        projectName: projectName,
        projectPath: projectPath,
        sourceWrapper: sourceWrapper,
        allSources: allSources,
      );
    }

    if (method.innerEnum != null) {
      imports.add(
          "import 'package:$projectName/data/model/remote/${sourceWrapper.name.snakeCase}/enums/${method.innerEnum!.name.snakeCase}.dart';");

      _generateMethodInnerEnumFile(
        innerEnum: method.innerEnum!,
        projectName: projectName,
        projectPath: projectPath,
        sourceWrapper: sourceWrapper,
      );
    }

    return generatedMethod;
  }

  Set<Property> _generateMethodImports(
      Method method,
      Set<SourceWrapper> allSources,
      Set<String> imports,
      String projectName,
      String projectPath,
      SourceWrapper sourceWrapper) {
    final methodParamsNotRequired = <Property>{};

    if (method.params.isNotEmpty) {
      for (final parameter in method.params) {
        if (parameter.type.isNotEmpty) {
          if (!parameter.nullable) {
            final source = allSources.firstWhereOrNull((source) =>
                source.entities.firstWhereOrNull(
                    (element) => element.name == parameter.type) !=
                null);

            if (source != null &&
                parameter.type.snakeCase != method.innerEnum?.name.snakeCase) {
              imports.add(
                  "import 'package:$projectName/domain/entity/${source.name.snakeCase}/${parameter.type.snakeCase}/${parameter.type.snakeCase}.dart';");
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
    required SourceWrapper sourceWrapper,
    required Set<SourceWrapper> allSources,
  }) async {
    final imports = <String>{};

    imports.add("import 'package:json_annotation/json_annotation.dart';");

    if (methodParamsNotRequired.isNotEmpty) {
      for (final parameter in methodParamsNotRequired) {
        if (parameter.type.isNotEmpty) {
          for (final source in allSources) {
            for (final entity in source.entities) {
              if (parameter.type.contains(entity.name)) {
                imports.add(
                    "import 'package:$projectName/domain/entity/${entity.entity?.sourceName.snakeCase}/${entity.name.snakeCase}/${entity.name.snakeCase}.dart';\n");
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
            '$projectPath/$projectName/lib/data/source/remote/${sourceWrapper.name.snakeCase}/params')
        .create(recursive: true);

    var file =
        await File('${path.path}/${methodName.snakeCase}_params.dart').create();

    await file.writeAsString(fileContent);
  }

  FutureOr<void> _generateMethodInnerEnumFile({
    required EnumEntity innerEnum,
    required String projectName,
    required String projectPath,
    required SourceWrapper sourceWrapper,
  }) async {
    final path = await Directory(
            '$projectPath/$projectName/lib/data/model/remote/${sourceWrapper.name.snakeCase}/enums')
        .create(recursive: true);

    var file =
        await File('${path.path}/${innerEnum.name.snakeCase}.dart').create();

    final fileContent = '''enum ${innerEnum.name.pascalCase}{
      ${innerEnum.properties.join(',\n')}
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

  Future<String> _getMethodImplBody(GeneratedMethod method,
      Set<SourceWrapper> allSources, String prefix) async {
    final isEnum = _checkEntityIsEnum(
        entityName: method.responseEntityName, allSources: allSources);

    String requiredParams = '';
    String data = '';

    if (method.requiredParams.isNotEmpty) {
      if (method.requiredParams.contains(',')) {
        requiredParams = method.requiredParams
            .split(',')
            .where((e) =>
                method.requestEntityName.isEmpty ||
                !e.contains(method.requestEntityName.camelCase))
            .map((e) => _checkEntityIsEnum(
                    entityName: e.split(' ').last.pascalCase,
                    allSources: allSources)
                ? '${e.split(' ').last}.name'
                : '${e.split(' ').last}.toString()')
            .join(', ');

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
        } else {
          requiredParams = _checkEntityIsEnum(
                  entityName: method.innerEnum != null &&
                          method.innerEnum!.name ==
                              method.requiredParams.split(' ')[1].pascalCase
                      ? method.innerEnum!.name
                      : method.requiredParams.split(' ').last.pascalCase,
                  allSources: allSources)
              ? '${method.requiredParams.split(' ').last}.name'
              : '${method.requiredParams.split(' ').last}.toString()';
        }
      }
    }

    final methodBody = '''
final request = _apiClient.client.${method.methodType}(
   ${method.endpoint.split(' ').firstWhere((e) => e.startsWith('_')).split('(').first.replaceAll(prefix, '')}${method.pathParams.isNotEmpty ? '(${method.pathParams.map((e) => e.name).join(', ')})' : ''},
   ${method.optionalParams.isNotEmpty ? 'queryParameters: params?.toJson(),' : ''}
   ${method.optionalParams.isEmpty && method.queryParams.isNotEmpty ? 'queryParameters: {${method.queryParams.map((e) => '\'${e.name}\': ${e.name}${e.type == method.innerEnum?.name ? '.name' : ''}').join(',\n')},},' : ''}
   ${data.isNotEmpty ? 'data: $data.toJson(),' : ''}
   );

 return _dioRequestProcessor.processRequest(
 onRequest: () => request,
 onResponse: (response) => ${method.responseEntityName.isNotEmpty ? '${method.responseEntityName}.${isEnum ? 'values.first' : 'fromJson(response.data)'}' : 'OperationStatus.success'},);
    ''';

    return methodBody;
  }

  bool _checkEntityIsEnum(
      {required String entityName, required Set<SourceWrapper> allSources}) {
    bool result = false;

    for (final source in allSources) {
      for (final entity in source.entities) {
        if (entity.name == entityName) {
          result = entity.isEnum;
        }
      }
    }

    return result;
  }
}

class GeneratedMethod {
  final String path;
  final String name;
  final String endpoint;
  final String methodType;
  final String sourceMethod;
  String body = '';
  final String responseEntityName;
  final String requestEntityName;
  final String requiredParams;
  final String optionalParams;
  final List<MethodParameter> queryParams;
  final List<MethodParameter> pathParams;
  final EnumEntity? innerEnum;

  GeneratedMethod({
    required this.path,
    required this.name,
    required this.endpoint,
    required this.methodType,
    required this.sourceMethod,
    required this.responseEntityName,
    required this.requestEntityName,
    required this.requiredParams,
    required this.optionalParams,
    required this.queryParams,
    required this.pathParams,
    this.innerEnum,
  });

  @override
  String toString() {
    return 'Name: $name\nPath: $path\nEndpoint: $endpoint\nMethodType: $methodType\nResponseEntityName: $responseEntityName\nBody: $body\nQueryParams: $queryParams\nRequiredParams: $requiredParams\nOptionalParams: $optionalParams';
  }
}
