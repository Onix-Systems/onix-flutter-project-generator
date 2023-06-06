import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_wrapper/entity_wrapper.dart';
import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/method.dart';
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
        for (final method in path.methods) {
          sourceDynamicPaths.add(_getDynamicPath(
              dynamicPath: path.path, methodType: method.methodType.name));
        }
      } else {
        final pathName = path.path.replaceAll('/', '_').replaceAll('-', '_');
        for (final method in path.methods) {
          sourceStaticPaths.add(
              'final _${method.methodType.name}${pathName.pascalCase}Path = \'${path.path}\';');
        }
      }
    }

    var file =
        await File('${path.path}/${sourceWrapper.name.snakeCase}_impl.dart')
            .create();

    final sourceFile =
        File('${path.path}/${sourceWrapper.name.snakeCase}.dart');

    final sourceMethods =
        await _generateMethods(sourceFile: sourceFile, allSources: allSources);

    final imports = await _getImports(sourceFile, path);

    final fileContent =
        '''import 'package:$projectName/core/arch/data/remote/api_client.dart';
import 'package:$projectName/core/arch/data/remote/dio_request_processor/dio_request_processor.dart';
import 'package:$projectName/data/source/remote/${sourceWrapper.name.snakeCase}/${sourceWrapper.name.snakeCase}.dart';
$imports

class ${sourceWrapper.name.pascalCase}SourceImpl implements ${sourceWrapper.name.pascalCase}Source {

  final ApiClient _apiClient;
  final DioRequestProcessor _dioRequestProcessor;
  
  ${sourceStaticPaths.join('\n')}
  
  ${sourceWrapper.name.pascalCase}SourceImpl(this._apiClient, this._dioRequestProcessor);
  
  ${sourceMethods.join('\n')}
  
  ${sourceDynamicPaths.join('\n')}
}''';

    await file.writeAsString(fileContent);
  }

  Future<List<String>> _generateMethods(
      {required File sourceFile,
      required Set<SourceWrapper> allSources}) async {
    final methods = <String>[];

    final lines = await sourceFile.readAsLines();

    final filteredLines = lines.where((element) => element.contains('Future<'));

    const operationStatusReturn = '\nreturn OperationStatus.success;';

    for (final line in filteredLines) {
      final methodBody = await getMethodBody(line, allSources);
      methods.add(
          '@override\n${line.trim().replaceFirst(';', ' async {${line.contains('OperationStatus') ? operationStatusReturn : methodBody}}').replaceAll(' params,', '? params,')}');
    }

    methods.addAll(filteredLines.map((e) {
      return '';
    }));

    return methods;
  }

  Future<String> _getImports(File sourceFile, Directory folder) async {
    final lines = await sourceFile.readAsLines();

    final filteredLines = lines.where((element) => element.contains('import'));

    return filteredLines.join('\n');
  }

  Future<String> getMethodBody(
      String line, Set<SourceWrapper> allSources) async {
    final returnType =
        line.trim().split(' ').first.split('<').last.split('>').first;

    final isEnum = await _checkEntityIsEnum(
        entityName: returnType, allSources: allSources);

    final methodBody = '''
final request = _apiClient.client.get(
   _getApiActivityEntriesPath,
   queryParameters: params?.toJson(),
 );

 return _dioRequestProcessor.processRequest(
 onRequest: () => request,
 onResponse: (response) => $returnType.${isEnum ? 'values.first' : 'fromJson(response.data)'},
 );
    ''';

    return methodBody;

    //return '\nreturn DataResponse.success($returnType.${isEnum ? 'values.first' : 'fromJson()'});';
  }

  Future<bool> _checkEntityIsEnum(
      {required String entityName,
      required Set<SourceWrapper> allSources}) async {
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

  String _getDynamicPath(
      {required String dynamicPath, required String methodType}) {
    String pathName = dynamicPath.replaceAll('/', '_').replaceAll('-', '_');

    final splittedPath = dynamicPath.split('/');

    final params = splittedPath
        .where((element) => element.contains('{'))
        .map((e) => e.replaceAll('{', '').replaceAll('}', ''))
        .toList();

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

    return 'String _$methodType${pathName.pascalCase}Path(${params.map((e) => 'String ${e.replaceAll('-', '_').camelCase}').join(', ')}) => \'${dynamicPath.split('/').map((e) => e.replaceAll('-', '_').camelCase).join('/')}\';';
  }
}
