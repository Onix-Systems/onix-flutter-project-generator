import 'dart:async';

import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc_imports.dart';

class ProjectSettingsScreenBloc extends BaseBloc<ProjectSettingsScreenEvent,
    ProjectSettingsScreenState, ProjectSettingsScreenSR> {
  ProjectSettingsScreenBloc()
      : super(const ProjectSettingsScreenStateData(config: Config())) {
    on<ProjectSettingsScreenEventInit>(_onInit);
    on<ProjectSettingsScreenEventFlavorizeChange>(_onFlavorizeChange);
    on<ProjectSettingsScreenEventFlavorsChange>(_onFlavorsChange);
    on<ProjectSettingsScreenEventGenerateSigningKeyChange>(
        _onGenerateSigningKeyChange);
    on<ProjectSettingsScreenEventSigningVarsChange>(_onSigningVarsChange);
    on<ProjectSettingsScreenEventUseSonarChange>(_onUseSonarChange);
    on<ProjectSettingsScreenEventGraphQLChange>(_onGraphQLChange);
    on<ProjectSettingsScreenEventRouterChange>(_onRouterChange);
    on<ProjectSettingsScreenEventLocalizationChange>(_onLocalizationChange);
    on<ProjectSettingsScreenEventThemingChange>(_onThemingChange);
  }

  FutureOr<void> _onInit(
    ProjectSettingsScreenEventInit event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(
      config: event.config,
    ));
  }

  FutureOr<void> _onFlavorizeChange(
    ProjectSettingsScreenEventFlavorizeChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(
        config: state.config.copyWith(flavorize: !state.config.flavorize)));
  }

  FutureOr<void> _onFlavorsChange(
    ProjectSettingsScreenEventFlavorsChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(config: state.config.copyWith(flavors: event.flavors)));
  }

  FutureOr<void> _onGenerateSigningKeyChange(
    ProjectSettingsScreenEventGenerateSigningKeyChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(
        config: state.config
            .copyWith(generateSigningKey: !state.config.generateSigningKey)));
  }

  FutureOr<void> _onSigningVarsChange(
    ProjectSettingsScreenEventSigningVarsChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(
        config: state.config.copyWith(signingVars: event.signingVars)));
  }

  FutureOr<void> _onUseSonarChange(
    ProjectSettingsScreenEventUseSonarChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(
        config: state.config.copyWith(useSonar: !state.config.useSonar)));
  }

  FutureOr<void> _onGraphQLChange(
    ProjectSettingsScreenEventGraphQLChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(
        config: state.config.copyWith(graphql: !state.config.graphql)));
  }

  FutureOr<void> _onRouterChange(
    ProjectSettingsScreenEventRouterChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(
        config: state.config.copyWith(
            router: state.config.router == ProjectRouter.goRouter
                ? ProjectRouter.autoRouter
                : ProjectRouter.goRouter)));
  }

  FutureOr<void> _onLocalizationChange(
    ProjectSettingsScreenEventLocalizationChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(
        config: state.config.copyWith(
            localization: state.config.localization == ProjectLocalization.intl
                ? ProjectLocalization.flutter_gen
                : ProjectLocalization.intl)));
  }

  FutureOr<void> _onThemingChange(
    ProjectSettingsScreenEventThemingChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(state.copyWith(
        config: state.config.copyWith(
            theming: state.config.theming == ProjectTheming.theme_tailor
                ? ProjectTheming.manual
                : ProjectTheming.theme_tailor)));
  }
}
