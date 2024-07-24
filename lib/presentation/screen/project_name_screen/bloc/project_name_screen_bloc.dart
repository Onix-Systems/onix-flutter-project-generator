import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/get_branches_process_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/extension/org_case.dart';
import 'package:onix_flutter_bricks/util/project_name_validator.dart';
import 'package:recase/recase.dart';

class ProjectNameScreenBloc extends BaseBloc<ProjectNameScreenEvent,
    ProjectNameScreenState, ProjectNameScreenSR> {
  final GetBranchesProcessUseCase _getBranchesProcessUseCase;

  ProjectNameScreenBloc(
    this._getBranchesProcessUseCase,
  ) : super(const ProjectNameScreenState.data(config: Config())) {
    on<ProjectNameScreenEventInit>(_onInit);
    on<ProjectNameScreenEventProjectNameChanged>(_onProjectNameChanged);
    on<ProjectNameScreenEventOrganizationChanged>(_onOrganizationChanged);
    on<ProjectNameScreenEventBranchChanged>(_onBranchChanged);
  }

  FutureOr<void> _onInit(
    ProjectNameScreenEventInit event,
    Emitter<ProjectNameScreenState> emit,
  ) async {
    final branches = await _getBranchesProcessUseCase();
    emit(ProjectNameScreenState.data(config: event.config, branches: branches));
  }

  FutureOr<void> _onProjectNameChanged(
    ProjectNameScreenEventProjectNameChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) async {
    if (event.projectName.isEmpty) {
      emit(
        state.copyWith(
          config: state.config.copyWith(projectName: ''),
          isValidProjectName: false,
        ),
      );
      return;
    }

    final projectName = event.projectName.snakeCase;
    final projectExists =
        await Directory('${state.config.projectPath}/$projectName').exists();
    final isValidName = ProjectNameValidator.isValidName(projectName);

    emit(
      state.copyWith(
        config: state.config.copyWith(projectName: projectName),
        isValidProjectName: !projectExists && isValidName,
      ),
    );
  }

  FutureOr<void> _onOrganizationChanged(
    ProjectNameScreenEventOrganizationChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config:
            state.config.copyWith(organization: event.organization.orgCase()),
      ),
    );
  }

  FutureOr<void> _onBranchChanged(
    ProjectNameScreenEventBranchChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) {
    emit(
      state.copyWith(config: state.config.copyWith(branch: event.newBranch)),
    );
  }
}
