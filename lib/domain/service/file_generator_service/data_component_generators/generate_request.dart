import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class GenerateRequest {
  FutureOr<void> call({
    required String projectName,
    required String projectPath,
    required DataComponent dataComponent,
  }) async {
    final name = dataComponent.name;
    final sourceName = dataComponent.sourceName;

    final imports = dataComponent.componentImports.map((e) {
      if (e.isEnum) {
        return 'import \'package:$projectName/domain/entity/${sourceRepository.getDataComponentSourceName(e.name).isNotEmpty ? '${sourceRepository.getDataComponentSourceName(e.name).snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}.dart\';';
      } else {
        return 'import \'package:$projectName/data/model/remote/${sourceRepository.getDataComponentSourceName(e.name).isNotEmpty ? '${sourceRepository.getDataComponentSourceName(e.name).snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}_request.dart\';';
      }
    }).join('\n');

    final fileContent =
        '''import 'package:freezed_annotation/freezed_annotation.dart';
$imports

part '${name.snakeCase}_request.freezed.dart';
part '${name.snakeCase}_request.g.dart';

@freezed
class ${name.pascalCase}Request with _\$${name.pascalCase}Request {
    factory ${name.pascalCase}Request({
${dataComponent.properties.map((e) {
      String type = e.type;
      if (!TypeMatcher.isStandardType(TypeMatcher.getDartType(type)) &&
          !type.contains('dynamic')) {
        final import = dataComponent.componentImports.firstWhereOrNull(
            (element) => element.name.pascalCase == type.pascalCase);
        if (import != null && !import.isEnum) {
          if (import.name.pascalCase == 'MyAccount') {
            logger.f(import);
          }
          type = '${type}Request';
        } else {
          type = 'String';
        }
      }

      if (e.isList) {
        type = 'List<${TypeMatcher.getDartType(type)}>';
      }

      return '        ${e.nullable ? '@JsonKey(includeIfNull: false)' : 'required'} ${TypeMatcher.getDartType(type)}${e.nullable ? '?' : ''} ${e.name},';
    }).join('\n')}
    }) = _${name.pascalCase}Request;

    factory ${name.pascalCase}Request.fromJson(Map<String, dynamic> json) => _\$${name.pascalCase}RequestFromJson(json);
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file = File('${path.path}/${name.snakeCase}_request.dart');

    if (!await file.exists()) {
      file.create();
      await file.writeAsString(fileContent);
    }
  }
}
