import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/state_management/project_state_manager.dart';
import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/service/config_service/config_service.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/enum/project_localization.dart';
import 'package:onix_flutter_bricks/util/enum/project_router.dart';
import 'package:onix_flutter_bricks/util/enum/project_theming.dart';

class ProjectSettingsScreenBloc extends BaseBloc<ProjectSettingsScreenEvent,
    ProjectSettingsScreenState, ProjectSettingsScreenSR> {
  final ScreenRepository _screenRepository;
  final ConfigService _configService;

  Config get _config => _configService.config;

  ProjectSettingsScreenBloc({
    required ScreenRepository screenRepository,
    required ConfigService configService,
  })  : _screenRepository = screenRepository,
        _configService = configService,
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
    on<ProjectSettingsScreenEventArchChange>(_onArchChange);
  }

  void _onInit(
    ProjectSettingsScreenEventInit event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: _configService.config,
      ),
    );
    addSr(const ProjectSettingsScreenSR.loadFinished());
  }

  void _onFlavorizeChange(
    ProjectSettingsScreenEventFlavorizeChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    _configService.updateWith(
      flavorize: !state.config.flavorize,
    );

    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onFlavorsChange(
    ProjectSettingsScreenEventFlavorsChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    _configService.updateWith(
      flavors: event.flavors.trim(),
    );

    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onGenerateSigningKeyChange(
    ProjectSettingsScreenEventGenerateSigningKeyChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    _configService.updateWith(
      generateSigningKey: event.generateSigningKey,
    );

    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onSigningVarsChange(
    ProjectSettingsScreenEventSigningVarsChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    _configService.updateWith(
      signingVars: event.signingVars,
    );
    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onUseSonarChange(
    ProjectSettingsScreenEventUseSonarChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    _configService.updateWith(
      useSonar: !state.config.useSonar,
    );
    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onGraphQLChange(
    ProjectSettingsScreenEventGraphQLChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    _configService.updateWith(
      graphql: !state.config.graphql,
    );
    emit(
      state.copyWith(
        config: _config,
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
        if (e.stateVariant is! StatefulStateManagementVariant &&
            e.stateVariant is! StatelessStateManagementVariant) {
          e.stateVariant = event.stateManager.strategy.variants.first;
        }
        return e;
      }).toSet();

      _screenRepository
        ..empty()
        ..addAll(screens: screens);

      _configService.updateWith(
        stateManager: event.stateManager,
        screens: screens,
      );

      emit(
        state.copyWith(
          config: _config,
        ),
      );

      return;
    }

    _configService.updateWith(
      stateManager: event.stateManager,
    );

    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onRouterChange(
    ProjectSettingsScreenEventRouterChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    _configService.updateWith(
      router: state.config.router == ProjectRouter.goRouter
          ? ProjectRouter.autoRouter
          : ProjectRouter.goRouter,
    );
    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onLocalizationChange(
    ProjectSettingsScreenEventLocalizationChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    _configService.updateWith(
      localization: state.config.localization == ProjectLocalization.intl
          ? ProjectLocalization.flutterGen
          : ProjectLocalization.intl,
    );
    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onThemingChange(
    ProjectSettingsScreenEventThemingChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    _configService.updateWith(
      theming: state.config.theming == ProjectTheming.manual
          ? ProjectTheming.themeTailor
          : ProjectTheming.manual,
    );
    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onFirebaseChange(
    ProjectSettingsScreenEventFirebaseChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    _configService.updateWith(
      firebaseAuth: !state.config.firebaseAuth,
    );
    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onScreenUtilChange(
    ProjectSettingsScreenEventScreenUtilChange _,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    _configService.updateWith(
      screenUtil:
          !state.config.platformsList.webOnly && !state.config.screenUtil,
    );
    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onSentryChange(
    ProjectSettingsScreenEventSentryChange _,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    _configService.updateWith(
      sentry: !state.config.sentry,
    );
    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onArchChange(
    ProjectSettingsScreenEventArchChange event,
    Emitter<ProjectSettingsScreenState> emit,
  ) {
    final supportedStateManagers = event.arch.getSupportedStateManagers();
    final stateManager =
        supportedStateManagers.contains(state.config.stateManager)
            ? state.config.stateManager
            : supportedStateManagers.first;

    if (stateManager != state.config.stateManager) {
      add(
        ProjectSettingsScreenEventStateManagerChange(
          stateManager: stateManager,
        ),
      );
    }
    _configService.updateWith(
      arch: event.arch,
      stateManager: stateManager,
    );

    emit(
      state.copyWith(
        config: _config,
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

  bool screensMatchArch(ArchType arch) {
    final supportedStateManagers = arch.getSupportedStateManagers();

    return supportedStateManagers.contains(state.config.stateManager);
  }
}
