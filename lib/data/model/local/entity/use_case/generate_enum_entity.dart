import 'dart:async';
import 'dart:io';

import 'package:onix_flutter_bricks/data/model/local/entity/entity_wrapper.dart';
import 'package:recase/recase.dart';

class GenerateEnumEntity {
  FutureOr<void> call(
      {required String projectName,
      required String projectPath,
      required EntityWrapper entityWrapper,
      String sourceName = ''}) async {
    final name = entityWrapper.name;

    //TODO:

    final properties = entityWrapper.properties
        .map((e) => '       ${e == 'default' ? '//' : ''}$e,')
        .join('\n');

    final fileContent = '''
enum $name{
    $properties
}''';

    final path = await Directory(
            '$projectPath/$projectName/lib/domain/entity/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file = await File('${path.path}/${name.snakeCase}.dart').create();

    await file.writeAsString(fileContent);
  }
}
