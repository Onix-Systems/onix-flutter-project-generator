import 'dart:async';

import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc_imports.dart';

class ProjectSettingsScreenBloc extends BaseBloc<ProjectSettingsScreenEvent,
    ProjectSettingsScreenState, ProjectSettingsScreenSR> {
  ProjectSettingsScreenBloc() : super(const ProjectSettingsScreenStateData()) {
    on<ProjectSettingsScreenEventInit>(_onInit);
    on<ProjectSettingsScreenEventFlavorizeChange>(_onFlavorizeChange);
    on<ProjectSettingsScreenEventFlavorsChange>(_onFlavorsChange);
    on<ProjectSettingsScreenEventGenerateSigningKeyChange>(
        _onGenerateSigningKeyChange);
    on<ProjectSettingsScreenEventSigningVarsChange>(_onSigningVarsChange);
    on<ProjectSettingsScreenEventUseSonarChange>(_onUseSonarChange);
    on<ProjectSettingsScreenEventRouterChange>(_onRouterChange);
    on<ProjectSettingsScreenEventLocalizationChange>(_onLocalizationChange);
    on<ProjectSettingsScreenEventThemingChange>(_onThemingChange);
    on<ProjectSettingsScreenEventIntegrateDevicePreviewChange>(
        _onIntegrateDevicePreviewChange);
    add(const ProjectSettingsScreenEvent.init());
  }

  FutureOr<void> _onInit(
    ProjectSettingsScreenEventInit event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {}

  FutureOr<void> _onFlavorizeChange(
    ProjectSettingsScreenEventFlavorizeChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(flavorize: !state.flavorize));
  }

  FutureOr<void> _onFlavorsChange(
    ProjectSettingsScreenEventFlavorsChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(flavors: event.flavors));
  }

  FutureOr<void> _onGenerateSigningKeyChange(
    ProjectSettingsScreenEventGenerateSigningKeyChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(generateSigningKey: !state.generateSigningKey));
  }

  FutureOr<void> _onSigningVarsChange(
    ProjectSettingsScreenEventSigningVarsChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(signingVars: event.signingVars));
  }

  FutureOr<void> _onUseSonarChange(
    ProjectSettingsScreenEventUseSonarChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(useSonar: !state.useSonar));
  }

  FutureOr<void> _onRouterChange(
    ProjectSettingsScreenEventRouterChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    if (state.router == ProjectRouter.goRouter) {
      emit(state.copyWith(router: ProjectRouter.autoRouter));
    } else {
      emit(state.copyWith(router: ProjectRouter.goRouter));
    }
  }

  FutureOr<void> _onLocalizationChange(
    ProjectSettingsScreenEventLocalizationChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    if (state.localization == ProjectLocalization.intl) {
      emit(state.copyWith(localization: ProjectLocalization.flutter_gen));
    } else {
      emit(state.copyWith(localization: ProjectLocalization.intl));
    }
  }

  FutureOr<void> _onThemingChange(
    ProjectSettingsScreenEventThemingChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    if (state.theming == ProjectTheming.theme_tailor) {
      emit(state.copyWith(theming: ProjectTheming.manual));
    } else {
      emit(state.copyWith(theming: ProjectTheming.theme_tailor));
    }
  }

  FutureOr<void> _onIntegrateDevicePreviewChange(
    ProjectSettingsScreenEventIntegrateDevicePreviewChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(integrateDevicePreview: !state.integrateDevicePreview));
  }
}
