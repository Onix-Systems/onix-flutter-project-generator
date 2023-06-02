import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:recase/recase.dart';

class GenerateSourceImpl {
  Future<void> call({
    required String projectName,
    required String projectPath,
    required SourceWrapper sourceWrapper,
    required Set<SourceWrapper> allSources,
  }) async {
    final path = Directory(
        '$projectPath/$projectName/lib/data/source/remote/${sourceWrapper.name.snakeCase}');

    final sourceStaticPaths = <String>[];
    final sourceDynamicPaths = <String>[];

    for (final path in sourceWrapper.paths) {
      if (path.path.contains('{')) {
        sourceDynamicPaths.add(path.path);
      } else {
        final pathName = path.path.replaceAll('/', '_').replaceAll('-', '_');
        for (final method in path.methods) {
          sourceStaticPaths.add(
              'final _${method.methodType.name}${pathName.pascalCase} = \'${path.path}\';');
        }
      }
    }

    logger.wtf(
        'sourceStaticPaths: $sourceStaticPaths, sourceDynamicPaths: $sourceDynamicPaths');

    var file =
        await File('${path.path}/${sourceWrapper.name.snakeCase}_impl.dart')
            .create();

    final sourceFile =
        File('${path.path}/${sourceWrapper.name.snakeCase}.dart');

    final sourceMethods = await _generateMethods(sourceFile: sourceFile);

    final imports = await _getImports(sourceFile, path);

    final fileContent =
        '''import 'package:$projectName/core/arch/data/remote/api_client.dart';
import 'package:$projectName/core/arch/data/remote/dio_request_processor/dio_request_processor.dart';
import 'package:$projectName/data/source/remote/${sourceWrapper.name.snakeCase}/${sourceWrapper.name.snakeCase}.dart';
$imports

class ${sourceWrapper.name.pascalCase}SourceImpl implements ${sourceWrapper.name.pascalCase}Source {

  final ApiClient _apiClient;
  final DioRequestProcessor _dioRequestProcessor;
  
  ${sourceStaticPaths.join('\n  ')}
  
  ${sourceWrapper.name.pascalCase}SourceImpl(this._apiClient, this._dioRequestProcessor);
  
  ${sourceMethods.join('\n  ')}
}''';

    await file.writeAsString(fileContent);
  }

  Future<List<String>> _generateMethods({required File sourceFile}) async {
    final methods = <String>[];

    final lines = await sourceFile.readAsLines();

    final filteredLines = lines.where((element) => element.contains('Future<'));

    String getReturnType(String line) {
      final returnType =
          line.trim().split(' ').first.split('<').last.split('>').first;

      return '\nreturn DataResponse.success($returnType.empty());';
    }

    const operationStatusReturn = '\nreturn OperationStatus.success;';

    methods.addAll(filteredLines.map((e) =>
        '@override\n${e.trim().replaceFirst(';', ' async {${e.contains('OperationStatus') ? operationStatusReturn : getReturnType(e)}}').replaceAll(' params', '? params')}'));

    return methods;
  }

  Future<String> _getImports(File sourceFile, Directory folder) async {
    final lines = await sourceFile.readAsLines();

    final filteredLines = lines.where((element) => element.contains('import'));

    return filteredLines.join('\n');
  }
}
