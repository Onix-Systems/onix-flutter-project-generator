import 'dart:convert';
import 'dart:io';

import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/config/config.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source.dart';

class ConfigSourceImpl implements ConfigSource {
  @override
  Future<Config> getConfig({required String configPath}) async {
    var file = File(configPath);

    if (!file.existsSync()) {
      logger.d('file not exists: $configPath');
      return Config.empty();
    }

    var config = Config.fromJson(jsonDecode(file.readAsStringSync()));
    logger.d('loadConfig: $config, $configPath');
    return config;
  }

  @override
  Future<void> saveConfig(
      {required Config config, required String configPath}) async {
    logger.d('saveConfig: $config, $configPath');
    var file = await File(configPath).create();
    await file.writeAsString(jsonEncode(config.toJson()));
  }
}
