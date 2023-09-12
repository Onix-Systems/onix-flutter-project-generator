import 'dart:async';

import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/domain/entity/source/method.dart';
import 'package:onix_flutter_bricks/domain/entity/source/method_parameter.dart';
import 'package:onix_flutter_bricks/domain/entity/source/path.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/di_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/generated_method.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/inner_enum_file_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params_file_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/repository_files_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/source_files_generator.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:recase/recase.dart';

class GenerateSource {
  Future<void> call({
    required String projectName,
    required String projectPath,
    required Source source,
  }) async {
    await DiGenerator.call(
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
        final sourceMethod = await _generateMethod(
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
                    params: method.params
                        .where((e) => e.place.name == 'path')
                        .toList())
                .replaceAll(mutatedPathPrefix, '')
            : 'final _${method.methodType.name}${path.path.replaceAll('/', '_').replaceAll('-', '_').replaceAll(mutatedPathPrefix, '').pascalCase}Path = \'${path.path}\';';

        final params =
            sourceMethod.split('({').last.split('})').first.split(',');

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
          queryParams:
              method.params.where((e) => e.place.name == 'query').toList(),
          pathParams:
              method.params.where((e) => e.place.name == 'path').toList(),
          optionalParams:
              params.where((e) => e.contains(' params')).join(', ').trim(),
          requiredParams:
              params.where((e) => e.contains('required')).join(', ').trim(),
        ));

        if (path.path.contains('{')) {
          sourceDynamicPaths.add(_getDynamicPath(
                  dynamicPath: path.path,
                  methodType: method.methodType.name,
                  params: method.params
                      .where((e) => e.place.name == 'path')
                      .toList())
              .replaceAll(mutatedPathPrefix, ''));
        } else {
          sourceStaticPaths.add(
              'final _${method.methodType.name}${path.path.replaceAll('/', '_').replaceAll('-', '_').pascalCase}Path = \'${path.path}\';'
                  .replaceAll(mutatedPathPrefix, ''));
        }
      }
    }

    String sourceFileContent = await SourceFilesGenerator.sourceFileGenerate(
        projectPath: projectPath,
        projectName: projectName,
        sourceName: source.name,
        imports: imports,
        sourceMethods: sourceMethods);

    await RepositoryFilesGenerator.repositoryFileGenerate(
      sourceFileContent: sourceFileContent,
      projectName: projectName,
      projectPath: projectPath,
      sourceName: source.name,
    );

    await SourceFilesGenerator.sourceImplFileGenerate(
      projectName: projectName,
      sourceName: source.name,
      imports: imports,
      sourceStaticPaths: sourceStaticPaths,
      sourceDynamicPaths: sourceDynamicPaths,
      implMethods: implMethods,
      mutatedPathPrefix: mutatedPathPrefix,
    );

    await RepositoryFilesGenerator.repositoryImplFileGenerate(
      projectPath: projectPath,
      projectName: projectName,
      sourceName: source.name,
      mutatedPathPrefix: mutatedPathPrefix,
      imports: imports,
      implMethods: implMethods,
    );
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

  Future<String> _generateMethod({
    required Method method,
    required Path path,
    required String pathPrefix,
    required Set<String> imports,
    required String projectName,
    required String projectPath,
    required Source source,
  }) async {
    final responseIsEnum = sourceRepository.checkEntityIsEnum(
        entityName: method.responseEntityName);

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
      await ParamsFileGenerator.call(
        methodName: methodName,
        methodParamsNotRequired: methodParamsNotRequired,
        projectName: projectName,
        projectPath: projectPath,
        sourceName: source.name,
        innerEnums: method.innerEnums,
      );
    }

    if (method.innerEnums.isNotEmpty) {
      for (final innerEnum in method.innerEnums) {
        imports.add(
            "import 'package:$projectName/data/model/remote/${source.name.snakeCase}/enums/${innerEnum.name.snakeCase}.dart';");

        await InnerEnumFileGenerator.call(
          innerEnum: innerEnum,
          projectName: projectName,
          projectPath: projectPath,
          sourceName: source.name,
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
}
