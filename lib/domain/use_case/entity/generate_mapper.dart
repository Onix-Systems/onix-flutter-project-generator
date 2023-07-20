import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';

import 'package:onix_flutter_bricks/domain/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

class GenerateMapper {
  FutureOr<void> call({
    required String projectName,
    required String projectPath,
    required Entity entity,
  }) async {
    final name = entity.name;

    final sourceName = _getSourceName(entity.sourceName);

    final importMappers = entity.entityImports
        .where((e) => !e.isEnum)
        .map((e) => '    final ${e.name.camelCase}Mapper = ${e.name}Mappers();')
        .join('\n');

    final imports = entity.entityImports
        .map((e) => e.isEnum
            ? 'import \'package:$projectName/domain/entity/${_getSourceName(e.sourceName)}${e.name.snakeCase}/${e.name.snakeCase}.dart\';'
            : importMappers.isNotEmpty && entity.generateResponse
                ? 'import \'package:$projectName/data/model/remote/${_getSourceName(e.sourceName)}${e.name.snakeCase}/${e.name.snakeCase}_response.dart\';\n'
                    'import \'package:$projectName/data/mapper/${_getSourceName(e.sourceName)}${e.name.snakeCase}/${e.name.snakeCase}_mapper.dart\';\n'
                : '')
        .join('\n');

    final fileContent = '''import 'package:collection/collection.dart';
import 'package:$projectName/core/arch/domain/common/converter/mapper.dart';
${entity.generateRequest ? 'import \'package:$projectName/data/model/remote/$sourceName${name.snakeCase}/${name.snakeCase}_request.dart\';' : ''}
${entity.generateResponse ? 'import \'package:$projectName/data/model/remote/$sourceName${name.snakeCase}/${name.snakeCase}_response.dart\';' : ''}
import 'package:$projectName/domain/entity/$sourceName${name.snakeCase}/${name.snakeCase}.dart';
$imports

${entity.generateResponse ? '''class _${name.pascalCase}ResponseToEntityMapper implements Mapper<${name.pascalCase}Response, ${name.pascalCase}>{
  @override
  ${name.pascalCase} map(${name.pascalCase}Response from,) {
$importMappers

    return ${name.pascalCase}(
${_getProperties(entity: entity)}
    );
  } 
}''' : ''}

${entity.generateRequest ? '''
class _${name.pascalCase}EntityToRequestMapper implements Mapper<${name.pascalCase}, ${name.pascalCase}Request>{
  @override
  ${name.pascalCase}Request map(${name.pascalCase} from,) {
$importMappers

    return ${name.pascalCase}Request(
${_getProperties(entity: entity, isRequest: true)}
    );
  }
}''' : ''}

class ${name.pascalCase}Mappers {
  ${entity.generateResponse ? 'final _${name.camelCase}ResponseToEntityMapper = _${name.pascalCase}ResponseToEntityMapper();' : ''}
  ${entity.generateRequest ? 'final _${name.camelCase}EntityToRequestMapper = _${name.pascalCase}EntityToRequestMapper();' : ''}

  ${entity.generateResponse ? '${name.pascalCase} map${name.pascalCase}ResponseToEntity(${name.pascalCase}Response response,) => _${name.camelCase}ResponseToEntityMapper.map(response);' : ''}

  ${entity.generateRequest ? '${name.pascalCase}Request map${name.pascalCase}EntityToRequest(${name.pascalCase} entity,) => _${name.camelCase}EntityToRequestMapper.map(entity);' : ''}
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/mapper/$sourceName${name.snakeCase}')
        .create(recursive: true);

    var file =
        await File('${path.path}/${name.snakeCase}_mapper.dart').create();

    await file.writeAsString(fileContent);
  }

  String _getProperties({required Entity entity, bool isRequest = false}) {
    final properties = <String>[];

    for (final property in entity.properties) {
      if (property.type.startsWith('List')) {
        final type = property.type.substring(5, property.type.length - 1);
        entity.imports.contains(type.snakeCase)
            ? properties.add(
                '        ${property.name}: from.${property.name}${isRequest ? '' : '?'}.map(${type.camelCase}Mapper.map$type${isRequest ? 'EntityToRequest' : 'ResponseToEntity'}).toList()${isRequest ? '' : ' ?? []'},')
            : properties.add(
                '        ${property.name}: from.${property.name}${isRequest ? '' : ' ?? []'},');
      } else {
        entity.imports.contains(property.type.snakeCase)
            ? entity.entityImports
                    .firstWhereOrNull((e) => e.name == property.type)!
                    .isEnum
                ? properties.add(
                    '        ${property.name}: ${isRequest ? 'from.${property.name}' : '${property.type.pascalCase}.values.firstWhereOrNull((element) => element.name == from.${property.name}) ?? ${property.type.pascalCase}.values.first'},')
                : properties.add(
                    '        ${property.name}: ${property.type.camelCase}Mapper.map${property.type.pascalCase}${isRequest ? 'EntityToRequest' : 'ResponseToEntity'}(from.${property.name} ${isRequest ? '' : '?? ${property.type.pascalCase}Response(),'}),')
            : properties.add(
                '        ${property.name}: from.${property.name}${isRequest ? '' : ' ?? ${TypeMatcher.defaultTypeValue(property.type)}'},');
      }
    }
    return properties.join('\n');
  }

  String _getSourceName(String sourceName) {
    return sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : '';
  }
}
