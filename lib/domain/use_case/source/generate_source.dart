import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/path.dart';
import 'package:recase/recase.dart';

class GenerateSource {
  FutureOr<void> call({
    required String projectName,
    required String projectPath,
    required SourceWrapper sourceWrapper,
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
            imports: imports));
      }
    }

    final fileContent =
        '''import 'package:$projectName/core/arch/domain/entity/common/data_response.dart';
import 'package:new_project/core/arch/domain/entity/common/operation_status.dart';
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

  String _parsePathMethod(String path, String prefix) {
    final pathParts = path.replaceFirst(prefix, '').split('/');

    final result = pathParts.last.startsWith('{')
        ? '${pathParts.sublist(0, pathParts.length - 1).join('/').pascalCase}By${pathParts.last.replaceAll(RegExp('[{}]'), '').pascalCase}'
        : pathParts.join('/').pascalCase;

    return result.isEmpty ? prefix.replaceFirst('/', '').pascalCase : result;
  }

  String _generateMethod(
      {required Method method,
      required Path path,
      required String pathPrefix,
      required Set<String> imports,
      required String projectName,
      required SourceWrapper sourceWrapper}) {
    if (method.responseEntityName.isNotEmpty) {
      imports.add(
          "import 'package:$projectName/domain/entity/${sourceWrapper.name.snakeCase}/${method.responseEntityName.snakeCase}/${method.responseEntityName.snakeCase}.dart';");
    }

    String generatedMethod =
        'Future<${method.responseEntityName.isNotEmpty ? 'DataResponse<${method.responseEntityName}>' : 'OperationStatus'}> ${method.methodType.name}${_parsePathMethod(path.path, pathPrefix)}(${method.params.isNotEmpty ? '{${method.params.toString().replaceFirst('[', '').replaceFirst(']', '')}}' : ''});';

    return generatedMethod;
  }
}
