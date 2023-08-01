import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_screen_bloc_models.freezed.dart';

@freezed
class SplashScreenEvent with _$SplashScreenEvent {
  const factory SplashScreenEvent.init() = Init;
}

@freezed
class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState.data({
    String? remoteVersion,
    String? localVersion,
    @Default(false) bool loadFinished,
    @Default(false) bool logoVisible,
  }) = Data;
}
