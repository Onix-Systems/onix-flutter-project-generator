import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';

import 'package:recase/recase.dart';

class GenerateMapper {
  FutureOr<void> call({
    required String projectName,
    required String projectPath,
    required DataComponent dataComponent,
  }) async {
    final name = dataComponent.name;

    final sourceName = _getSourceName(dataComponent.name);

    final importMappers = dataComponent.imports
        .where((e) => !dataComponentRepository.isEnum(e))
        .map((e) => '    final ${e.camelCase}Mapper = ${e}Mappers();')
        .join('\n');

    final imports = dataComponent.imports
        .map((e) => dataComponentRepository.isEnum(e)
            ? 'import \'package:$projectName/domain/entity/${_getSourceName(e)}${e.snakeCase}/${e.snakeCase}.dart\';'
            : importMappers.isNotEmpty
                ? '${dataComponent.generateResponse ? 'import \'package:$projectName/data/model/remote/${_getSourceName(e)}${e.snakeCase}/${e.snakeCase}_response.dart\';\n' : ''}'
                    '${dataComponent.generateRequest ? 'import \'package:$projectName/domain/entity/${_getSourceName(e)}${e.snakeCase}/${e.snakeCase}.dart\';\n' : ''}'
                    'import \'package:$projectName/data/mapper/${_getSourceName(e)}${e.snakeCase}/${e.snakeCase}_mapper.dart\';\n'
                : '')
        .join('\n');

    final fileContent = '''import 'package:collection/collection.dart';
import 'package:$projectName/core/arch/domain/common/converter/mapper.dart';
${dataComponent.generateRequest ? 'import \'package:$projectName/data/model/remote/$sourceName${name.snakeCase}/${name.snakeCase}_request.dart\';' : ''}
${dataComponent.generateResponse ? 'import \'package:$projectName/data/model/remote/$sourceName${name.snakeCase}/${name.snakeCase}_response.dart\';' : ''}
import 'package:$projectName/domain/entity/$sourceName${name.snakeCase}/${name.snakeCase}.dart';
$imports

${dataComponent.generateResponse ? '''class _ResponseToEntityMapper implements Mapper<${name.pascalCase}Response, ${name.pascalCase}>{
  @override
  ${name.pascalCase} map(${name.pascalCase}Response from,) {
$importMappers

    return ${name.pascalCase}(
${_getProperties(dataComponent: dataComponent)}
    );
  } 
}''' : ''}

${dataComponent.generateRequest ? '''
class _EntityToRequestMapper implements Mapper<${name.pascalCase}, ${name.pascalCase}Request>{
  @override
  ${name.pascalCase}Request map(${name.pascalCase} from,) {
$importMappers

    return ${name.pascalCase}Request(
${_getProperties(dataComponent: dataComponent, isRequest: true)}
    );
  }
}''' : ''}

class ${name.pascalCase}Mappers {
  ${dataComponent.generateResponse ? 'final _responseToEntityMapper = _ResponseToEntityMapper();' : ''}
  ${dataComponent.generateRequest ? 'final _entityToRequestMapper = _EntityToRequestMapper();' : ''}

  ${dataComponent.generateResponse ? '${name.pascalCase} mapResponseToEntity(${name.pascalCase}Response response,) => _responseToEntityMapper.map(response);' : ''}

  ${dataComponent.generateRequest ? '${name.pascalCase}Request mapEntityToRequest(${name.pascalCase} entity,) => _entityToRequestMapper.map(entity);' : ''}
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/mapper/$sourceName${name.snakeCase}')
        .create(recursive: true);

    var file =
        await File('${path.path}/${name.snakeCase}_mapper.dart').create();

    await file.writeAsString(fileContent);
  }

  String _getProperties(
      {required DataComponent dataComponent, bool isRequest = false}) {
    final properties = <String>[];

    for (final property in dataComponent.properties) {
      if (property.isList) {
        dataComponent.imports
                .map((e) => e.pascalCase)
                .contains(property.type.pascalCase)
            ? properties.add(
                '        ${property.name}: from.${property.name}${isRequest && !property.nullable ? '' : '?'}.map(${property.type.camelCase}Mapper.map${isRequest ? 'EntityToRequest' : 'ResponseToEntity'}).toList()${isRequest && !property.nullable ? '' : ' ?? []'},')
            : properties.add(
                '        ${property.name}: from.${property.name}${isRequest ? '' : ' ?? []'},');
      } else {
        dataComponent.imports
                .map((e) => e.pascalCase)
                .contains(property.type.pascalCase)
            ? dataComponentRepository.isEnum(dataComponent.imports
                    .firstWhereOrNull((e) => e == property.type)!)
                ? properties.add(
                    '        ${property.name}: ${property.type.pascalCase}.values.firstWhereOrNull((element) => element.name == from.${property.name}${isRequest ? '.name' : ''})${isRequest ? '?.name' : ''} ?? ${property.type.pascalCase}.values.first${isRequest ? '.name' : ''},')
                : properties.add(
                    '        ${property.name}: ${property.type.camelCase}Mapper.map${isRequest ? 'EntityToRequest' : 'ResponseToEntity'}(from.${property.name} ${isRequest && !property.nullable ? '' : '?? ${property.type.pascalCase}${isRequest ? '' : 'Response'}.empty(),'}),')
            : properties.add(
                '        ${property.name}: from.${property.name}${isRequest && !property.nullable ? '' : ' ?? ${TypeMatcher.defaultTypeValue(property.type)}'},');
      }
    }
    return properties.join('\n');
  }

  String _getSourceName(String dataComponentName) {
    final sourceName = dataComponentRepository
            .getDataComponentByName(dataComponentName)
            ?.sourceName ??
        '';
    return sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : '';
  }
}
