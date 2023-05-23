import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/data/model/local/entity/entity_wrapper.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

class GenerateClassEntity {
  FutureOr<void> call(
      {required String projectName,
      required String projectPath,
      required EntityWrapper entityWrapper,
      String sourceName = ''}) async {
    String imports = '';

    final entity = entityWrapper.entity;
    final name = entityWrapper.name;

    if (entity != null) {
      imports = entity.entityImports
          .map((e) =>
              'import \'package:$projectName/domain/entity/${e.sourceName.isNotEmpty ? '${e.sourceName.snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}.dart\';')
          .join('\n');
    }

    final fileContent = '''
import 'package:freezed_annotation/freezed_annotation.dart';
${'$imports\n'}
part '${name.snakeCase}.freezed.dart';
part '${name.snakeCase}.g.dart';

@freezed
class $name with _\$$name {
    factory $name({
    ${entityWrapper.properties.map((e) => '       $e,').join('\n')}
    }) = _$name;

    factory $name.fromJson(Map<String, dynamic> json) => _\$${name}FromJson(json);
    
    factory $name.empty() => $name(
        ${entityWrapper.properties.map((e) => '        ${e.name}: ${TypeMatcher.defaultTypeValue(e.type) == (e.type) ? '${e.type}.empty()' : TypeMatcher.defaultTypeValue(e.type)},').join('\n')}
    );
}
''';

    final path = await Directory(
            '$projectPath/$projectName/lib/domain/entity/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file = await File('${path.path}/${name.snakeCase}.dart').create();

    await file.writeAsString(fileContent);
  }
}
