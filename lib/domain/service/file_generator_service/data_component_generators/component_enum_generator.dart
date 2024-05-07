import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/params/data_component_params.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class ComponentEnumGenerator implements BaseGenerationService<bool> {
  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! DataComponentParams) {
      return false;
    }
    final name = params.dataComponent.name;
    final sourceName = params.dataComponent.sourceName;
    final codeLines = List<String>.empty(growable: true);

    ///Add content
    codeLines.add(
        'enum ${params.dataComponent.toString().replaceAll('default', '//default')};');
    codeLines.addNewLine();
    final fileContent = codeLines.join('\n');

    ///Save file
    final componentFolderName =
        sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : '';

    final path = await Directory(
      '${params.projectPath}/${params.projectName}/lib/domain/entity/$componentFolderName${name.snakeCase}',
    ).create(recursive: true);

    var file = await File('${path.path}/${name.snakeCase}.dart').create();

    await file.writeAsString(fileContent);
    return true;
  }
}
