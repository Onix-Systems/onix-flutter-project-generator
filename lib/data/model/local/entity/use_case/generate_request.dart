import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/data/model/local/entity/entity_wrapper.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

class GenerateRequest {
  FutureOr<void> call(
      {required String projectName,
      required String projectPath,
      required EntityWrapper entityWrapper,
      String sourceName = ''}) async {
    final entity = entityWrapper.entity;
    final name = entityWrapper.name;

    final imports = entity?.entityImports
        .map((e) =>
            'import \'package:$projectName/domain/entity/${e.sourceName.isNotEmpty ? '${e.sourceName.snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}.dart\';')
        .join('\n');

    final fileContent =
        '''import 'package:freezed_annotation/freezed_annotation.dart';
$imports

part '${name.snakeCase}_request.freezed.dart';
part '${name.snakeCase}_request.g.dart';

@freezed
class ${name.pascalCase}Request with _\$${name.pascalCase}Request {
    factory ${name.pascalCase}Request({
${entityWrapper.properties.map((e) => '        required ${TypeMatcher.getDartType(e.type)} ${e.name},').join('\n')}
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
