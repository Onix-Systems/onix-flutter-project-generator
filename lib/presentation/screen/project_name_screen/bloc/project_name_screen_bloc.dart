import 'dart:async';
import 'dart:io';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/extension/org_case.dart';
import 'package:recase/recase.dart';

class ProjectNameScreenBloc extends BaseBloc<ProjectNameScreenEvent,
    ProjectNameScreenState, ProjectNameScreenSR> {
  ProjectNameScreenBloc()
      : super(const ProjectNameScreenState.data(config: Config())) {
    on<ProjectNameScreenEventInit>(_onInit);
    on<ProjectNameScreenEventProjectNameChanged>(_onProjectNameChanged);
    on<ProjectNameScreenEventOrganizationChanged>(_onOrganizationChanged);
  }

  FutureOr<void> _onInit(
    ProjectNameScreenEventInit event,
    Emitter<ProjectNameScreenState> emit,
  ) {
    emit(ProjectNameScreenState.data(
      config: event.config,
    ));
  }

  FutureOr<void> _onProjectNameChanged(
    ProjectNameScreenEventProjectNameChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) async {
    if (event.projectName.isEmpty) {
      emit(state.copyWith(
        config: state.config.copyWith(projectName: ''),
        projectExists: false,
      ));
      return;
    }

    final projectName = event.projectName.snakeCase;

    var projectExists =
        await Directory('${state.config.projectPath}/$projectName').exists();

    emit(state.copyWith(
      config: state.config.copyWith(projectName: projectName),
      projectExists: projectExists,
    ));
  }

  FutureOr<void> _onOrganizationChanged(
    ProjectNameScreenEventOrganizationChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) {
    emit(state.copyWith(
      config: state.config.copyWith(organization: event.organization.orgCase()),
    ));
  }
}
