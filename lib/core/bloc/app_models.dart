import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_models.freezed.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.init({
    required String projectPath,
  }) = Init;

  const factory AppEvent.onTabChange({
    required int tabIndex,
  }) = TabChange;

  const factory AppEvent.onProjectNameChange({
    required String projectName,
  }) = ProjectNameChange;

  const factory AppEvent.onProjectPathChange({
    required String projectPath,
  }) = ProjectPathChange;
}

@freezed
class AppState with _$AppState {
  const factory AppState.data({
    required String projectPath,
    @Default('new_project') String projectName,
    @Default(0) int tab,
  }) = Data;
}
