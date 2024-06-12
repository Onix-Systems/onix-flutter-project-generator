import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/json_class_variable.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/class_builder/freezed_class_builder.dart';
import 'package:onix_flutter_bricks/domain/service/base/class_builder/json_class_builder.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/params/data_component_params.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class RequestGenerator implements BaseGenerationService<bool> {
  final DataComponentRepository _dataComponentRepository;

  RequestGenerator(this._dataComponentRepository);

  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! DataComponentParams) {
      return false;
    }
    final name = params.dataComponent.name;
    final sourceName = params.dataComponent.sourceName;

    final imports = _getImports(
      params.projectName,
      params.dataComponent,
    );

    final properties = _getProperties(params.dataComponent);

    final variableDeclarations = JsonClassBuilder.variablesFromJsonVariable(
      properties,
    );
    final constructorProperties =
    JsonClassBuilder.constructorPropertiesFromJsonVariable(
      properties,
    );

    final jsonClass = JsonClassBuilder(
      className: name,
      classNameSuffix: 'request',
    )
      ..withToJson = true
      ..imports = imports
      ..variableDeclarations = variableDeclarations
      ..baseConstructorProperties = constructorProperties;
    final fileContent = jsonClass.build();

    final path = await Directory(
            '${params.projectPath}/${params.projectName}/lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file = File('${path.path}/${name.snakeCase}_request.dart');

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
        final isEnum = _dataComponentRepository.isEnum(dataComponentName: e);
        final importSourcePath =
            sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : '';
        if (isEnum) {
          return 'import \'package:$projectName/domain/entity/$importSourcePath${e.snakeCase}/${e.snakeCase}.dart\';';
        } else {
          return 'import \'package:$projectName/data/model/remote/$importSourcePath${e.snakeCase}/${e.snakeCase}_request.dart\';';
        }
      },
    );
    return imports;
  }

  Iterable<JsonClassVariable> _getProperties(
    DataComponent dataComponent,
  ) {
    final properties = dataComponent.properties.map(
      (e) {
        String type = e.type;
        final isDynamic = type.contains('dynamic');
        final isStandardType = TypeMatcher.isStandardType(
          TypeMatcher.getDartType(type),
        );
        if (!isStandardType && !isDynamic) {
          final import = dataComponent.imports.firstWhereOrNull(
              (element) => element.pascalCase == type.pascalCase);
          final isEnum =
              _dataComponentRepository.isEnum(dataComponentName: import ?? '');
          if (import != null && !isEnum) {
            type = '${type}Request';
          } else {
            type = 'String';
          }
        }

        if (e.isList) {
          type = 'List<${TypeMatcher.getDartType(type)}>';
        }

        final dartType = TypeMatcher.getDartType(type);

        return JsonClassVariable(
          dartType: dartType,
          name: e.name,
          nullable: e.nullable,
        );
      },
    );
    return properties;
  }
}
