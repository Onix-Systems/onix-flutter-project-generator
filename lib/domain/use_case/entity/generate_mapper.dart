import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';

import 'package:onix_flutter_bricks/data/model/local/entity_wrapper/entity_wrapper.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

import '../../entity_parser/enum.dart';

class GenerateMapper {
  FutureOr<void> call({
    required String projectName,
    required String projectPath,
    required EntityWrapper entityWrapper,
  }) async {
    final entity = entityWrapper.entity;
    final name = entityWrapper.name;

    final sourceName = _getSourceName(entityWrapper.entity?.sourceName ?? '');

    final importMappers = entity?.entityImports
        .where((e) => e is! EnumEntity)
        .map((e) => '    final ${e.name.camelCase}Mapper = ${e.name}Mappers();')
        .join('\n');

    final imports = entity?.entityImports
        .map((e) => e is EnumEntity
            ? 'import \'package:$projectName/domain/entity/${_getSourceName(e.sourceName)}${e.name.snakeCase}/${e.name.snakeCase}.dart\';'
            : importMappers != null &&
                    importMappers.isNotEmpty &&
                    entityWrapper.generateResponse
                ? 'import \'package:$projectName/data/model/remote/${_getSourceName(e.sourceName)}${e.name.snakeCase}/${e.name.snakeCase}_response.dart\';\n'
                    'import \'package:$projectName/data/mapper/${_getSourceName(e.sourceName)}${e.name.snakeCase}/${e.name.snakeCase}_mapper.dart\';\n'
                : '')
        .join('\n');

    final fileContent = '''import 'package:collection/collection.dart';
import 'package:$projectName/core/arch/domain/common/converter/mapper.dart';
${entityWrapper.generateRequest ? 'import \'package:$projectName/data/model/remote/$sourceName${name.snakeCase}/${name.snakeCase}_request.dart\';' : ''}
${entityWrapper.generateResponse ? 'import \'package:$projectName/data/model/remote/$sourceName${name.snakeCase}/${name.snakeCase}_response.dart\';' : ''}
import 'package:$projectName/domain/entity/$sourceName${name.snakeCase}/${name.snakeCase}.dart';
$imports

${entityWrapper.generateResponse ? '''class _${name.pascalCase}ResponseToEntityMapper implements Mapper<${name.pascalCase}Response, ${name.pascalCase}>{
  @override
  ${name.pascalCase} map(${name.pascalCase}Response from,) {
$importMappers

    return ${name.pascalCase}(
${_getProperties(entityWrapper: entityWrapper)}
    );
  } 
}''' : ''}

${entityWrapper.generateRequest ? '''
class _${name.pascalCase}EntityToRequestMapper implements Mapper<${name.pascalCase}, ${name.pascalCase}Request>{
  @override
  ${name.pascalCase}Request map(${name.pascalCase} from,) {
$importMappers

    return ${name.pascalCase}Request(
${_getProperties(entityWrapper: entityWrapper, isRequest: true)}
    );
  }
}''' : ''}

class ${name.pascalCase}Mappers {
  ${entityWrapper.generateResponse ? 'final _${name.camelCase}ResponseToEntityMapper = _${name.pascalCase}ResponseToEntityMapper();' : ''}
  ${entityWrapper.generateRequest ? 'final _${name.camelCase}EntityToRequestMapper = _${name.pascalCase}EntityToRequestMapper();' : ''}

  ${entityWrapper.generateResponse ? '${name.pascalCase} map${name.pascalCase}ResponseToEntity(${name.pascalCase}Response response,) => _${name.camelCase}ResponseToEntityMapper.map(response);' : ''}

  ${entityWrapper.generateRequest ? '${name.pascalCase}Request map${name.pascalCase}EntityToRequest(${name.pascalCase} entity,) => _${name.camelCase}EntityToRequestMapper.map(entity);' : ''}
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/mapper/$sourceName${name.snakeCase}')
        .create(recursive: true);

    var file =
        await File('${path.path}/${name.snakeCase}_mapper.dart').create();

    await file.writeAsString(fileContent);
  }

  String _getProperties(
      {required EntityWrapper entityWrapper, bool isRequest = false}) {
    final properties = <String>[];

    for (final property in entityWrapper.properties) {
      if (property.type.startsWith('List')) {
        final type = property.type.substring(5, property.type.length - 1);
        entityWrapper.entity!.imports.contains(type.snakeCase)
            ? properties.add(
                '        ${property.name}: from.${property.name}${isRequest ? '' : '?'}.map(${type.camelCase}Mapper.map$type${isRequest ? 'EntityToRequest' : 'ResponseToEntity'}).toList()${isRequest ? '' : ' ?? []'},')
            : properties.add(
                '        ${property.name}: from.${property.name}${isRequest ? '' : ' ?? []'},');
      } else {
        entityWrapper.entity!.imports.contains(property.type.snakeCase)
            ? entityWrapper.entity!.entityImports
                        .firstWhereOrNull((e) => e.name == property.type)
                    is EnumEntity
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
