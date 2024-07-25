import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/get_branches_process_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc_imports.dart';
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

  Future<void> _onInit(
    ProjectNameScreenEventInit event,
    Emitter<ProjectNameScreenState> emit,
  ) async {
    emit(
      ProjectNameScreenState.data(
        config: event.config,
        isValidProjectName: await _isValidProjectName(event.config.projectName),
        isValidOrganizationName:
            _isValidOrganizationName(event.config.organization),
      ),
    );
    final branches = await _getBranchesProcessUseCase();
    emit(state.copyWith(branches: branches));
  }

  Future<void> _onProjectNameChanged(
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

    emit(
      state.copyWith(
        config: state.config.copyWith(projectName: event.projectName.snakeCase),
        isValidProjectName: await _isValidProjectName(event.projectName),
      ),
    );
  }

  void _onOrganizationChanged(
    ProjectNameScreenEventOrganizationChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) {
    if (event.organization.isEmpty) {
      emit(
        state.copyWith(
          config: state.config.copyWith(organization: ''),
          isValidOrganizationName: false,
        ),
      );
    }

    emit(
      state.copyWith(
        config: state.config.copyWith(organization: event.organization),
        isValidOrganizationName: _isValidOrganizationName(event.organization),
      ),
    );
  }

  void _onBranchChanged(
    ProjectNameScreenEventBranchChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: state.config.copyWith(branch: event.newBranch),
      ),
    );
  }

  Future<bool> _isValidProjectName(String projectName) async {
    final projectExists =
        await Directory('${state.config.projectPath}/${projectName.snakeCase}')
            .exists();
    final isValidName = ProjectNameValidator.isValidName(projectName);
    return projectName.isNotEmpty && !projectExists && isValidName;
  }

  bool _isValidOrganizationName(String organization) =>
      AppConsts.organizationRegExp.hasMatch(organization);
}
