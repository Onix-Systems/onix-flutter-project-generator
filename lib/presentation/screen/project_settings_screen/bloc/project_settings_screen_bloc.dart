import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/enum/project_localization.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:onix_flutter_bricks/util/enum/project_theming.dart';

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
    on<ProjectSettingsScreenEventStateManagerChange>(_onStateManagerChange);
    on<ProjectSettingsScreenEventRouterChange>(_onRouterChange);
    on<ProjectSettingsScreenEventLocalizationChange>(_onLocalizationChange);
    on<ProjectSettingsScreenEventThemingChange>(_onThemingChange);
    on<ProjectSettingsScreenEventFirebaseChange>(_onFirebaseChange);
    on<ProjectSettingsScreenEventScreenUtilChange>(_onScreenUtilChange);
  }

  void _onInit(
    ProjectSettingsScreenEventInit event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: event.config,
      ),
    );
  }

  void _onFlavorizeChange(
    ProjectSettingsScreenEventFlavorizeChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(flavorize: !state.config.flavorize),
      ),
    );
  }

  void _onFlavorsChange(
    ProjectSettingsScreenEventFlavorsChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(
          flavors: event.flavors.trim(),
        ),
      ),
    );
  }

  void _onGenerateSigningKeyChange(
    ProjectSettingsScreenEventGenerateSigningKeyChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config
            .copyWith(generateSigningKey: !state.config.generateSigningKey),
      ),
    );
  }

  void _onSigningVarsChange(
    ProjectSettingsScreenEventSigningVarsChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(signingVars: event.signingVars),
      ),
    );
  }

  void _onUseSonarChange(
    ProjectSettingsScreenEventUseSonarChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(useSonar: !state.config.useSonar),
      ),
    );
  }

  void _onGraphQLChange(
    ProjectSettingsScreenEventGraphQLChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(graphql: !state.config.graphql),
      ),
    );
  }

  void _onStateManagerChange(
    ProjectSettingsScreenEventStateManagerChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(
          stateManager: event.stateManager,
        ),
      ),
    );
  }

  void _onRouterChange(
    ProjectSettingsScreenEventRouterChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(
          router: state.config.router == ProjectRouter.goRouter
              ? ProjectRouter.autoRouter
              : ProjectRouter.goRouter,
        ),
      ),
    );
  }

  void _onLocalizationChange(
    ProjectSettingsScreenEventLocalizationChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(
          localization: state.config.localization == ProjectLocalization.intl
              ? ProjectLocalization.flutterGen
              : ProjectLocalization.intl,
        ),
      ),
    );
  }

  void _onThemingChange(
    ProjectSettingsScreenEventThemingChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(
          theming: state.config.theming == ProjectTheming.themeTailor
              ? ProjectTheming.manual
              : ProjectTheming.themeTailor,
        ),
      ),
    );
  }

  void _onFirebaseChange(
    ProjectSettingsScreenEventFirebaseChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(firebaseAuth: !state.config.firebaseAuth),
      ),
    );
  }

  void _onScreenUtilChange(
    ProjectSettingsScreenEventScreenUtilChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(
          screenUtil: state.config.platformsList.webOnly
              ? false
              : !state.config.screenUtil,
        ),
      ),
    );
  }
}
