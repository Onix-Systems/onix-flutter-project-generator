import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:recase/recase.dart';

class GenerateComponentEnum {
  FutureOr<void> call(
      {required String projectName,
      required String projectPath,
      required DataComponent dataComponent}) async {
    final name = dataComponent.name;
    final sourceName = dataComponent.sourceName;

    final fileContent = '''
enum ${dataComponent.toString().replaceAll('default', '//default')}
''';

    final path = await Directory(
            '$projectPath/$projectName/lib/domain/entity/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file = await File('${path.path}/${name.snakeCase}.dart').create();

    await file.writeAsString(fileContent);
  }
}
