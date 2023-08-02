import 'dart:async';
import 'dart:io';
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
  }

  FutureOr<void> _onInit(
    ProjectNameScreenEventInit event,
    Emitter<ProjectNameScreenState> emit,
  ) {
    emit(state.copyWith(
      projectPath: event.projectPath,
    ));
  }

  FutureOr<void> _onProjectNameChanged(
    ProjectNameScreenEventProjectNameChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) async {
    if (event.projectName.isEmpty) {
      emit(state.copyWith(
        projectName: '',
        projectExists: false,
      ));
      return;
    }

    final projectName = event.projectName.snakeCase;

    var projectExists =
        await Directory('${state.projectPath}/$projectName').exists();

    emit(state.copyWith(
      projectName: projectName,
      projectExists: projectExists,
    ));
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
