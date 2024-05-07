import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/inner_enum_generator_params.dart';
import 'package:recase/recase.dart';

class InnerEnumFileGenerator implements BaseGenerationService<bool> {
  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! InnerEnumGeneratorParams) {
      return false;
    }
    final projectFolder = '${params.projectPath}/$params.projectName';
    final path = await Directory(
            '$projectFolder/lib/data/model/remote/${params.sourceName.snakeCase}/enums')
        .create(recursive: true);

    final file =
        await File('${path.path}/${params.innerEnum.name.snakeCase}.dart')
            .create();

    final codeLines = List<String>.empty(growable: true);
    codeLines.add('enum ${params.innerEnum.name.pascalCase}{');
    final properties = params.innerEnum.properties.map((e) => e.name);
    codeLines.addAll(properties);
    codeLines.add('}');

    final code = codeLines.join('\n');

    await file.writeAsString(code);
    return true;
  }
}
