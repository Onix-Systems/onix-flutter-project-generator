import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/fastlane_service/enums/fastlane_env_vars.dart';

typedef FastlaneEnvsData = Map<FastlaneEnvVars, String>;

class FastlaneEnvsCreator {
  const FastlaneEnvsCreator();

  Future<File> create({required String path, required String name}) {
    final flavorName = name.isEmpty ? '' : '_$name';
    return File('$path.env$flavorName').create();
  }

  Future<void> write({
    required File file,
    required Map<FastlaneEnvVars, String> data,
  }) async {
    final contents = <String>[];

    for (final entry in data.entries) {
      contents.add('${entry.key.variableName}=${entry.value}');
    }

    await file.writeAsString(contents.join('\n'));
  }
}
