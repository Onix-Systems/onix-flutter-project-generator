import 'dart:async';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/extension/org_case.dart';
import 'package:recase/recase.dart';

class ProjectNameScreenBloc extends BaseBloc<ProjectNameScreenEvent,
    ProjectNameScreenState, ProjectNameScreenSR> {
  ProjectNameScreenBloc() : super(const ProjectNameScreenState.data()) {
    on<ProjectNameScreenEventInit>(_onInit);
    on<ProjectNameScreenEventProjectNameChanged>(_onProjectNameChanged);
    on<ProjectNameScreenEventOrganizationChanged>(_onOrganizationChanged);
    add(const ProjectNameScreenEvent.init());
  }

  FutureOr<void> _onInit(
    ProjectNameScreenEventInit event,
    Emitter<ProjectNameScreenState> emit,
  ) {}

  FutureOr<void> _onProjectNameChanged(
    ProjectNameScreenEventProjectNameChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) {
    emit(state.copyWith(
      projectName: event.projectName.snakeCase,
    ));
    logger.f('event.projectName: ${state.projectName}');
  }

  FutureOr<void> _onOrganizationChanged(
    ProjectNameScreenEventOrganizationChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) {
    emit(state.copyWith(
      organization: event.organization.orgCase(),
    ));
    logger.f('event.organization: ${state.organization}');
  }
}
