import 'dart:async';

import 'package:onix_flutter_bricks/domain/entity/source/method_parameter.dart';
import 'package:onix_flutter_bricks/domain/entity/source/path.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/di_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/generated_method.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/method_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/repository_files_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/source_files_generator.dart';
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
        final sourceMethod = await MethodGenerator.call(
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
      projectPath: projectPath,
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
