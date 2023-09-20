import 'dart:io';

import 'package:recase/recase.dart';

class DiGenerator {
  static Future<void> call({
    required String sourceName,
    required String projectName,
    required String projectPath,
  }) async {
    var getItSourceFile =
        File('$projectPath/$projectName/lib/core/di/source.dart');

    var getItRepositoryFile =
        File('$projectPath/$projectName/lib/core/di/repository.dart');

    var dioConstFile = File(
        '$projectPath/$projectName/lib/core/arch/data/remote/clients/dio/dio_const.dart');

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