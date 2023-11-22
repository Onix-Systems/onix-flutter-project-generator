import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';

part 'screens_screen_models.freezed.dart';

@freezed
class ScreensScreenEvent with _$ScreensScreenEvent {
  const factory ScreensScreenEvent.init({
    required Config config,
  }) = ScreensScreenEventInit;

  const factory ScreensScreenEvent.onScreenAdd({
    required Screen screen,
  }) = ScreensScreenEventOnScreenAdd;

  const factory ScreensScreenEvent.onScreenDelete({
    required String screenName,
  }) = ScreensScreenEventOnScreenDelete;

  const factory ScreensScreenEvent.onScreenModify({
    required Screen screen,
    required String oldName,
  }) = ScreensScreenEventOnScreenModify;

  const factory ScreensScreenEvent.onGetStyles({
    required List<AppStyle> styles,
  }) = ScreensScreenEventOnGetStyles;
}

@freezed
class ScreensScreenSR with _$ScreensScreenSR {
  const factory ScreensScreenSR.existsError() = _ExistsError;
}

@freezed
class ScreensScreenState with _$ScreensScreenState {
  const factory ScreensScreenState.data({
    required Config config,
    @Default(0) int stateUpdate,
  }) = ScreensScreenStateData;
}
