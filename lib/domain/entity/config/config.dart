import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/core/di/source.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/platforms_list/platforms_list.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';

part 'config.freezed.dart';

part 'config.g.dart';

@freezed
class Config with _$Config {
  const factory Config({
    @Default('') String projectPath,
    @Default('') String projectName,
    @Default('') String organization,
    @Default(PlatformsList()) PlatformsList platformsList,
    @Default(false) final bool flavorize,
    @Default('') String flavors,
    @Default(false) bool generateSigningKey,
    @Default(false) bool useSonar,
    @Default(ProjectRouter.goRouter) ProjectRouter router,
    @Default(ProjectLocalization.intl) ProjectLocalization localization,
    @Default(ProjectTheming.manual) ProjectTheming theming,
    @Default(false) bool integrateDevicePreview,
    @Default([
      'Some developer',
      'Flutter dep',
      'Onix-Systems',
      'Kropyvnytskyi',
      'Kirovohrad oblast',
      'UA',
      '',
    ])
    List<String> signingVars,
    @Default({}) Set<Screen> screens,
    @Default('') String swaggerUrl,
    @Default({}) Set<DataComponent> dataComponents,
    @Default({}) Set<Source> sources,
  }) = _Config;

  const Config._();

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  factory Config.empty() => const Config(
        screens: {},
        dataComponents: {},
        sources: {},
      );

  Future<void> saveConfig({required String projectPath}) async {
    List<Screen> screens = [];
    List<Source> sources = [];
    List<DataComponent> dataComponents = [];

    for (var element in this.screens) {
      screens.add(Screen.copyOf(element));
      screens.last.exists = true;
    }

    for (var element in this.dataComponents) {
      dataComponents.add(DataComponent.copyOf(element));
      dataComponents.last.exists = true;
    }

    for (var element in this.sources) {
      sources.add(Source.copyOf(element));
      for (var dataComponent in sources.last.dataComponents) {
        dataComponent.exists = true;
      }
      sources.last.exists = true;
    }

    await configSource.saveConfig(
        config: Config(
          screens: screens.toSet(),
          sources: sources.toSet(),
          dataComponents: dataComponents.toSet(),
        ),
        configPath: '$projectPath/.gen_config.json');
  }
}
