import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:recase/recase.dart';

class InnerEnumFileGenerator {
  static Future<void> call({
    required DataComponent innerEnum,
    required String projectName,
    required String projectPath,
    required String sourceName,
  }) async {
    final path = await Directory(
            '$projectPath/$projectName/lib/data/model/remote/${sourceName.snakeCase}/enums')
        .create(recursive: true);

    var file =
        await File('${path.path}/${innerEnum.name.snakeCase}.dart').create();

    final fileContent = '''enum ${innerEnum.name.pascalCase}{
      ${innerEnum.properties.map((e) => e.name.snakeCase).join(',\n')}
    }''';

    await file.writeAsString(fileContent);
  }
}
