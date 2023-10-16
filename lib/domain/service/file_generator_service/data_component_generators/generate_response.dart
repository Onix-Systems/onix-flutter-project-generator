import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
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

    final imports = dataComponent.imports.map((e) {
      final sourceName = dataComponentRepository
              .getDataComponentByName(dataComponentName: e)
              ?.sourceName ??
          '';
      if (!dataComponentRepository.isEnum(dataComponentName: e)) {
        return 'import \'package:$projectName/data/model/remote/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${e.snakeCase}/${e.snakeCase}_response.dart\';';
      } else {
        return 'import \'package:$projectName/domain/entity/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${e.snakeCase}/${e.snakeCase}.dart\';';
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
    ${dataComponent.properties.map((property) => _mapProperty(property, dataComponent)).join('\n')}
    );

    factory ${name.pascalCase}Response.fromJson(Map<String, dynamic> json,) => _\$${name.pascalCase}ResponseFromJson(json);
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file = File('${path.path}/${name.snakeCase}_response.dart');

    if (!await file.exists()) {
      file.create();
      await file.writeAsString(fileContent);
    }
  }

  String _getProperties({required DataComponent dataComponent}) {
    final properties = <String>[];

    for (final property in dataComponent.properties) {
      if (property.isList) {
        dataComponent.imports.contains(property.type.pascalCase)
            ? properties.add(
                '        List<${property.type.pascalCase}Response>? ${property.name},')
            : properties.add(
                '        List<${TypeMatcher.getDartType(property.type)}>? ${property.name},');
      } else {
        dataComponent.imports
                .map((e) => e.pascalCase)
                .contains(property.type.pascalCase)
            ? dataComponentRepository.isEnum(
                    dataComponentName: dataComponent.imports.firstWhereOrNull(
                        (e) => e.pascalCase == property.type.pascalCase)!)
                ? properties.add('        String? ${property.name},')
                : properties.add(
                    '        ${property.type.pascalCase}Response? ${property.name},')
            : properties.add(
                '        ${TypeMatcher.getDartType(property.type)}? ${property.name},');
      }
    }

    return properties.join('\n');
  }

  String _mapProperty(Property property, DataComponent dataComponent) {
    if (property.isList) {
      return '         ${property.name}: [],';
    }
    return '         ${property.name}: ${dataComponentRepository.isEnum(dataComponentName: dataComponent.imports.firstWhereOrNull((e) => e.pascalCase == property.type.pascalCase) ?? '') ? '${property.type}.values.first.toString()' : !TypeMatcher.isStandardType(TypeMatcher.getDartType(property.type)) ? '${property.type}Response.empty()' : TypeMatcher.defaultTypeValue(property.type)} ,';
  }
}
