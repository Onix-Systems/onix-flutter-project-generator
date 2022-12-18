import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/utils/platforms_list.dart';
import 'package:recase/recase.dart';

import 'app_models.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  String projectPath;

  AppBloc({required this.projectPath})
      : super(
            Data(projectPath: projectPath, platforms: const PlatformsList())) {
    on<Init>((event, emit) => _init(event, emit));
    on<TabChange>((event, emit) => _tabChange(event, emit));
    on<ProjectNameChange>((event, emit) => _projectNameChange(event, emit));
    on<ProjectCheck>((event, emit) => _projectCheck(event, emit));
    on<ProjectPathChange>((event, emit) => _projectPathChange(event, emit));
    on<OrganizationChange>((event, emit) => _organizationChange(event, emit));
    on<FlavorizeChange>((event, emit) => _flavorizeChange(event, emit));
    on<FlavorsChange>((event, emit) => _flavorsChange(event, emit));
    on<RouterChange>((event, emit) => _routerChange(event, emit));
    on<LocalizationChange>((event, emit) => _localizationChange(event, emit));
    on<GenerateSigningKeyChange>(
        (event, emit) => _generateSigningKeyChange(event, emit));
    on<UseSonarChange>((event, emit) => _useSonarChange(event, emit));
    on<IntegrateDevicePreviewChange>(
        (event, emit) => _integrateDevicePreviewChange(event, emit));
    on<SigningVarsChange>((event, emit) => _signingVarsChange(event, emit));
    on<PlatformsChange>((event, emit) => _platformsChange(event, emit));
  }

  FutureOr<void> _init(Init event, Emitter<AppState> emit) {}

  FutureOr<void> _tabChange(TabChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(tab: event.tabIndex));
  }

  FutureOr<void> _projectPathChange(
      ProjectPathChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(projectPath: event.projectPath));
  }

  FutureOr<void> _projectNameChange(
      ProjectNameChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(projectName: event.projectName.snakeCase));
    add(const ProjectCheck());
  }

  FutureOr<void> _projectCheck(
      ProjectCheck event, Emitter<AppState> emit) async {
    var projectExists =
        await Directory('${state.projectPath}/${state.projectName}').exists();
    emit(state.copyWith(projectExists: projectExists));
  }

  FutureOr<void> _organizationChange(
      OrganizationChange event, Emitter<AppState> emit) async {
    var org = event.organization.hostCase();
    logger.d('org: $org');
    emit(state.copyWith(organization: event.organization.hostCase()));
  }

  FutureOr<void> _flavorizeChange(_, Emitter<AppState> emit) async {
    if (state.flavorize) {
      emit(state.copyWith(flavorize: false));
    } else {
      emit(state.copyWith(flavorize: true));
    }
  }

  FutureOr<void> _flavorsChange(
      FlavorsChange event, Emitter<AppState> emit) async {
    var flavors = event.flavors.toLowerCase().trim().split(' ').toSet();
    flavors
      ..remove('dev')
      ..remove('prod');
    emit(state.copyWith(flavors: flavors));
  }

  FutureOr<void> _routerChange(_, Emitter<AppState> emit) async {
    if (state.router == ProjectRouter.goRouter) {
      emit(state.copyWith(router: ProjectRouter.autoRouter));
    } else {
      emit(state.copyWith(router: ProjectRouter.goRouter));
    }
  }

  FutureOr<void> _localizationChange(_, Emitter<AppState> emit) async {
    if (state.localization == ProjectLocalization.intl) {
      emit(state.copyWith(localization: ProjectLocalization.flutter_gen));
    } else {
      emit(state.copyWith(localization: ProjectLocalization.intl));
    }
  }

  FutureOr<void> _generateSigningKeyChange(_, Emitter<AppState> emit) async {
    if (state.generateSigningKey) {
      emit(state.copyWith(generateSigningKey: false));
    } else {
      emit(state.copyWith(generateSigningKey: true));
    }
  }

  FutureOr<void> _useSonarChange(_, Emitter<AppState> emit) async {
    if (state.useSonar) {
      emit(state.copyWith(useSonar: false));
    } else {
      emit(state.copyWith(useSonar: true));
    }
  }

  FutureOr<void> _integrateDevicePreviewChange(
      _, Emitter<AppState> emit) async {
    if (state.integrateDevicePreview) {
      emit(state.copyWith(integrateDevicePreview: false));
    } else {
      emit(state.copyWith(integrateDevicePreview: true));
    }
  }

  FutureOr<void> _signingVarsChange(
      SigningVarsChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(signingVars: event.signingVars));
  }

  FutureOr<void> _platformsChange(
      PlatformsChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(platforms: event.platforms));
  }
}

extension MyCase on String {
  String hostCase() {
    Iterable<String> strings = split('-');

    strings = strings.map((e) => e.dotCase);

    return strings.join('-');
  }
}
