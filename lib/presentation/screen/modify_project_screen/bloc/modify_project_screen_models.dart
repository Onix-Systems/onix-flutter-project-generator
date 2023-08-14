import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';

part 'modify_project_screen_models.freezed.dart';

@freezed
class ModifyProjectScreenEvent with _$ModifyProjectScreenEvent {
  const factory ModifyProjectScreenEvent.init({
    required Config config,
  }) = ModifyProjectScreenEventInit;

  const factory ModifyProjectScreenEvent.changeTab({
    required int index,
  }) = ModifyProjectScreenEventChangeTab;

  const factory ModifyProjectScreenEvent.onScreensChange({
    required Set<Screen> screens,
  }) = ModifyProjectScreenEventOnScreensChange;

  const factory ModifyProjectScreenEvent.onDataComponentsChange({
    required Set<DataComponent> dataComponents,
    required Set<Source> sources,
  }) = ModifyProjectScreenEventOnDataComponentsChange;
}

@freezed
class ModifyProjectScreenSR with _$ModifyProjectScreenSR {
  const factory ModifyProjectScreenSR.loadFinished() = _LoadFinished;
}

@freezed
class ModifyProjectScreenState with _$ModifyProjectScreenState {
  const factory ModifyProjectScreenState.data({
    required Config config,
    @Default(0) int currentTab,
  }) = ModifyProjectScreenStateData;
}
