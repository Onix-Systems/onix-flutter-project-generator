import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_entity.dart';
import 'package:onix_flutter_bricks/data/model/local/screen_entity.dart';
import 'package:onix_flutter_bricks/data/model/local/source_entity.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source_impl.dart';

part 'config.freezed.dart';

part 'config.g.dart';

@freezed
class Config with _$Config {
  const factory Config({
    required List<SourceEntity> sources,
    required List<ScreenEntity> screens,
    required List<EntityEntity> entities,
  }) = _Config;

  factory Config.empty() {
    return const Config(
      sources: [],
      screens: [],
      entities: [],
    );
  }

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  static Future<void> saveConfig(AppState state) async {
    final ConfigSource configSource = ConfigSourceImpl();

    List<ScreenEntity> screens = [];
    List<SourceEntity> sources = [];
    List<EntityEntity> entities = [];

    for (var element in state.screens) {
      screens.add(ScreenEntity.copyOf(element));
      screens.last.exists = true;
    }

    for (var element in state.entities) {
      entities.add(EntityEntity.copyOf(element));
      entities.last.exists = true;
    }

    for (var element in state.sources) {
      sources.add(SourceEntity.copyOf(element));
      for (var entity in sources.last.entities) {
        entity.exists = true;
      }
      sources.last.exists = true;
    }

    await configSource.saveConfig(
        config: Config(
          screens: screens,
          sources: sources,
          entities: entities,
        ),
        configPath:
            '${state.projectPath}/${state.projectName}/.gen_config.json');
  }
}
