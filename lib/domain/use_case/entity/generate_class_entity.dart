import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_wrapper/entity_wrapper.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

class GenerateClassEntity {
  FutureOr<void> call({
    required String projectName,
    required String projectPath,
    required EntityWrapper entityWrapper,
  }) async {
    String imports = '';
    final sourceName = entityWrapper.entity.sourceName ?? '';

    final entity = entityWrapper.entity;
    final name = entityWrapper.name;

    imports = entity.entityImports
        .map((e) =>
            'import \'package:$projectName/domain/entity/${e.sourceName.isNotEmpty ? '${e.sourceName.snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}.dart\';')
        .join('\n');

    final fileContent = '''
import 'package:freezed_annotation/freezed_annotation.dart';
${'$imports\n'}
part '${name.snakeCase}.freezed.dart';
part '${name.snakeCase}.g.dart';

@freezed
class ${name.pascalCase} with _\$${name.pascalCase} {
    factory ${name.pascalCase}({
    ${entityWrapper.properties.map((e) => '       $e,').join('\n')}
    }) = _${name.pascalCase};

    factory ${name.pascalCase}.fromJson(Map<String, dynamic> json) => _\$${name.pascalCase}FromJson(json);
    
    factory ${name.pascalCase}.empty() => ${name.pascalCase}(
${_getProperties(entityWrapper: entityWrapper)}
    );
}
''';

    final path = await Directory(
            '$projectPath/$projectName/lib/${name.endsWith('Request') || name.endsWith('Response') ? 'data/model/remote' : 'domain/entity'}/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file = await File('${path.path}/${name.snakeCase}.dart').create();

    await file.writeAsString(fileContent);
  }

  String _getProperties({required EntityWrapper entityWrapper}) {
    final properties = <String>[];

    for (final property in entityWrapper.properties) {
      if (TypeMatcher.defaultTypeValue(property.type) == (property.type)) {
        final entity = entityWrapper.entity.entityImports
            .firstWhereOrNull((element) => element.name == property.type);

        if (entity != null && entity.isEnum) {
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
