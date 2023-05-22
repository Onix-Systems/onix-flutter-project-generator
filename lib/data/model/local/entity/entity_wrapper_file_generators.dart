import 'dart:io';

import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/entity_wrapper.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

extension FileGenerator on EntityWrapper {
  Future<void> generateFiles(
      {required String projectName,
      required String projectPath,
      String sourceName = ''}) async {
    await _generateEntity(
        projectName: projectName,
        projectPath: projectPath,
        sourceName: sourceName);
    if (!isEnum && generateResponse) {
      _generateResponse(
          projectName: projectName,
          projectPath: projectPath,
          sourceName: sourceName);
    }
    if (!isEnum && generateRequest) {
      _generateRequest(
          projectName: projectName,
          projectPath: projectPath,
          sourceName: sourceName);
    }
    if (!isEnum && generateRequest && generateResponse) {
      _generateMapper(
          projectName: projectName,
          projectPath: projectPath,
          sourceName: sourceName);
    }
  }

  Future<void> _generateEntity(
      {required String projectName,
      required String projectPath,
      String sourceName = ''}) async {
    final imports = entity?.entityImports
        .map((e) =>
            'import \'package:$projectName/domain/entity/${e.sourceName.isNotEmpty ? '${e.sourceName.snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}.dart\';')
        .join('\n');

    final properties = this.properties.map((e) => '       $e,').join('\n');

    final fileContent = '''
import 'package:freezed_annotation/freezed_annotation.dart';
${'$imports\n'}
part '${name.snakeCase}.freezed.dart';
part '${name.snakeCase}.g.dart';

@freezed
class $name with _\$$name {
    factory $name({
    $properties
    }) = _$name;

    factory $name.fromJson(Map<String, dynamic> json) => _\$${name}FromJson(json);
}
''';

    final path = await Directory(
            '$projectPath/$projectName/lib/domain/entity/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file = await File('${path.path}/${name.snakeCase}.dart').create();

    await file.writeAsString(fileContent);
  }

  Future<void> _generateResponse(
      {required String projectName,
      required String projectPath,
      String sourceName = ''}) async {
    final imports = entity?.entityImports
        .map((e) =>
            'import \'package:$projectName/domain/entity/${e.sourceName.isNotEmpty ? '${e.sourceName.snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}.dart\';')
        .join('\n');

    final fileContent =
        '''import 'package:freezed_annotation/freezed_annotation.dart';
$imports

part '${name.snakeCase}_response.freezed.dart';
part '${name.snakeCase}_response.g.dart';

@freezed
class ${name.pascalCase}Response with _\$${name.pascalCase}Response {
    factory ${name.pascalCase}Response({
${properties.map((e) => '        ${TypeMatcher.getDartType(e.type)}${TypeMatcher.isObject(e.type) ? 'Response' : ''}? ${e.name},').join('\n')}
    }) = _${name.pascalCase}Response;

    factory ${name.pascalCase}Response.fromJson(Map<String, dynamic> json) => _\$${name.pascalCase}ResponseFromJson(json);
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file =
        await File('${path.path}/${name.snakeCase}_response.dart').create();

    await file.writeAsString(fileContent);
  }

  Future<void> _generateRequest(
      {required String projectName,
      required String projectPath,
      String sourceName = ''}) async {
    final imports = entity?.entityImports
        .map((e) =>
            'import \'package:$projectName/domain/entity/${e.sourceName.isNotEmpty ? '${e.sourceName.snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}.dart\';')
        .join('\n');

    final fileContent =
        '''import 'package:freezed_annotation/freezed_annotation.dart';
$imports

part '${name.snakeCase}_request.freezed.dart';
part '${name.snakeCase}_request.g.dart';

@freezed
class ${name.pascalCase}Request with _\$${name.pascalCase}Request {
    factory ${name.pascalCase}Request({
${properties.map((e) => '        required ${TypeMatcher.getDartType(e.type)} ${e.name},').join('\n')}
    }) = _${name.pascalCase}Request;

    factory ${name.pascalCase}Request.fromJson(Map<String, dynamic> json) => _\$${name.pascalCase}RequestFromJson(json);
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file =
        await File('${path.path}/${name.snakeCase}_request.dart').create();

    await file.writeAsString(fileContent);
  }

  Future<void> _generateMapper(
      {required String projectName,
      required String projectPath,
      String sourceName = ''}) async {
    final fileContent =
        '''import 'package:$projectName/core/arch/domain/common/converter/mapper.dart';
import 'package:$projectName/data/model/remote/${sourceName.snakeCase}/${name.snakeCase}/${name.snakeCase}_request.dart';
import 'package:$projectName/data/model/remote/${sourceName.snakeCase}/${name.snakeCase}/${name.snakeCase}_response.dart';
import 'package:$projectName/domain/entity/${sourceName.snakeCase}/${name.snakeCase}/${name.snakeCase}.dart';

class _${name.pascalCase}ResponseToEntityMapper implements Mapper<${name.pascalCase}Response, ${name.pascalCase}>{
  @override
  ${name.pascalCase} map(${name.pascalCase}Response from) {
    return ${name.pascalCase}(
    ${properties.map((e) => '        ${e.name}: from.${e.name} ?? \'\',').join('\n')}
    );
  } 
}

class _${name.pascalCase}EntityToRequestMapper implements Mapper<${name.pascalCase}, ${name.pascalCase}Request>{
  @override
  ${name.pascalCase}Request map(${name.pascalCase} from) {
    return ${name.pascalCase}Request(
    ${properties.map((e) => '        ${e.name}: from.${e.name},').join('\n')}
    );
  }
}

class ${name.pascalCase}Mappers {
  final _${name.camelCase}ResponseToEntityMapper = _${name.pascalCase}ResponseToEntityMapper();
  final _${name.camelCase}EntityToRequestMapper = _${name.pascalCase}EntityToRequestMapper();

  ${name.pascalCase} map${name.pascalCase}ResponseToEntity(${name.pascalCase}Response response) =>
      _${name.camelCase}ResponseToEntityMapper.map(response);

  ${name.pascalCase}Request map${name.pascalCase}EntityToRequest(${name.pascalCase} entity) =>
      _${name.camelCase}EntityToRequestMapper.map(entity);
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/mapper/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file =
        await File('${path.path}/${name.snakeCase}_mapper.dart').create();

    await file.writeAsString(fileContent);
  }
}
