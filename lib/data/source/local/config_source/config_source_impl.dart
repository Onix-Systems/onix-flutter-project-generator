import 'dart:convert';
import 'dart:io';

import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source/config_source.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

class ConfigSourceImpl implements ConfigSource {
  @override
  Future<Config> getConfig({required String configPath}) async {
    var file = File(configPath);

    if (!file.existsSync()) {
      logger.d('file not exists: $configPath');
      return Config.empty();
    }

    return Config.fromJson(jsonDecode(file.readAsStringSync()));
  }

  @override
  Future<void> saveConfig(
      {required Config config, required String configPath}) async {
    var file = await File(configPath).create();
    await file.writeAsString(jsonEncode(config.toJson()));
  }
}
