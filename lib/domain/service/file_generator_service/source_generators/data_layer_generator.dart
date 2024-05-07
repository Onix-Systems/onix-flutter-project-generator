import 'dart:async';

import 'package:onix_flutter_bricks/domain/entity/source/generated_method.dart';
import 'package:onix_flutter_bricks/domain/entity/source/method_parameter.dart';
import 'package:onix_flutter_bricks/domain/entity/source/path.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/component_generator/di_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/component_generator/method_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/component_generator/repository_files_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/component_generator/source_files_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/data_layer_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/di_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/method_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/repository_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/source_generator_params.dart';
import 'package:recase/recase.dart';

class DataLayerGenerator implements BaseGenerationService<bool> {
  final _diGenerator = DiGenerator();
  final _methodGenerator = MethodGenerator();
  final _sourceFilesGenerator = SourceFilesGenerator();
  final _repositoryGenerator = RepositoryFilesGenerator();

  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! DataLayerGeneratorParams) {
      return false;
    }

    ///generate DI
    await _diGenerator.generate(
      DiGeneratorParams(
        sourceName: params.source.name,
        projectName: params.projectName,
        projectPath: params.projectPath,
      ),
    );

    final sourceMethods = <String>[];
    final implMethods = <GeneratedMethod>[];
    final pathPrefix = _getPathsPrefix(params.source.paths);

    final mutatedPathPrefix =
        pathPrefix.replaceAll('/', '_').replaceAll('-', '_').pascalCase;

    final imports = <String>{};
    final sourceStaticPaths = <String>[];
    final sourceDynamicPaths = <String>[];

    for (final path in params.source.paths) {
      for (final method in path.methods) {
        final sourceMethod = await _methodGenerator.generate(
          MethodGeneratorParams(
            method: method,
            path: path,
            pathPrefix: pathPrefix,
            source: params.source,
            projectName: params.projectName,
            imports: imports,
            projectPath: params.projectPath,
          ),
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

        final sourceParams =
            sourceMethod.split('({').last.split('})').first.split(',');

        implMethods.add(
          GeneratedMethod(
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
            optionalParams: sourceParams
                .where((e) => e.contains(' params'))
                .join(', ')
                .trim(),
            requiredParams: sourceParams
                .where((e) => e.contains('required'))
                .join(', ')
                .trim(),
          ),
        );

        if (path.path.contains('{')) {
          sourceDynamicPaths.add(_getDynamicPath(
                  dynamicPath: path.path,
                  methodType: method.methodType.name,
                  params: method.params
                      .where((e) => e.place.name == 'path')
                      .toList())
              .replaceAll(mutatedPathPrefix, ''));
        } else {
          final staticPath =
              'final _${method.methodType.name}${path.path.replaceAll('/', '_').replaceAll('-', '_').pascalCase}Path = \'${path.path}\';'
                  .replaceAll(mutatedPathPrefix, '');
          sourceStaticPaths.add(staticPath);
        }
      }
    }

    ///Generate source files
    String sourceFileContent = await _sourceFilesGenerator.generate(
      SourceGeneratorParams(
        projectPath: params.projectPath,
        projectName: params.projectName,
        sourceName: params.source.name,
        imports: imports,
        sourceMethods: sourceMethods,
        sourceStaticPaths: sourceStaticPaths,
        sourceDynamicPaths: sourceDynamicPaths,
        implMethods: implMethods,
        mutatedPathPrefix: mutatedPathPrefix,
      ),
    );

    ///Generate repositories
    await _repositoryGenerator.generate(
      RepositoryGeneratorParams(
        sourceFileContent: sourceFileContent,
        projectName: params.projectName,
        projectPath: params.projectPath,
        sourceName: params.source.name,
        mutatedPathPrefix: mutatedPathPrefix,
        imports: imports,
        implMethods: implMethods,
      ),
    );
    return true;
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
    final pathParams = params
        .map((e) => '${e.type} ${e.name.replaceAll('-', '_').camelCase}')
        .join(', ');
    return 'String _$methodType${pathName.pascalCase}Path($pathParams) => \'$dynamicPath\';';
  }
}
