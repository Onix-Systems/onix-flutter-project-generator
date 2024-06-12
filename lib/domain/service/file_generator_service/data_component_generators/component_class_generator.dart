import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/class_builder/freezed_class_builder.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/params/data_component_params.dart';
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

    final sourceName = params.dataComponent.sourceName;
    final name = params.dataComponent.name;

    final imports = _getImports(
      params.projectName,
      params.dataComponent,
    );
    final constructorProperties = params.dataComponent.properties.map(
      (e) => '$e,',
    );
    final emptyConstructorProperties = _getEmptyConstructorProperties(
      params.dataComponent,
    );

    final freezedClass = FreezedClassBuilder(className: name)
      ..imports = imports
      ..baseConstructorProperties = constructorProperties
      ..emptyConstructorProperties = emptyConstructorProperties
      ..withJsonAnnotation = false;
    final fileContent = freezedClass.build();

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

    await file.writeAsString(fileContent);
    return true;
  }

  Iterable<String> _getImports(
    String projectName,
    DataComponent dataComponent,
  ) {
    final imports = dataComponent.imports.map(
      (e) {
        final importSourceName = _dataComponentRepository
                .getDataComponentByName(dataComponentName: e)
                ?.sourceName ??
            '';
        final sourceName =
            importSourceName.isNotEmpty ? '${importSourceName.snakeCase}/' : '';
        return 'import \'package:$projectName/domain/entity/$sourceName${e.snakeCase}/${e.snakeCase}.dart\';';
      },
    );
    return imports;
  }

  Iterable<String> _getEmptyConstructorProperties(DataComponent dataComponent) {
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
