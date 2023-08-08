import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_screen_models.freezed.dart';

@freezed
class SummaryScreenEvent with _$SummaryScreenEvent {
  const factory SummaryScreenEvent.init() = SummaryScreenEventInit;
}

@freezed
class SummaryScreenSR with _$SummaryScreenSR {
  const factory SummaryScreenSR.loadFinished() = _LoadFinished;
}

class SummaryScreenState {}
