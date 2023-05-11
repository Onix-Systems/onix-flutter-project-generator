import 'dart:convert';

import 'package:mason/mason.dart';
import 'dart:io';
import 'package:process_run/shell.dart';
import 'package:recase/recase.dart';

late final String projectName;
late final String sourceName;
late final bool sourceExists;
late final bool repositoryExists;

extension LogString on String {
  void log() {
    print('{#info}$this');
  }

  void error() {
    print('{#error}$this');
  }
}

void run(HookContext context) async {
  projectName = context.vars['projectName'];
  sourceName = context.vars['source_name'].toString().toSnakeCase;
  sourceExists = context.vars['source_exists'];
  repositoryExists = context.vars['repository_exists'];

  if (sourceName.isNotEmpty && !sourceExists)
    await Directory('lib/data/source/remote/${sourceName.toSnakeCase}')
        .create();

  await Directory(
          'lib/domain/entity/${sourceName.isNotEmpty ? '${sourceName.toSnakeCase}' : ''}')
      .create();
  await Directory(
          'lib/data/mapper/${sourceName.isNotEmpty ? '${sourceName.toSnakeCase}' : ''}')
      .create();
  await Directory(
          'lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName.toSnakeCase}' : ''}')
      .create();

  List<Entity> entities = [];

  if (context.vars['entities'].toString().contains('}, {')) {
    var inputEntities = context.vars['entities'].toString().split(', ');
    entities.addAll(List.generate(inputEntities.length,
        (index) => Entity.fromJson(jsonDecode(inputEntities[index]))));
  } else {
    entities.add(Entity.fromJson((context.vars['entities'])));
  }

  for (var entity in entities) {
    await _genEntity(context, entity);

    if (entity.generateResponse) {
      await _genResponse(entity);
    }

    if (entity.generateRequest) {
      await _genRequest(entity);
    }

    if (entity.generateRequest || entity.generateResponse) {
      await _genMapper(entity);
    }
  }

  if (sourceName.isNotEmpty) {
    await _genSource(entities);
    if (context.vars['repository_exists'] || entities.length > 1) {
      await _genRepository(entities);
    }
  }

  if (context.vars['build']) {
    var buildProcess = await Process.start('flutter', [
      'pub',
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs'
    ]);

    buildProcess.outLines.forEach((element) {
      print(element);
    });

    buildProcess.errLines.forEach((element) {
      print(element);
    });

    buildProcess.exitCode.then((value) {
      print('{#info}Exit code: $value');
    });
  }

  await Process.run('flutter', ['format', '.']);
  await Process.run('rm', ['-r', 'gen']);
}

Future<void> _genEntity(HookContext context, Entity entity) async {
  final path = await Directory(
          'lib/domain/entity/${sourceName.isNotEmpty ? '${sourceName}/' : '/'}${entity.name}')
      .create();
  var file = await File('${path.path}/${entity.name}.dart').create();

  String sourcePath = 'gen/freezed_entity.tmp';

  if (entity.classBody.isNotEmpty) {
    sourcePath = 'gen/swagger_entity.tmp';
  }

  var sourceFile = await File(sourcePath).readAsString();

  await file.writeAsString(sourceFile
      .replaceAll('\${className.snakeCase}', entity.name)
      .replaceAll('\${className.pascalCase}', entity.name.toPascalCase)
      .replaceAll('\${classBody}', entity.classBody.replaceAll('\$\$', '\'')));
}

Future<void> _genResponse(Entity entity) async {
  final path = await Directory(
          'lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName}/' : '/'}${entity.name}')
      .create();
  var file = await File('${path.path}/${entity.name}_response.dart').create();

  String sourcePath = 'gen/freezed_response.tmp';

  var sourceFile = await File(sourcePath).readAsString();

  await file.writeAsString(sourceFile
      .replaceAll('\${className.snakeCase}', entity.name)
      .replaceAll('\${className.pascalCase}', entity.name.toPascalCase));
}

Future<void> _genRequest(Entity entity) async {
  final path = await Directory(
          'lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName}/' : '/'}${entity.name}')
      .create();
  var file = await File('${path.path}/${entity.name}_request.dart').create();

  String sourcePath = 'gen/freezed_request.tmp';

  var sourceFile = await File(sourcePath).readAsString();

  await file.writeAsString(sourceFile
      .replaceAll('\${className.snakeCase}', entity.name)
      .replaceAll('\${className.pascalCase}', entity.name.toPascalCase));
}

Future<void> _genMapper(Entity entity) async {
  final path = await Directory(
          'lib/data/mapper/${sourceName.isNotEmpty ? '$sourceName/' : '/'}${entity.name}')
      .create();
  var file = await File('${path.path}/${entity.name}_mapper.dart').create();

  String sourcePath = 'gen/mapper.tmp';

  if (!entity.generateRequest) {
    sourcePath = 'gen/response_mapper.tmp';
  } else if (!entity.generateResponse) {
    sourcePath = 'gen/request_mapper.tmp';
  }

  entity.properties.toString().log();

  var sourceFile = await File(sourcePath).readAsString();

  await file.writeAsString(
    sourceFile
        .replaceAll('\${className.snakeCase}', entity.name)
        .replaceAll('\${sourceName.snakeCase}/',
            '${sourceName.isNotEmpty ? '$sourceName/' : ''}')
        .replaceAll('\${className.pascalCase}', entity.name.toPascalCase)
        .replaceAll('\${className.camelCase}', entity.name.toCamelCase)
        .replaceAll('\${projectName}', projectName),
  );
}

Future<void> _genRepository(List<Entity> entities) async {
  var path = await Directory('lib/domain/repository');
  var file = File('${path.path}/${sourceName}_repository.dart');

  if (!repositoryExists) {
    await file.create();
  }

  var entitiesImports = entities
      .map((e) =>
          'import \'package:${projectName}/domain/entity/${sourceName}/${e.name}/${e.name}.dart\';\n')
      .join();

  var mappersImports = entities
      .where((element) => element.generateResponse || element.generateRequest)
      .map((e) =>
          'import \'package:${projectName}/data/mapper/${sourceName}/${e.name}/${e.name}_mapper.dart\';\n')
      .join();

  var mappers = entities
      .where((element) => element.generateResponse || element.generateRequest)
      .map((e) =>
          'final _${e.name.toCamelCase}Mappers = ${e.name.toPascalCase}Mappers();')
      .join();

  String sourcePath = 'gen/repository.tmp';
  var sourceFile =
      await File(sourceExists ? file.path : sourcePath).readAsString();

  (sourceExists ? file.path : sourcePath).log();

  await file.writeAsString(
    sourceFile
        .replaceAll(
            '//{entities_imports}', '$entitiesImports//{entities_imports}')
        .replaceAll('\${className.snakeCase}', entities.first.name)
        .replaceAll('\${className.camelCase}', entities.first.name.toCamelCase)
        .replaceAll('\${sourceName.snakeCase}', sourceName)
        .replaceAll('\${sourceName.pascalCase}', sourceName.toPascalCase)
        .replaceAll(
            '\${className.pascalCase}', entities.first.name.toPascalCase)
        .replaceAll('\${projectName}', projectName),
  );

  path = await Directory('lib/data/repository');

  file = await File('${path.path}/${sourceName}_repository_impl.dart');

  if (!repositoryExists) {
    await file.create();
  }

  sourcePath = 'gen/repository_impl.tmp';

  sourceFile = await File(sourceExists ? file.path : sourcePath).readAsString();

  (sourceExists ? file.path : sourcePath).log();

  await file.writeAsString(
    sourceFile
        .replaceAll(
            '//{entities_imports}', '$entitiesImports//{entities_imports}')
        .replaceAll('//{mappers_imports}', '$mappersImports//{mappers_imports}')
        .replaceAll('//{mappers}', '$mappers//{mappers}')
        .replaceAll('\${className.snakeCase}', entities.first.name)
        .replaceAll('\${className.camelCase}', entities.first.name.toCamelCase)
        .replaceAll('\${sourceName.snakeCase}', sourceName)
        .replaceAll('\${sourceName.pascalCase}', sourceName.toPascalCase)
        .replaceAll(
            '\${className.pascalCase}', entities.first.name.toPascalCase)
        .replaceAll('\${projectName}', projectName),
  );

  if (!repositoryExists) {
    var diContent = await File('lib/core/di/repository.dart').readAsString();

    await File('lib/core/di/repository.dart').writeAsString(diContent.replaceAll(
            '//{imports end}',
            '''import 'package:$projectName/data/repository/${sourceName.toCamelCase}_repository_impl.dart';
        import 'package:$projectName/domain/repository/${sourceName.toCamelCase}_repository.dart';
        //{imports end}''').replaceAll('); //{repositories end}',
            ''')..registerSingleton<${sourceName.toPascalCase}Repository>(${sourceName.toPascalCase}RepositoryImpl(${sourceName}Source),
      ); //{repositories end}''') +
        '${sourceName.toPascalCase}Repository get ${sourceName.toCamelCase}Repository => GetIt.I.get<${sourceName.toPascalCase}Repository>();');
  }
}

Future<void> _genSource(List<Entity> entities) async {
  final path =
      await Directory('lib/data/source/remote/${sourceName.toSnakeCase}');
  var file = File('${path.path}/${sourceName}_source.dart');

  if (!sourceExists) {
    await file.create();
  }

  var responseImports = entities
      .where((element) => element.generateResponse)
      .map((e) =>
          'import \'package:${projectName}/data/model/remote/${sourceName.toSnakeCase}/${e.name}/${e.name}_response.dart\';\n')
      .join();

  var requestImports = entities
      .where((element) => element.generateRequest)
      .map((e) =>
          'import \'package:${projectName}/data/model/remote/${sourceName.toSnakeCase}/${e.name}/${e.name}_request.dart\';\n')
      .join();

  String sourcePath = 'gen/source.tmp';

  var sourceFile =
      await File(sourceExists ? file.path : sourcePath).readAsString();

  await file.writeAsString(
    sourceFile
        .replaceAll(
            '//{response_imports}', '$responseImports//{response_imports}')
        .replaceAll('//{request_imports}', '$requestImports//{request_imports}')
        .replaceAll('\${sourceName.snakeCase}', sourceName.toSnakeCase)
        .replaceAll('\${sourceName.pascalCase}', sourceName.toPascalCase)
        .replaceAll('\${className.snakeCase}', entities.first.name)
        .replaceAll(
            '\${className.pascalCase}', entities.first.name.toPascalCase)
        .replaceAll('\${projectName}', projectName),
  );

  if (!sourceExists) {
    file = await File('${path.path}/${sourceName}_source_impl.dart').create();
    sourcePath = 'gen/source_impl.tmp';
    sourceFile = await File(sourcePath).readAsString();
  } else {
    file = File('${path.path}/${sourceName}_source_impl.dart');
    sourceFile = await file.readAsString();
  }

  await file.writeAsString(
    sourceFile
        .replaceAll(
            '//{response_imports}', '$responseImports//{response_imports}')
        .replaceAll('//{request_imports}', '$requestImports//{request_imports}')
        .replaceAll('\${sourceName.snakeCase}', sourceName)
        .replaceAll('\${sourceName.pascalCase}', sourceName.toPascalCase)
        .replaceAll('\${className.snakeCase}', entities.first.name)
        .replaceAll(
            '\${className.pascalCase}', entities.first.name.toPascalCase)
        .replaceAll('\${projectName}', projectName),
  );

  var sourceContent = await File('lib/core/di/source.dart').readAsString();

  var dioConstFileContent =
      await File('lib/core/arch/data/remote/dio_const.dart').readAsString();

  var remoteDiFileContent =
      await File('lib/core/di/remote.dart').readAsString();

  if (!sourceExists) {
    await File('lib/core/di/source.dart').writeAsString(sourceContent.replaceAll(
            '//{imports end}',
            '''import 'package:$projectName/data/source/remote/${sourceName}/${sourceName}_source_impl.dart';
        import 'package:$projectName/data/source/remote/${sourceName}/${sourceName}_source.dart';
        //{imports end}''').replaceAll('); //{sources end}',
            ''')..registerSingleton<${sourceName.toPascalCase}Source>(${sourceName.toPascalCase}SourceImpl(
            getIt.get<ApiClient>(instanceName: DioConst.${sourceName}ApiInstance),
            getIt.get<DioRequestProcessor>(),
          )
      ); //{sources end}''') +
        '${sourceName.toPascalCase}Source get ${sourceName.toCamelCase}Source => GetIt.I.get<${sourceName.toPascalCase}Source>();');

    await File('lib/core/arch/data/remote/dio_const.dart').writeAsString(
        dioConstFileContent.replaceAll('//{dio const end}',
            '''static const String ${sourceName}ApiInstance = '${sourceName}Api';
            static const String ${sourceName}ApiBaseUrl = 'http://${sourceName}api.com';
            //{dio const end}
            '''));

    await File('lib/core/di/remote.dart')
        .writeAsString(remoteDiFileContent.replaceAll('); //{remote end}', ''')
        ..registerLazySingleton<ApiClient>(
      () => dioClientModule.makeApiClient(DioConst.${sourceName}ApiBaseUrl),
      instanceName: DioConst.${sourceName}ApiInstance,
            ); //{remote end}
            '''));
  }
}

extension Case on String {
  String get toSnakeCase => ReCase(this).snakeCase;

  String get toCamelCase => ReCase(this).camelCase;

  String get toPascalCase => ReCase(this).pascalCase;
}

class Entity {
  String name;
  bool generateRequest;
  bool generateResponse;
  bool exists;
  String classBody;
  List<String> properties;

  Entity({
    required this.name,
    required this.generateRequest,
    required this.generateResponse,
    required this.exists,
    required this.classBody,
    required this.properties,
  });

  @override
  String toString() {
    return 'Entity{name: $name, exists: $exists, $generateRequest, generateResponse: $generateResponse}, classBody: $classBody, properties: $properties}';
  }

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        name: json['name'].toString().toSnakeCase,
        exists: json['exists'],
        generateRequest: json['generateRequest'],
        generateResponse: json['generateResponse'],
        classBody: json['classBody'],
        properties: json['properties']
            .map<String>((e) => e['name'].toString())
            .toList(),
      );
}
