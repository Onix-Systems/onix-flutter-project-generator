import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class GenerateResponse {
  FutureOr<void> call({
    required String projectName,
    required String projectPath,
    required DataComponent dataComponent,
  }) async {
    final sourceName = dataComponent.sourceName;
    final name = dataComponent.name;

    final imports = dataComponent.componentImports
        /*.where((e) => !e.isEnum)*/
        .map((e) {
      if (!e.isEnum) {
        return 'import \'package:$projectName/data/model/remote/${sourceRepository.getDataComponentSourceName(e.name).isNotEmpty ? '${sourceRepository.getDataComponentSourceName(e.name).snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}_response.dart\';';
      } else {
        return 'import \'package:$projectName/domain/entity/${sourceRepository.getDataComponentSourceName(e.name).isNotEmpty ? '${sourceRepository.getDataComponentSourceName(e.name).snakeCase}/' : ''}${e.name.snakeCase}/${e.name.snakeCase}.dart\';';
      }
    }).join('\n');

    final fileContent =
        '''import 'package:freezed_annotation/freezed_annotation.dart';
$imports

part '${name.snakeCase}_response.freezed.dart';
part '${name.snakeCase}_response.g.dart';

@freezed
class ${name.pascalCase}Response with _\$${name.pascalCase}Response {
    factory ${name.pascalCase}Response({
${_getProperties(dataComponent: dataComponent)}
    }) = _${name.pascalCase}Response;
    
    factory ${name.pascalCase}Response.empty() => ${name.pascalCase}Response(
    ${dataComponent.properties.map((property) => '        ${property.name}: ${dataComponent.componentImports.firstWhereOrNull((e) => e.name.pascalCase == property.type.pascalCase)?.isEnum ?? false ? '${property.type}.values.first.toString()' : TypeMatcher.defaultTypeValue(property.type) == property.type ? '${property.type}Response.empty()' : TypeMatcher.defaultTypeValue(property.type)} ,').join('\n')}
    );

    factory ${name.pascalCase}Response.fromJson(Map<String, dynamic> json,) => _\$${name.pascalCase}ResponseFromJson(json);
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file =
        await File('${path.path}/${name.snakeCase}_response.dart').create();

    await file.writeAsString(fileContent);
  }

  String _getProperties({required DataComponent dataComponent}) {
    final properties = <String>[];

    for (final property in dataComponent.properties) {
      if (property.type.startsWith('List')) {
        final type = property.type.substring(5, property.type.length - 1);
        dataComponent.imports.contains(type.pascalCase)
            ? properties.add(
                '        List<${type.pascalCase}Response>? ${property.name},')
            : properties.add(
                '        List<${TypeMatcher.getDartType(type)}>? ${property.name},');
      } else {
        dataComponent.imports
                .map((e) => e.pascalCase)
                .contains(property.type.pascalCase)
            ? dataComponent.componentImports
                    .firstWhereOrNull(
                        (e) => e.name.pascalCase == property.type.pascalCase)!
                    .isEnum
                ? properties.add('        String? ${property.name},')
                : properties.add(
                    '        ${property.type.pascalCase}Response? ${property.name},')
            : properties.add(
                '        ${TypeMatcher.getDartType(property.type)}? ${property.name},');
      }
    }

    return properties.join('\n');
  }
}
