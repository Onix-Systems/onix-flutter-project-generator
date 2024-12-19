import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_screen_models.freezed.dart';

@freezed
class SplashScreenEvent with _$SplashScreenEvent {
  const factory SplashScreenEvent.init() = SplashScreenEventInit;

  const factory SplashScreenEvent.onAnimationFinished() =
      SplashScreenEventOnAnimationFinished;
}

@freezed
class SplashScreenSR with _$SplashScreenSR {
  const factory SplashScreenSR.onNeedUpdate({
    required String latestReleaseUrl,
  }) = _onNeedUpdate;

  const factory SplashScreenSR.onContinue() = _onContinue;
}

@freezed
class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState.data({
    @Default('') String remoteVersion,
    @Default('') String localVersion,
    @Default(false) bool logoVisible,
  }) = Data;
}
