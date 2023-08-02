import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_name_screen_models.freezed.dart';

@freezed
class ProjectNameScreenEvent with _$ProjectNameScreenEvent {
  const factory ProjectNameScreenEvent.init({
    required String projectPath,
  }) = ProjectNameScreenEventInit;

  const factory ProjectNameScreenEvent.projectNameChanged({
    required String projectName,
  }) = ProjectNameScreenEventProjectNameChanged;

  const factory ProjectNameScreenEvent.organizationChanged({
    required String organization,
  }) = ProjectNameScreenEventOrganizationChanged;
}

@freezed
class ProjectNameScreenSR with _$ProjectNameScreenSR {
  const factory ProjectNameScreenSR.checkNames() =
      ProjectNameScreenSRCheckNames;
}

@freezed
class ProjectNameScreenState with _$ProjectNameScreenState {
  const factory ProjectNameScreenState.data({
    @Default('') String projectName,
    @Default('') String organization,
    @Default('') String projectPath,
    @Default(false) bool projectExists,
  }) = _ProjectNameScreenStateData;
}
