import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/service/config_service/config_service.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/get_branches_process_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/project_name_validator.dart';
import 'package:recase/recase.dart';

class ProjectNameScreenBloc extends BaseBloc<ProjectNameScreenEvent,
    ProjectNameScreenState, ProjectNameScreenSR> {
  final GetBranchesProcessUseCase _getBranchesProcessUseCase;
  final ConfigService _configService;

  ProjectNameScreenBloc({
    required GetBranchesProcessUseCase getBranchesProcessUseCase,
    required ConfigService configService,
  })  : _configService = configService,
        _getBranchesProcessUseCase = getBranchesProcessUseCase,
        super(const ProjectNameScreenState.data(config: Config())) {
    on<ProjectNameScreenEventInit>(_onInit);
    on<ProjectNameScreenEventProjectNameChanged>(_onProjectNameChanged);
    on<ProjectNameScreenEventOrganizationChanged>(_onOrganizationChanged);
    on<ProjectNameScreenEventBranchChanged>(_onBranchChanged);
  }

  Future<void> _onInit(
    ProjectNameScreenEventInit event,
    Emitter<ProjectNameScreenState> emit,
  ) async {
    final branches = await _getBranchesProcessUseCase();

    final config = _configService.config;

    emit(
      state.copyWith(
        branches: branches,
        config: config,
        isValidProjectName: _isValidProjectName(config.projectName),
        isValidOrganizationName: _isValidOrganizationName(config.organization),
      ),
    );
    addSr(const ProjectNameScreenSR.init());
  }

  Future<void> _onProjectNameChanged(
    ProjectNameScreenEventProjectNameChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) async {
    _configService.updateWith(
      projectName: event.projectName,
    );

    emit(
      state.copyWith(
        isValidProjectName: _isValidProjectName(event.projectName),
        config: _configService.config,
      ),
    );
  }

  void _onOrganizationChanged(
    ProjectNameScreenEventOrganizationChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) {
    _configService.updateWith(
      organization: event.organization,
    );

    emit(
      state.copyWith(
        isValidOrganizationName: _isValidOrganizationName(event.organization),
        config: _configService.config,
      ),
    );
  }

  void _onBranchChanged(
    ProjectNameScreenEventBranchChanged event,
    Emitter<ProjectNameScreenState> emit,
  ) {
    _configService.updateWith(
      branchConfig: state.config.branchConfig.copyWith(
        branch: event.newBranch,
      ),
    );

    emit(
      state.copyWith(
        branches: state.branches.toList(),
        config: _configService.config,
      ),
    );
  }

  bool _isValidProjectName(String projectName) {
    final projectExists =
        Directory('${state.config.projectPath}/${projectName.snakeCase}')
            .existsSync();
    final isValidName = ProjectNameValidator.isValidName(projectName);
    return projectName.isNotEmpty && !projectExists && isValidName;
  }

  bool _isValidOrganizationName(String organization) =>
      AppConsts.organizationRegExp.hasMatch(organization);
}
