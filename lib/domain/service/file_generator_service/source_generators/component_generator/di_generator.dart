import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/di_generator_params.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class DiGenerator implements BaseGenerationService<bool> {
  final _importsKey = '//{imports end}';
  final _dioConstKey = '//{dio const end}';
  final _sourcesKey = '//{sources end}';
  final _remoteKey = '//{remote end}';
  final _repoKey = '//{repositories end}';
  final _dioDeclaration = 'class _DioClientModule extends DioClientModule {}';

  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! DiGeneratorParams) {
      return false;
    }
    await _generateSource(params: params);

    await _generateRepository(params: params);

    await _generateRemote(params: params);

    await _generateConst(params: params);

    return true;
  }

  Future<void> _generateConst({required DiGeneratorParams params}) async {
    final filePath =
        '${params.projectPath}/${params.projectName}/lib/core/arch/data/remote/clients/dio/dio_const.dart';
    final dioConstFile = File(filePath);
    final dioConstFileContent = await dioConstFile.readAsString();

    ///code
    final codeLines = List<String>.empty(growable: true);
    codeLines.add(
        'static const String ${params.sourceName.camelCase}ApiInstance = \'${params.sourceName.camelCase}Api\';');
    codeLines.add(
        'static const String ${params.sourceName.camelCase}ApiBaseUrl = \'http://localhost:8080\';');
    codeLines.addNewLine();
    codeLines.add(_dioConstKey);
    final code = codeLines.join('\n');
    await dioConstFile.writeAsString(
      dioConstFileContent.replaceFirst(_dioConstKey, code),
    );
  }

  Future<void> _generateRemote({required DiGeneratorParams params}) async {
    final filePath =
        '${params.projectPath}/${params.projectName}/lib/core/di/remote.dart';
    final getItRemoteFile = File(filePath);
    final getItRemoteFileContent = await getItRemoteFile.readAsString();

    ///remote
    final remoteLines = List<String>.empty(growable: true);
    remoteLines.add('getIt.registerLazySingleton<ApiClient>(');
    remoteLines.add(
        ' () => dioClientModule.makeApiClient(DioConst.${params.sourceName.camelCase}ApiBaseUrl),');
    remoteLines.add(
        'instanceName: DioConst.${params.sourceName.camelCase}ApiInstance,');
    remoteLines.add(');');
    remoteLines.add(_remoteKey);

    ///dio
    final dioLines = List<String>.empty(growable: true);
    dioLines.addNewLine();
    dioLines.add('ApiClient apiClient${params.sourceName.pascalCase}() =>');
    dioLines.add(
        'GetIt.I.get<ApiClient>(instanceName: DioConst.${params.sourceName.camelCase}ApiInstance);');
    dioLines.addNewLine();
    dioLines.add(_dioDeclaration);

    final remote = remoteLines.join('\n');
    final dio = dioLines.join('\n');

    await getItRemoteFile.writeAsString(
      getItRemoteFileContent
          .replaceFirst(_remoteKey, remote)
          .replaceFirst(_dioDeclaration, dio),
    );
  }

  Future<void> _generateRepository({required DiGeneratorParams params}) async {
    final filePath =
        '${params.projectPath}/${params.projectName}/lib/core/di/repository.dart';
    final getItRepositoryFile = File(filePath);

    final getItRepositoryFileContent = await getItRepositoryFile.readAsString();
    final sourceNameSnakeCase = params.sourceName.snakeCase;

    ///imports
    final importLines = List<String>.empty(growable: true);
    importLines.add(
        'import \'package:${params.projectName}/domain/repository/$sourceNameSnakeCase/${sourceNameSnakeCase}_repository.dart\';');
    importLines.add(
        'import \'package:${params.projectName}/data/repository/$sourceNameSnakeCase/${sourceNameSnakeCase}_repository_impl.dart\';');
    importLines.add(
        'import \'package:${params.projectName}/data/source/remote/$sourceNameSnakeCase/${sourceNameSnakeCase}_source.dart\';');
    importLines.add(_importsKey);

    ///code content
    final codeLines = List<String>.empty(growable: true);
    codeLines.add(
        'getIt.registerSingleton<${params.sourceName.pascalCase}Repository>(');
    codeLines.add(
        '${params.sourceName.pascalCase}RepositoryImpl(${params.sourceName.camelCase}Source: getIt<${params.sourceName.pascalCase}Source>()),');
    codeLines.add(' );');
    codeLines.add(_repoKey);

    final imports = importLines.join('\n');
    final code = codeLines.join('\n');

    await getItRepositoryFile.writeAsString(
      getItRepositoryFileContent
          .replaceFirst(_importsKey, imports)
          .replaceFirst(_repoKey, code),
    );
  }

  Future<void> _generateSource({required DiGeneratorParams params}) async {
    final filePath =
        '${params.projectPath}/${params.projectName}/lib/core/di/source.dart';
    final getItSourceFile = File(filePath);
    final getItSourceFileContent = await getItSourceFile.readAsString();

    final sourceNameSnakeCase = params.sourceName.snakeCase;

    ///imports
    final importLines = List<String>.empty(growable: true);
    importLines.add(
        'import \'package:${params.projectName}/data/source/remote/$sourceNameSnakeCase/${sourceNameSnakeCase}_source.dart\';');
    importLines.add(
        'import \'package:${params.projectName}/data/source/remote/$sourceNameSnakeCase/${sourceNameSnakeCase}_source_impl.dart\';');
    importLines.add(_importsKey);

    ///code content
    final codeLines = List<String>.empty(growable: true);
    codeLines.add(
        'getIt.registerSingleton<${params.sourceName.pascalCase}Source>(${params.sourceName.pascalCase}SourceImpl(');
    codeLines.add(
        'getIt.get<ApiClient>(instanceName: DioConst.${params.sourceName.camelCase}ApiInstance),');
    codeLines.add('getIt.get<DioRequestProcessor>(),');
    codeLines.add('),);');
    codeLines.add(_sourcesKey);
    final imports = importLines.join('\n');
    final code = codeLines.join('\n');

    await getItSourceFile.writeAsString(
      getItSourceFileContent
          .replaceFirst(_importsKey, imports)
          .replaceFirst(_sourcesKey, code),
    );
  }
}
