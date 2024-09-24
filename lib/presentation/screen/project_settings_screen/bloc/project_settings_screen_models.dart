import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/state_management/project_state_manager.dart';

part 'project_settings_screen_models.freezed.dart';

@freezed
class ProjectSettingsScreenEvent with _$ProjectSettingsScreenEvent {
  const factory ProjectSettingsScreenEvent.init({
    required Config config,
  }) = ProjectSettingsScreenEventInit;

  const factory ProjectSettingsScreenEvent.flavorizeChange() =
      ProjectSettingsScreenEventFlavorizeChange;

  const factory ProjectSettingsScreenEvent.flavorsChange({
    required String flavors,
  }) = ProjectSettingsScreenEventFlavorsChange;

  const factory ProjectSettingsScreenEvent.generateSigningKeyChange() =
      ProjectSettingsScreenEventGenerateSigningKeyChange;

  const factory ProjectSettingsScreenEvent.signingVarsChange({
    required List<String> signingVars,
  }) = ProjectSettingsScreenEventSigningVarsChange;

  const factory ProjectSettingsScreenEvent.useSonarChange() =
      ProjectSettingsScreenEventUseSonarChange;

  const factory ProjectSettingsScreenEvent.graphQLChange() =
      ProjectSettingsScreenEventGraphQLChange;

  const factory ProjectSettingsScreenEvent.stateManagerChange({
    required ProjectStateManager stateManager,
  }) = ProjectSettingsScreenEventStateManagerChange;

  const factory ProjectSettingsScreenEvent.routerChange() =
      ProjectSettingsScreenEventRouterChange;

  const factory ProjectSettingsScreenEvent.localizationChange() =
      ProjectSettingsScreenEventLocalizationChange;

  const factory ProjectSettingsScreenEvent.themingChange() =
      ProjectSettingsScreenEventThemingChange;

  const factory ProjectSettingsScreenEvent.firebaseChange() =
      ProjectSettingsScreenEventFirebaseChange;

  const factory ProjectSettingsScreenEvent.screenUtilChange() =
      ProjectSettingsScreenEventScreenUtilChange;
}

@freezed
class ProjectSettingsScreenSR with _$ProjectSettingsScreenSR {
  const factory ProjectSettingsScreenSR.loadFinished() = _LoadFinished;
}

@freezed
class ProjectSettingsScreenState with _$ProjectSettingsScreenState {
  const factory ProjectSettingsScreenState.data({
    required Config config,
  }) = ProjectSettingsScreenStateData;
}
