import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/state_management/project_state_manager.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/enum/project_localization.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:onix_flutter_bricks/util/enum/project_theming.dart';

class ProjectSettingsScreenBloc extends BaseBloc<ProjectSettingsScreenEvent,
    ProjectSettingsScreenState, ProjectSettingsScreenSR> {
  final ScreenRepository _screenRepository;

  ProjectSettingsScreenBloc({
    required ScreenRepository screenRepository,
  })  : _screenRepository = screenRepository,
        super(const ProjectSettingsScreenStateData(config: Config())) {
    on<ProjectSettingsScreenEventInit>(_onInit);
    on<ProjectSettingsScreenEventFlavorizeChange>(_onFlavorizeChange);
    on<ProjectSettingsScreenEventFlavorsChange>(_onFlavorsChange);
    on<ProjectSettingsScreenEventGenerateSigningKeyChange>(
      _onGenerateSigningKeyChange,
    );
    on<ProjectSettingsScreenEventSigningVarsChange>(_onSigningVarsChange);
    on<ProjectSettingsScreenEventUseSonarChange>(_onUseSonarChange);
    on<ProjectSettingsScreenEventGraphQLChange>(_onGraphQLChange);
    on<ProjectSettingsScreenEventStateManagerChange>(_onStateManagerChange);
    on<ProjectSettingsScreenEventRouterChange>(_onRouterChange);
    on<ProjectSettingsScreenEventLocalizationChange>(_onLocalizationChange);
    on<ProjectSettingsScreenEventThemingChange>(_onThemingChange);
    on<ProjectSettingsScreenEventFirebaseChange>(_onFirebaseChange);
    on<ProjectSettingsScreenEventScreenUtilChange>(_onScreenUtilChange);
    on<ProjectSettingsScreenEventSentryChange>(_onSentryChange);
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
        config:
            state.config.copyWith(generateSigningKey: event.generateSigningKey),
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
    final isStrategyMatch = screensMatchStrategy(event.stateManager);

    if (!isStrategyMatch) {
      logger
        ..f('Screens do not match the strategy')
        ..f(event.stateManager.strategy.variants);

      final screens = state.config.screens.map((e) {
        e.stateVariant = event.stateManager.strategy.variants.first;
        return e;
      }).toSet();

      _screenRepository
        ..empty()
        ..addAll(screens: screens);

      emit(
        state.copyWith(
          config: state.config.copyWith(
            stateManager: event.stateManager,
            screens: screens,
          ),
        ),
      );

      return;
    }

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
    ProjectSettingsScreenEventScreenUtilChange _,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(
          screenUtil:
              !state.config.platformsList.webOnly && !state.config.screenUtil,
        ),
      ),
    );
  }

  void _onSentryChange(
    ProjectSettingsScreenEventSentryChange _,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(
          sentry: !state.config.sentry,
        ),
      ),
    );
  }

  bool screensMatchStrategy(ProjectStateManager manager) {
    final strategyVariants = manager.strategy.variants;

    var screensMatch = true;

    for (final screen in state.config.screens) {
      if (!strategyVariants.contains(screen.stateVariant)) {
        screensMatch = false;
      }
    }

    return screensMatch;
  }
}
