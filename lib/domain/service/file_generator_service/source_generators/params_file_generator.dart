import 'dart:io';

import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class ParamsFileGenerator {
  static Future<void> call({
    required String methodName,
    required Set<Property> methodParamsNotRequired,
    required String projectName,
    required String projectPath,
    required String sourceName,
    required List<DataComponent> innerEnums,
  }) async {
    final imports = <String>{};

    imports.add("import 'package:json_annotation/json_annotation.dart';");

    if (methodParamsNotRequired.isNotEmpty) {
      for (final parameter in methodParamsNotRequired) {
        if (parameter.type.isNotEmpty) {
          for (final importSource in sourceRepository.sources) {
            for (final entity in importSource.dataComponents) {
              if (parameter.type.contains(entity.name)) {
                innerEnums.map((e) => e.name).contains(entity.name)
                    ? imports.add(
                        "import 'package:$projectName/data/model/remote/${entity.sourceName.snakeCase}/enums/${entity.name.snakeCase}.dart';\n")
                    : imports.add(
                        "import 'package:$projectName/domain/entity/${entity.sourceName.snakeCase}/${entity.name.snakeCase}/${entity.name.snakeCase}.dart';\n");
              }
            }
          }
        }
      }
    }

    final parameters = methodParamsNotRequired
        .map((param) =>
            '${TypeMatcher.getDartType(param.type)}? ${param.name.camelCase.replaceAll(RegExp('[\\[\\]]'), '')}')
        .join(';\n');

    final fileContent = '''${imports.map((e) => e).join('')}
    
part '${methodName.snakeCase}_params.g.dart';

@JsonSerializable()
class ${methodName.pascalCase}Params{
  $parameters;
  
  ${methodName.pascalCase}Params({${methodParamsNotRequired.map((param) => 'this.${param.name.camelCase.replaceAll(RegExp('[\\[\\]]'), '')}').join(',\n')}});
        
  Map<String, dynamic> toJson() => _\$${methodName.pascalCase}ParamsToJson(this);
}    
''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/source/remote/${sourceName.snakeCase}/params')
        .create(recursive: true);

    var file =
        await File('${path.path}/${methodName.snakeCase}_params.dart').create();

    await file.writeAsString(fileContent);
  }
}
