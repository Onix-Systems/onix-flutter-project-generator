import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/params/data_component_params.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class MapperGenerator implements BaseGenerationService<bool> {
  final DataComponentRepository _dataComponentRepository;

  MapperGenerator(this._dataComponentRepository);

  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! DataComponentParams) {
      return false;
    }
    final codeLines = List<String>.empty(growable: true);

    final name = params.dataComponent.name;
    final sourceName = _getSourceName(params.dataComponent.name);

    final mappersDeclarations = params.dataComponent.imports
        .where((e) => !_dataComponentRepository.isEnum(dataComponentName: e))
        .map((e) => 'final ${e.camelCase}Mapper = ${e}Mappers();')
        .join('\n');

    ///Create class imports
    final imports = _getImports(
      params.dataComponent,
      mappersDeclarations,
      params.projectName,
    );

    ///Add imports
    codeLines.add('import \'package:collection/collection.dart\';');
    codeLines.add(
        'import \'package:${params.projectName}/core/arch/domain/common/converter/mapper.dart\';');
    if (params.dataComponent.generateRequest) {
      codeLines.add(
          'import \'package:${params.projectName}/data/model/remote/$sourceName${name.snakeCase}/${name.snakeCase}_request.dart\';');
    }
    if (params.dataComponent.generateResponse) {
      codeLines.add(
          'import \'package:${params.projectName}/data/model/remote/$sourceName${name.snakeCase}/${name.snakeCase}_response.dart\';');
    }
    codeLines.add(
        'import \'package:${params.projectName}/domain/entity/$sourceName${name.snakeCase}/${name.snakeCase}.dart\';');
    codeLines.addAll(imports);
    codeLines.addNewLine();

    ///Response mapper declaration
    if (params.dataComponent.generateResponse) {
      codeLines.add(
          'class _ResponseToEntityMapper implements Mapper<${name.pascalCase}Response, ${name.pascalCase}>{');
      codeLines.add('@override');
      codeLines
          .add('${name.pascalCase} map(${name.pascalCase}Response from,) {');
      codeLines.add(mappersDeclarations);
      codeLines.add('return ${name.pascalCase}(');
      final responseParams =
          _getProperties(dataComponent: params.dataComponent);
      codeLines.add(responseParams);
      codeLines.add(');}}');
    }
    codeLines.addNewLine();

    ///Request mapper declaration
    if (params.dataComponent.generateRequest) {
      codeLines.add(
          'class _EntityToRequestMapper implements Mapper<${name.pascalCase}, ${name.pascalCase}Request>{');
      codeLines.add('@override');
      codeLines
          .add('${name.pascalCase}Request map(${name.pascalCase} from,) {');
      codeLines.add(mappersDeclarations);
      codeLines.add('return ${name.pascalCase}Request(');
      final requestParams = _getProperties(
        dataComponent: params.dataComponent,
        isRequest: true,
      );
      codeLines.add(requestParams);
      codeLines.add(');}}');
    }
    codeLines.addNewLine();
    codeLines.add('class ${name.pascalCase}Mappers {');
    if (params.dataComponent.generateResponse) {
      codeLines
          .add('final _responseToEntityMapper = _ResponseToEntityMapper();');
    }
    if (params.dataComponent.generateRequest) {
      codeLines.add('final _entityToRequestMapper = _EntityToRequestMapper();');
    }
    if (params.dataComponent.generateResponse) {
      codeLines.add(
        '${name.pascalCase} mapResponseToEntity(${name.pascalCase}Response response,) => _responseToEntityMapper.map(response);',
      );
    }
    if (params.dataComponent.generateRequest) {
      codeLines.add(
        '${name.pascalCase}Request mapEntityToRequest(${name.pascalCase} entity,) => _entityToRequestMapper.map(entity);',
      );
    }
    codeLines.add('}');
    codeLines.addNewLine();

    ///Save file
    final fileContent = codeLines.join('\n');
    final path = await Directory(
            '${params.projectPath}/${params.projectName}/lib/data/mapper/$sourceName${name.snakeCase}')
        .create(recursive: true);

    var file =
        await File('${path.path}/${name.snakeCase}_mapper.dart').create();

    await file.writeAsString(fileContent);
    return true;
  }

  List<String> _getImports(
    DataComponent component,
    String mappersDeclarations,
    String projectName,
  ) {
    return component.imports.map(
      (e) {
        final sourceName = _getSourceName(e);
        final isEnum = _dataComponentRepository.isEnum(dataComponentName: e);
        if (isEnum) {
          return 'import \'package:$projectName/domain/entity/$sourceName${e.snakeCase}/${e.snakeCase}.dart\';';
        } else {
          if (mappersDeclarations.isNotEmpty) {
            final responseImport = component.generateResponse
                ? 'import \'package:$projectName/data/model/remote/$sourceName${e.snakeCase}/${e.snakeCase}_response.dart\';'
                : '';
            final requestImport = component.generateRequest
                ? 'import \'package:$projectName/domain/entity/$sourceName${e.snakeCase}/${e.snakeCase}.dart\';'
                : '';
            final mapperImport =
                'import \'package:$projectName/data/mapper/${_getSourceName(e)}${e.snakeCase}/${e.snakeCase}_mapper.dart\';';
            return [responseImport, requestImport, mapperImport].join('\n');
          }
        }
        return '';
      },
    ).toList();
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
                '${property.name}: from.${property.name}${isRequest && !property.nullable ? '' : '?'}.map(${property.type.camelCase}Mapper.map${isRequest ? 'EntityToRequest' : 'ResponseToEntity'}).toList()${isRequest && !property.nullable ? '' : ' ?? []'},')
            : properties.add(
                '${property.name}: from.${property.name}${isRequest ? '' : ' ?? []'},');
      } else {
        dataComponent.imports
                .map((e) => e.pascalCase)
                .contains(property.type.pascalCase)
            ? _dataComponentRepository.isEnum(
                    dataComponentName: dataComponent.imports
                        .firstWhereOrNull((e) => e == property.type)!)
                ? properties.add(
                    '${property.name}: ${property.type.pascalCase}.values.firstWhereOrNull((element) => element.name == from.${property.name}${isRequest ? '.name' : ''})${isRequest ? '?.name' : ''} ?? ${property.type.pascalCase}.values.first${isRequest ? '.name' : ''},')
                : properties.add(
                    '${property.name}: ${property.type.camelCase}Mapper.map${isRequest ? 'EntityToRequest' : 'ResponseToEntity'}(from.${property.name} ${isRequest && !property.nullable ? '' : '?? ${property.type.pascalCase}${isRequest ? '' : 'Response'}.empty(),'}),')
            : properties.add(
                '${property.name}: from.${property.name}${isRequest && !property.nullable ? '' : ' ?? ${TypeMatcher.defaultTypeValue(property.type)}'},');
      }
    }
    return properties.join('\n');
  }

  String _getSourceName(String dataComponentName) {
    final sourceName = _dataComponentRepository
            .getDataComponentByName(dataComponentName: dataComponentName)
            ?.sourceName ??
        '';
    return sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : '';
  }
}
