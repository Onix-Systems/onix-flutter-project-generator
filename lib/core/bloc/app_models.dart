import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/utils/platforms_list.dart';

part 'app_models.freezed.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.init({
    required String projectPath,
  }) = Init;

  const factory AppEvent.onTabChange({
    required int tabIndex,
  }) = TabChange;

  const factory AppEvent.onProjectPathChange({
    required String projectPath,
  }) = ProjectPathChange;

  const factory AppEvent.onProjectNameChange({
    required String projectName,
  }) = ProjectNameChange;

  const factory AppEvent.projectCheck() = ProjectCheck;

  const factory AppEvent.onOrganizationChange({
    required String organization,
  }) = OrganizationChange;

  const factory AppEvent.onFlavorizeChange() = FlavorizeChange;

  const factory AppEvent.onFlavorsChange({
    required String flavors,
  }) = FlavorsChange;

  const factory AppEvent.onRouterChange() = RouterChange;

  const factory AppEvent.onLocalizationChange() = LocalizationChange;

  const factory AppEvent.onGenerateSigningKeyChange() =
      GenerateSigningKeyChange;

  const factory AppEvent.onUseSonarChange() = UseSonarChange;

  const factory AppEvent.onIntegrateDevicePreviewChange() =
      IntegrateDevicePreviewChange;

  const factory AppEvent.onSigningVarsChange({
    required List<String> signingVars,
  }) = SigningVarsChange;

  const factory AppEvent.onPlatformsChange({
    required PlatformsList platforms,
  }) = PlatformsChange;
}

@freezed
class AppState with _$AppState {
  const factory AppState.data({
    required String projectPath,
    @Default('new_project')
        String projectName,
    @Default(false)
        bool projectExists,
    @Default('com.example')
        String organization,
    @Default(false)
        bool flavorize,
    @Default({})
        Set<String> flavors,
    @Default(ProjectRouter.goRouter)
        ProjectRouter router,
    @Default(ProjectLocalization.intl)
        ProjectLocalization localization,
    @Default(true)
        bool generateSigningKey,
    @Default(true)
        bool useSonar,
    @Default(false)
        bool integrateDevicePreview,
    @Default([
      'Some developer',
      'Flutter dep',
      'Onix-Systems',
      'Kropyvnytskyi',
      'Kirovohrad oblast',
      'UA'
    ])
        List<String> signingVars,
    required PlatformsList platforms,
    @Default(0)
        int tab,
  }) = Data;
}

enum ProjectRouter { goRouter, autoRouter }

enum ProjectLocalization { intl, flutter_gen }
