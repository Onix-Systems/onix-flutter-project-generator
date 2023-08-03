import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/platforms_list/platforms_list.dart';

part 'platforms_screen_models.freezed.dart';

@freezed
class PlatformsScreenEvent with _$PlatformsScreenEvent {
  const factory PlatformsScreenEvent.init() = PlatformsScreenEventInit;

  const factory PlatformsScreenEvent.onPlatformsChange({
    required PlatformsList platformsList,
  }) = PlatformsScreenEventOnPlatformsChange;
}

@freezed
class PlatformsScreenSR with _$PlatformsScreenSR {
  const factory PlatformsScreenSR.loadFinished() = _LoadFinished;
}

@freezed
class PlatformsScreenState with _$PlatformsScreenState {
  const factory PlatformsScreenState.data({
    @Default(PlatformsList()) PlatformsList platformsList,
  }) = PlatformsScreenStateData;
}
