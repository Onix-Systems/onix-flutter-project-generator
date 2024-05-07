import 'dart:io';

import 'package:onix_flutter_bricks/core/di/repository.dart';

import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/params_generator_params.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class ParamsFileGenerator implements BaseGenerationService<bool> {
  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! ParamsGeneratorParams) {
      return false;
    }
    final importLines = List<String>.empty(growable: true);
    final codeLines = List<String>.empty(growable: true);

    importLines.add('import \'package:json_annotation/json_annotation.dart\';');

    if (params.methodParamsNotRequired.isNotEmpty) {
      ///fro each params
      for (final parameter in params.methodParamsNotRequired) {
        if (parameter.type.isNotEmpty) {
          ///for each source
          for (final importSource in sourceRepository.sources) {
            ///for each data component
            for (final entity in importSource.dataComponentsNames) {
              if (parameter.type.contains(entity)) {
                final entitySourceName = dataComponentRepository
                        .getDataComponentByName(dataComponentName: entity)
                        ?.sourceName ??
                    '';

                ///create imports
                params.innerEnums.map((e) => e.name).contains(entity)
                    ? importLines.add(
                        'import \'package:${params.projectName}/data/model/remote/${entitySourceName.snakeCase}/enums/${entity.snakeCase}.dart\';\n')
                    : importLines.add(
                        'import \'package:${params.projectName}/domain/entity/${entitySourceName.snakeCase}/${entity.snakeCase}/${entity.snakeCase}.dart\';\n');
              }
            }
          }
        }
      }
    }

    ///imports
    codeLines.addAll(importLines);
    codeLines.addNewLine();
    codeLines.add('part \'${params.methodName.snakeCase}_params.g.dart\';');
    codeLines.addNewLine();
    codeLines.add('@JsonSerializable()');
    codeLines.add('class ${params.methodName.pascalCase}Params{');

    ///variable parameters
    final parameters = params.methodParamsNotRequired.map(
      (param) =>
          '${TypeMatcher.getDartType(param.type)}? ${param.name.camelCase.replaceAll(RegExp('[\\[\\]]'), '')}',
    );
    codeLines.addAll(parameters);
    final methodParams = params.methodParamsNotRequired.map(
      (param) =>
          'this.${param.name.camelCase.replaceAll(RegExp('[\\[\\]]'), '')}',
    );

    ///method params
    codeLines.add('${params.methodName.pascalCase}Params({');
    codeLines.addAll(methodParams);
    codeLines.add('});');
    codeLines.addNewLine();
    codeLines.add(
        'Map<String, dynamic> toJson() => _\$${params.methodName.pascalCase}ParamsToJson(this);');
    codeLines.add('}');
    codeLines.addNewLine();

    final fileContent = codeLines.join('\n');

    final path = await Directory(
            '${params.projectPath}/${params.projectName}/lib/data/source/remote/${params.sourceName.snakeCase}/params')
        .create(recursive: true);

    var file =
        await File('${path.path}/${params.methodName.snakeCase}_params.dart')
            .create();

    await file.writeAsString(fileContent);
    return false;
  }
}
