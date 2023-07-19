import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/data/model/local/entity_wrapper/entity_wrapper.dart';
import 'package:onix_flutter_bricks/utils/extensions/replace_last.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

import '../../../core/di/di.dart';

class GenerateRequest {
  FutureOr<void> call({
    required String projectName,
    required String projectPath,
    required EntityWrapper entityWrapper,
  }) async {
    final entity = entityWrapper.entity;
    final name = entityWrapper.name;
    final sourceName = entityWrapper.entity?.sourceName ?? '';

    final imports = entity?.entityImports
        .map((e) =>
            'import \'package:$projectName/data/model/remote/${e.sourceName.isNotEmpty ? '${e.sourceName.snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}_request.dart\';')
        .join('\n');

    final fileContent =
        '''import 'package:freezed_annotation/freezed_annotation.dart';
$imports

part '${name.snakeCase}_request.freezed.dart';
part '${name.snakeCase}_request.g.dart';

@freezed
class ${name.pascalCase}Request with _\$${name.pascalCase}Request {
    factory ${name.pascalCase}Request({
${entityWrapper.properties.map((e) {
      String type = e.type;
      if (TypeMatcher.getDartType(type) == type && !type.contains('dynamic')) {
        if (type.startsWith('List')) {
          final listType = type.substring(5, type.length - 1);

          if (TypeMatcher.getDartType(listType.camelCase) ==
              listType.camelCase) {
            type = type.replaceLast('>', 'Request>');
          }
        } else {
          //Process enums
          type = '${type}Request';
        }
      }

      return '        required ${TypeMatcher.getDartType(type)} ${e.name},';
    }).join('\n')}
    }) = _${name.pascalCase}Request;

    factory ${name.pascalCase}Request.fromJson(Map<String, dynamic> json) => _\$${name.pascalCase}RequestFromJson(json);
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file =
        await File('${path.path}/${name.snakeCase}_request.dart').create();

    await file.writeAsString(fileContent);
  }
}
