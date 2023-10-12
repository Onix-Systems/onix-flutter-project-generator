import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class GenerateComponentClass {
  FutureOr<void> call({
    required String projectName,
    required String projectPath,
    required DataComponent dataComponent,
  }) async {
    String imports = '';
    final sourceName = dataComponent.sourceName;

    final name = dataComponent.name;

    imports = dataComponent.imports.map((e) {
      final importSourceName = dataComponentRepository
              .getDataComponentByName(dataComponentName: e)
              ?.sourceName ??
          '';
      return 'import \'package:$projectName/domain/entity/${importSourceName.isNotEmpty ? '${importSourceName.snakeCase}/' : ''}${e.snakeCase}/${e.snakeCase}.dart\';';
    }).join('\n');

    final fileContent = '''
import 'package:freezed_annotation/freezed_annotation.dart';
${'$imports\n'}
part '${name.snakeCase}.freezed.dart';
part '${name.snakeCase}.g.dart';

@freezed
class ${name.pascalCase} with _\$${name.pascalCase} {
    factory ${name.pascalCase}({
    ${dataComponent.properties.map((e) => '       $e,').join('\n')}
    }) = _${name.pascalCase};
    
    factory ${name.pascalCase}.fromJson(Map<String, dynamic> json) => _\$${name.pascalCase}FromJson(json);
    
    factory ${name.pascalCase}.empty() => ${name.pascalCase}(
${_getProperties(dataComponent: dataComponent)}
    );
}
''';

    final path = await Directory(
            '$projectPath/$projectName/lib/${name.endsWith('Request') || name.endsWith('Response') ? 'data/model/remote' : 'domain/entity'}/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.endsWith('Request') || name.endsWith('Response') ? name.stripRequestResponse().snakeCase : name.snakeCase}')
        .create(recursive: true);

    var file = await File('${path.path}/${name.snakeCase}.dart').create();

    await file.writeAsString(fileContent);
  }

  String _getProperties({required DataComponent dataComponent}) {
    final properties = <String>[];

    for (final property in dataComponent.properties) {
      if (property.isList) {
        properties.add('        ${property.name}: [],');
        continue;
      }

      if (!TypeMatcher.isStandardType(TypeMatcher.getDartType(property.type))) {
        final importName = dataComponent.imports
                .firstWhereOrNull((element) => element == property.type) ??
            '';

        final importEntity = dataComponentRepository.getDataComponentByName(
            dataComponentName: importName);

        if (importEntity != null && importEntity.isEnum) {
          properties
              .add('        ${property.name}: ${property.type}.values.first,');
        } else {
          properties.add('        ${property.name}: ${property.type}.empty(),');
        }
      } else {
        properties.add(
            '        ${property.name}: ${TypeMatcher.defaultTypeValue(property.type)},');
      }
    }

    return properties.join('\n');
  }
}
