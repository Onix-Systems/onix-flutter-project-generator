import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

abstract class ConfigSource {
  Future<Config> getConfig({required String configPath});

  Future<void> saveConfig({required Config config, required String configPath});
}
