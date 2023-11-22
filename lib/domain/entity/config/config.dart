import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/core/di/source.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
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
    @Default('') String localVersion,
    @Default('') String remoteVersion,
    @Default('') String projectPath,
    @Default('') String projectName,
    @Default(false) bool projectExists,
    @Default('') String organization,
    @Default(PlatformsList()) PlatformsList platformsList,
    @Default(false) bool flavorize,
    @Default('') String flavors,
    @Default(false) bool generateSigningKey,
    @Default(false) bool firebaseAuth,
    @Default(true) bool useSonar,
    @Default(false) bool graphql,
    @Default(ProjectRouter.goRouter) ProjectRouter router,
    @Default(ProjectLocalization.intl) ProjectLocalization localization,
    @Default(ProjectTheming.manual) ProjectTheming theming,
    @Default([
      'Your Name',
      'Department',
      'Your Company',
      'Your City',
      'Your State or Province',
      'UA',
      '',
    ])
    List<String> signingVars,
    @Default({}) Set<Screen> screens,
    // ignore: invalid_annotation_target
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<AppStyle> styles,
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
    await configSource.saveConfig(
        config: copyWith(
          screens: screenRepository.screens.map((screen) {
            screen.exists = true;
            return screen;
          }).toSet(),
          sources: sourceRepository.sources.map((source) {
            source.exists = true;
            source.isGenerated = false;
            for (var dataComponent in source.dataComponentsNames) {
              final component = dataComponentRepository.getDataComponentByName(
                  dataComponentName: dataComponent);
              component!.exists = true;
              component.isGenerated = false;
            }
            return source;
          }).toSet(),
          dataComponents:
              dataComponentRepository.dataComponents.map((dataComponent) {
            dataComponent.exists = true;
            dataComponent.isGenerated = false;
            return dataComponent;
          }).toSet(),
        ),
        configPath: '$projectPath/.gen_config.json');
  }
}
