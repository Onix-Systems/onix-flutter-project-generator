import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/core/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/core/di/source.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/entity/platforms_list/platforms_list.dart';
import 'package:onix_flutter_bricks/domain/entity/state_management/project_state_manager.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/util/enum/project_localization.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:onix_flutter_bricks/util/enum/project_theming.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
class Config with _$Config {
  const factory Config({
    @Default('main') String branch,
    @Default('') String localVersion,
    @Default('') String remoteVersion,
    @Default('') String projectPath,
    @Default('') String projectName,
    @Default(false) bool projectExists,
    @Default('') String organization,
    @Default(PlatformsList()) PlatformsList platformsList,
    @Default(ProjectStateManager.bloc) ProjectStateManager stateManager,
    @Default(false) bool flavorize,
    @Default('') String flavors,
    @Default(false) bool generateSigningKey,
    @Default(false) bool firebaseAuth,
    @Default(true) bool useSonar,
    @Default(false) bool graphql,
    @Default(true) bool screenUtil,
    @Default(ProjectRouter.goRouter) ProjectRouter router,
    @Default(ProjectLocalization.intl) ProjectLocalization localization,
    @Default(ProjectTheming.manual) ProjectTheming theming,
    @Default(AppConsts.defaultSigningVars) List<String> signingVars,
    @Default({}) Set<Screen> screens,
    // ignore: invalid_annotation_target
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<AppStyle> styles,
    @Default('') String swaggerUrl,
  }) = _Config;

  const Config._();

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  factory Config.empty() => const Config(
        screens: {},
      );

  bool get useScreenUtil => screenUtil && !platformsList.webOnly;

  Future<void> saveConfig({required String projectPath}) async {
    await configSource.saveConfig(
        config: copyWith(
          screens: screenRepository.screens.map((screen) {
            screen.exists = true;
            return screen;
          }).toSet(),
        ),
        configPath: '$projectPath/.gen_config.json');
  }
}
