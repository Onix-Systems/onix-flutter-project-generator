import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_models.freezed.dart';

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.init() = SplashEventInit;
}

@freezed
class SplashSR with _$SplashSR {
  const factory SplashSR.loadFinished() = _LoadFinished;
}

class SplashScreenState {}
