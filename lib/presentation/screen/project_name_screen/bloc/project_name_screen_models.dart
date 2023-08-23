import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

part 'project_name_screen_models.freezed.dart';

@freezed
class ProjectNameScreenEvent with _$ProjectNameScreenEvent {
  const factory ProjectNameScreenEvent.init({
    required Config config,
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
    required Config config,
    @Default(false) bool projectExists,
  }) = ProjectNameScreenStateData;
}
