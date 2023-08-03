import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';

part 'screens_screen_models.freezed.dart';

@freezed
class ScreensScreenEvent with _$ScreensScreenEvent {
  const factory ScreensScreenEvent.init() = ScreensScreenEventInit;

  const factory ScreensScreenEvent.onScreenAdd({
    required Screen screen,
  }) = ScreensScreenEventOnScreenAdd;

  const factory ScreensScreenEvent.onScreenDelete({
    required Screen screen,
  }) = ScreensScreenEventOnScreenDelete;

  const factory ScreensScreenEvent.onScreenModify() =
      ScreensScreenEventOnScreenModify;
}

@freezed
class ScreensScreenSR with _$ScreensScreenSR {
  const factory ScreensScreenSR.existsError() = _ExistsError;
}

@freezed
class ScreensScreenState with _$ScreensScreenState {
  const factory ScreensScreenState.data({
    @Default({}) Set<Screen> screens,
    @Default(0) int stateUpdate,
  }) = ScreensScreenStateData;
}
