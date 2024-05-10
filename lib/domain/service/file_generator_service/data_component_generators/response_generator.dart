import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/class_builder/freezed_class_builder.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/params/data_component_params.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class ResponseGenerator implements BaseGenerationService<bool> {
  final DataComponentRepository _dataComponentRepository;

  ResponseGenerator(this._dataComponentRepository);

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

    final constructorProperties =
        _getConstructorProperties(params.dataComponent);
    final emptyConstructorProperties =
        _getEmptyConstructorProperties(params.dataComponent);

    final freezedClass = FreezedClassBuilder(
      className: name,
      classNameSuffix: 'response',
    )
      ..imports = imports
      ..baseConstructorProperties = constructorProperties
      ..emptyConstructorProperties = emptyConstructorProperties;
    final fileContent = freezedClass.build();

    final path = await Directory(
            '${params.projectPath}/${params.projectName}/lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file = File('${path.path}/${name.snakeCase}_response.dart');

    if (!await file.exists()) {
      await file.create();
      await file.writeAsString(fileContent);
    }
    return true;
  }

  Iterable<String> _getImports(
    String projectName,
    DataComponent dataComponent,
  ) {
    final imports = dataComponent.imports.map(
      (e) {
        final sourceName = _dataComponentRepository
                .getDataComponentByName(dataComponentName: e)
                ?.sourceName ??
            '';
        final bool isEnum =
            _dataComponentRepository.isEnum(dataComponentName: e);
        final importSourcePath =
            sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : '';
        if (isEnum) {
          return 'import \'package:$projectName/domain/entity/$importSourcePath${e.snakeCase}/${e.snakeCase}.dart\';';
        } else {
          return 'import \'package:$projectName/data/model/remote/$importSourcePath${e.snakeCase}/${e.snakeCase}_response.dart\';';
        }
      },
    );
    return imports;
  }

  Iterable<String> _getConstructorProperties(DataComponent dataComponent) {
    final properties = List<String>.empty(growable: true);

    for (final property in dataComponent.properties) {
      if (property.isList) {
        dataComponent.imports.contains(property.type.pascalCase)
            ? properties.add(
                '        List<${property.type.pascalCase}Response>? ${property.name},')
            : properties.add(
                '        List<${TypeMatcher.getDartType(property.type)}>? ${property.name},');
      } else {
        dataComponent.imports
                .map((e) => e.pascalCase)
                .contains(property.type.pascalCase)
            ? _dataComponentRepository.isEnum(
                    dataComponentName: dataComponent.imports.firstWhereOrNull(
                        (e) => e.pascalCase == property.type.pascalCase)!)
                ? properties.add('        String? ${property.name},')
                : properties.add(
                    '        ${property.type.pascalCase}Response? ${property.name},')
            : properties.add(
                '        ${TypeMatcher.getDartType(property.type)}? ${property.name},');
      }
    }

    return properties;
  }

  Iterable<String> _getEmptyConstructorProperties(DataComponent dataComponent) {
    return dataComponent.properties.map(
      (property) {
        if (property.isList) {
          return '${property.name}: [],';
        }
        final isEnum = _dataComponentRepository.isEnum(
            dataComponentName: dataComponent.imports.firstWhereOrNull(
                    (e) => e.pascalCase == property.type.pascalCase) ??
                '');
        final isStandartType = TypeMatcher.isStandardType(
          TypeMatcher.getDartType(property.type),
        );
        final type = !isStandartType
            ? '${property.type}Response.empty()'
            : TypeMatcher.defaultTypeValue(property.type);
        return '${property.name}: ${isEnum ? '${property.type}.values.first.toString()' : type} ,';
      },
    );
  }
}
