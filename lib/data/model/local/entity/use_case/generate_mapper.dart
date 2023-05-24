import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';

import 'package:onix_flutter_bricks/data/model/local/entity/entity_wrapper.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/enum.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

class GenerateMapper {
  FutureOr<void> call(
      {required String projectName,
      required String projectPath,
      required EntityWrapper entityWrapper,
      String sourceName = ''}) async {
    final entity = entityWrapper.entity;
    final name = entityWrapper.name;
    final properties = entityWrapper.properties;

    final imports = entity?.entityImports
        .map((e) => e is EnumEntity
            ? 'import \'package:$projectName/domain/entity/${e.sourceName.isNotEmpty ? '${e.sourceName.snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}.dart\';'
            : 'import \'package:$projectName/data/model/remote/${e.sourceName.isNotEmpty ? '${e.sourceName.snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}_response.dart\';\n'
                'import \'package:$projectName/data/mapper/${e.sourceName.isNotEmpty ? '${e.sourceName.snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}_mapper.dart\';\n')
        .join('\n');

    final importMappers = entity?.entityImports
        .where((e) => e is! EnumEntity)
        .map((e) => '    final ${e.name.camelCase}Mapper = ${e.name}Mappers();')
        .join('\n');

    final fileContent = '''import 'package:collection/collection.dart';
import 'package:$projectName/core/arch/domain/common/converter/mapper.dart';
import 'package:$projectName/data/model/remote/${sourceName.snakeCase}/${name.snakeCase}/${name.snakeCase}_request.dart';
import 'package:$projectName/data/model/remote/${sourceName.snakeCase}/${name.snakeCase}/${name.snakeCase}_response.dart';
import 'package:$projectName/domain/entity/${sourceName.snakeCase}/${name.snakeCase}/${name.snakeCase}.dart';
$imports

class _${name.pascalCase}ResponseToEntityMapper implements Mapper<${name.pascalCase}Response, ${name.pascalCase}>{
  @override
  ${name.pascalCase} map(${name.pascalCase}Response from) {
$importMappers

    return ${name.pascalCase}(
${_getProperties(entityWrapper: entityWrapper)}
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

  String _getProperties({required EntityWrapper entityWrapper}) {
    final properties = <String>[];

    for (final property in entityWrapper.properties) {
      if (property.type.startsWith('List')) {
        final type = property.type.substring(5, property.type.length - 1);
        entityWrapper.entity!.imports.contains(type.snakeCase)
            ? properties.add(
                '        ${property.name}: from.${property.name}?.map((e) => ${type.camelCase}Mapper.map${type}ResponseToEntity(e)).toList() ?? [],')
            : properties
                .add('        ${property.name}: from.${property.name} ?? [],');
      } else {
        entityWrapper.entity!.imports.contains(property.type.snakeCase)
            ? entityWrapper.entity!.entityImports
                        .firstWhereOrNull((e) => e.name == property.type)
                    is EnumEntity
                ? properties.add(
                    '        ${property.name}: ${property.type.pascalCase}.values.firstWhereOrNull((element) => element.name == from.editEvent) ?? ${property.type.pascalCase}.values.first,')
                : properties.add(
                    '        ${property.name}: ${property.type.camelCase}Mapper.map${property.type.pascalCase}ResponseToEntity(from.${property.name} ?? ${property.type.pascalCase}Response()),')
            : properties.add(
                '        ${property.name}: from.${property.name} ?? ${TypeMatcher.defaultTypeValue(property.type)},');
      }
    }
    return properties.join('\n');
  }
}
