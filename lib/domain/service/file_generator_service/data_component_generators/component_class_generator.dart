import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/params/data_component_params.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class ComponentClassGenerator implements BaseGenerationService<bool> {
  final DataComponentRepository _dataComponentRepository;

  ComponentClassGenerator(this._dataComponentRepository);

  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! DataComponentParams) {
      return false;
    }
    final codeLines = List<String>.empty(growable: true);

    final sourceName = params.dataComponent.sourceName;
    final name = params.dataComponent.name;

    ///Imports
    codeLines
        .add('import \'package:freezed_annotation/freezed_annotation.dart\';');
    final componentImports = params.dataComponent.imports.map(
      (e) {
        final importSourceName = _dataComponentRepository
                .getDataComponentByName(dataComponentName: e)
                ?.sourceName ??
            '';
        final sourceName =
            importSourceName.isNotEmpty ? '${importSourceName.snakeCase}/' : '';
        return 'import \'package:${params.projectName}/domain/entity/$sourceName${e.snakeCase}/${e.snakeCase}.dart\';';
      },
    );
    codeLines.addAll(componentImports);
    codeLines.addNewLine();
    codeLines.add('part \'${name.snakeCase}.freezed.dart\';');
    codeLines.addNewLine();

    ///Class Declaration
    codeLines.add('@freezed');
    codeLines.add('class ${name.pascalCase} with _\$${name.pascalCase} {');

    ///Constructor
    codeLines.add('factory ${name.pascalCase}({');
    final componentProperties = params.dataComponent.properties.map(
      (e) => '       $e,',
    );
    codeLines.addAll(componentProperties);
    codeLines.add(' }) = _${name.pascalCase};');
    codeLines.addNewLine();

    ///Empty class constructor
    codeLines.add('factory ${name.pascalCase}.empty() => ${name.pascalCase}(');
    final emptyProperties = _getEmptyConstructorProperties(
      dataComponent: params.dataComponent,
    );
    codeLines.addAll(emptyProperties);
    codeLines.add(' );}');
    codeLines.addNewLine();

    ///Save File
    final componentSubFolder =
        name.endsWith('Request') || name.endsWith('Response')
            ? 'data/model/remote'
            : 'domain/entity';
    final componentFolderName =
        sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : '';
    final componentFolderSuffix =
        name.endsWith('Request') || name.endsWith('Response')
            ? name.stripRequestResponse().snakeCase
            : name.snakeCase;
    final path = await Directory(
      '${params.projectPath}/${params.projectName}/lib/$componentSubFolder/$componentFolderName$componentFolderSuffix',
    ).create(recursive: true);

    var file = await File('${path.path}/${name.snakeCase}.dart').create();

    final fileContent = codeLines.join('\n');
    await file.writeAsString(fileContent);
    return true;
  }

  List<String> _getEmptyConstructorProperties(
      {required DataComponent dataComponent}) {
    final properties = List<String>.empty(growable: true);

    for (final property in dataComponent.properties) {
      if (property.isList) {
        properties.add('${property.name}: [],');
        continue;
      }

      if (!TypeMatcher.isStandardType(TypeMatcher.getDartType(property.type))) {
        final importName = dataComponent.imports
                .firstWhereOrNull((element) => element == property.type) ??
            '';
        final importEntity = _dataComponentRepository.getDataComponentByName(
          dataComponentName: importName,
        );

        if (importEntity != null && importEntity.isEnum) {
          properties.add(
            '${property.name}: ${property.type}.values.first,',
          );
        } else {
          properties.add(
            '${property.name}: ${property.type}.empty(),',
          );
        }
      } else {
        properties.add(
            '${property.name}: ${TypeMatcher.defaultTypeValue(property.type)},');
      }
    }

    return properties;
  }
}
