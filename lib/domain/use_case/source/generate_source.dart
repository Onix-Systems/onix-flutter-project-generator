import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/path.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

class GenerateSource {
  Future<List<String>> call({
    required String projectName,
    required String projectPath,
    required SourceWrapper sourceWrapper,
    required Set<SourceWrapper> allSources,
  }) async {
    final methods = <String>[];
    final pathPrefix = _getPathsPrefix(sourceWrapper.paths);

    final imports = <String>{};

    for (final path in sourceWrapper.paths) {
      for (final method in path.methods) {
        methods.add(_generateMethod(
          method: method,
          path: path,
          pathPrefix: pathPrefix,
          sourceWrapper: sourceWrapper,
          projectName: projectName,
          imports: imports,
          allSources: allSources,
          projectPath: projectPath,
        ));
      }
    }

    final fileContent =
        '''import 'package:$projectName/core/arch/domain/entity/common/data_response.dart';
import 'package:$projectName/core/arch/domain/entity/common/operation_status.dart';
${imports.join('\n')}

abstract class ${sourceWrapper.name.pascalCase}Source {
  ${methods.join('\n  ')}
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/source/remote/${sourceWrapper.name.snakeCase}')
        .create(recursive: true);

    var file = await File('${path.path}/${sourceWrapper.name.snakeCase}.dart')
        .create();

    await file.writeAsString(fileContent);

    return methods;
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

    logger.wtf('path: $path, prefix: $prefix, pathParts: $pathParts');

    String result = pathParts.last.startsWith('{')
        ? '${pathParts.sublist(0, pathParts.length - 1).join('/').pascalCase}By${pathParts.last.replaceAll(RegExp('[{}]'), '').pascalCase}'
        : pathParts.join('/').pascalCase;

    if (result.contains('{')) {
      final resultParts = result.split('{');
      final lastPart = resultParts.last.split('}').last;

      logger.wtf('resultParts: $resultParts');
      logger.wtf('lastPart: $lastPart');

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
    if (method.responseEntityName.isNotEmpty) {
      final source = allSources.firstWhere((source) =>
          source.entities.firstWhereOrNull(
              (element) => element.name == method.responseEntityName) !=
          null);

      imports.add(
          "import 'package:$projectName/domain/entity/${source.name.snakeCase}/${method.responseEntityName.snakeCase}/${method.responseEntityName.snakeCase}.dart';");
    }

    if (method.requestEntityName.isNotEmpty) {
      final source = allSources.firstWhere((source) =>
          source.entities.firstWhereOrNull(
              (element) => element.name == method.requestEntityName) !=
          null);

      imports.add(
          "import 'package:$projectName/domain/entity/${source.name.snakeCase}/${method.requestEntityName.snakeCase}/${method.requestEntityName.snakeCase}.dart';");
    }

    final methodParamsNotRequired = _generateMethodImports(
        method, allSources, imports, projectName, projectPath, sourceWrapper);

    final methodRequestBodyPart = method.requestEntityName.isNotEmpty
        ? 'required ${method.requestEntityName} ${method.requestEntityName.camelCase}'
        : '';

    final methodRequestParamsPart = method.params.isNotEmpty
        ? method.params
            .where((param) => !param.nullable)
            .toList()
            .toString()
            .replaceAll(RegExp('[\\[\\]()]'), '')
        : '';

    String methodParams =
        '$methodRequestBodyPart${methodRequestBodyPart.isNotEmpty ? ', ' : ''}$methodRequestParamsPart${methodRequestParamsPart.isNotEmpty ? ', ' : ''}';

    final methodName =
        '${method.methodType.name}${_parsePathMethod(path.path, pathPrefix, sourceWrapper)}';

    methodParams =
        '{$methodParams${methodParamsNotRequired.isNotEmpty ? '${methodName.pascalCase}Params params,' : ''}}';

    if (methodParams == '{}') methodParams = '';

    String generatedMethod =
        'Future<${method.responseEntityName.isNotEmpty ? 'DataResponse<${method.responseEntityName}>' : 'OperationStatus'}> $methodName($methodParams);';

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

            if (source != null) {
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
class ${methodName.pascalCase}Params{
  $parameters;
  
  ${methodName.pascalCase}Params({${methodParamsNotRequired.map((param) => 'this.${param.name.camelCase.replaceAll(RegExp('[\\[\\]]'), '')}').join(',\n')}});
}    
''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/source/remote/${sourceWrapper.name.snakeCase}/params')
        .create(recursive: true);

    var file =
        await File('${path.path}/${methodName.snakeCase}_params.dart').create();

    await file.writeAsString(fileContent);
  }
}
