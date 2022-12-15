import 'package:bloc/bloc.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:process_run/cmd_run.dart';

import 'app_models.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  String projectPath;

  AppBloc({required this.projectPath}) : super(Data(projectPath: projectPath)) {
    on<Init>((event, emit) => _init(event, emit));
    on<TabChange>((event, emit) => _tabChange(event, emit));
    on<ProjectNameChange>((event, emit) => _projectNameChange(event, emit));
    on<ProjectPathChange>((event, emit) => _projectPathChange(event, emit));
  }

  void _init(Init event, Emitter<AppState> emit) {}

  void _tabChange(TabChange event, Emitter<AppState> emit) {
    emit(state.copyWith(tab: event.tabIndex));
  }

  void _projectNameChange(ProjectNameChange event, Emitter<AppState> emit) {
    emit(state.copyWith(projectName: event.projectName));
  }

  void _projectPathChange(ProjectPathChange event, Emitter<AppState> emit) {
    emit(state.copyWith(projectPath: event.projectPath));
  }
}
