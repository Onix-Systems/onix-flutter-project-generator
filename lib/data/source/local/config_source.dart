import 'package:onix_flutter_bricks/data/model/local/config.dart';

abstract class ConfigSource {
  Future<Config> getConfig({required String configPath});

  Future<void> saveConfig({required Config config, required String configPath});
}
