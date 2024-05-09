import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

part 'modify_project_screen_models.freezed.dart';

@freezed
class ModifyProjectScreenEvent with _$ModifyProjectScreenEvent {
  const factory ModifyProjectScreenEvent.init({
    required Config config,
  }) = ModifyProjectScreenEventInit;

  const factory ModifyProjectScreenEvent.getStyles({
    required List<AppStyle> styles,
  }) = ModifyProjectScreenEventOnGetStyles;

  const factory ModifyProjectScreenEvent.changeTab({
    required int index,
  }) = ModifyProjectScreenEventChangeTab;

  const factory ModifyProjectScreenEvent.onGenerate() =
      ModifyProjectScreenEventOnGenerate;

  const factory ModifyProjectScreenEvent.onParse({
    required String path,
  }) = ModifyProjectScreenEventOnParse;
}

@freezed
class ModifyProjectScreenSR with _$ModifyProjectScreenSR {
  const factory ModifyProjectScreenSR.loadFinished({
    required Config config,
  }) = _LoadFinished;

  const factory ModifyProjectScreenSR.onGenerate({
    required Config config,
  }) = _OnGenerate;

  const factory ModifyProjectScreenSR.onError({
    required String message,
  }) = _OnError;

  const factory ModifyProjectScreenSR.onRefresh() =
      ModifyProjectScreenSROnRefresh;
}

@freezed
class ModifyProjectScreenState with _$ModifyProjectScreenState {
  const factory ModifyProjectScreenState.data({
    required Config config,
    @Default(0) int currentTab,
    @Default(false) bool configured,
  }) = ModifyProjectScreenStateData;
}
