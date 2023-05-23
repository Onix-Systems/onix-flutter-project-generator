import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/data/model/local/entity/entity_wrapper.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

class GenerateResponse {
  FutureOr<void> call(
      {required String projectName,
      required String projectPath,
      required EntityWrapper entityWrapper,
      String sourceName = ''}) async {
    final entity = entityWrapper.entity;
    final name = entityWrapper.name;

    final imports = entity?.entityImports
        .map((e) =>
            'import \'package:$projectName/data/model/remote/${e.sourceName.isNotEmpty ? '${e.sourceName.snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}_response.dart\';')
        .join('\n');

    final fileContent =
        '''import 'package:freezed_annotation/freezed_annotation.dart';
$imports

part '${name.snakeCase}_response.freezed.dart';
part '${name.snakeCase}_response.g.dart';

@freezed
class ${name.pascalCase}Response with _\$${name.pascalCase}Response {
    factory ${name.pascalCase}Response({
${_getProperties(entityWrapper: entityWrapper)}
    }) = _${name.pascalCase}Response;

    factory ${name.pascalCase}Response.fromJson(Map<String, dynamic> json) => _\$${name.pascalCase}ResponseFromJson(json);
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file =
        await File('${path.path}/${name.snakeCase}_response.dart').create();

    await file.writeAsString(fileContent);
  }

  String _getProperties({required EntityWrapper entityWrapper}) {
    final properties = <String>[];

    for (final property in entityWrapper.properties) {
      if (property.type.startsWith('List')) {
        final type = property.type.substring(5, property.type.length - 1);
        entityWrapper.entity!.imports.contains(type.toLowerCase())
            ? properties.add(
                '        List<${type.pascalCase}Response>? ${property.name},')
            : properties.add(
                '        List<${TypeMatcher.getDartType(type)}>? ${property.name},');
      } else {
        entityWrapper.entity!.imports.contains(property.type.toLowerCase())
            ? properties.add(
                '        ${property.type.pascalCase}Response? ${property.name},')
            : properties.add(
                '        ${TypeMatcher.getDartType(property.type)}? ${property.name},');
      }
    }

    return properties.join('\n');
  }
}
