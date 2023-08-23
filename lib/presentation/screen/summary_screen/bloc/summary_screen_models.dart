import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

part 'summary_screen_models.freezed.dart';

@freezed
class SummaryScreenEvent with _$SummaryScreenEvent {
  const factory SummaryScreenEvent.init({
    required Config config,
  }) = SummaryScreenEventInit;
}

@freezed
class SummaryScreenSR with _$SummaryScreenSR {
  const factory SummaryScreenSR.loadFinished() = _LoadFinished;
}

@freezed
class SummaryScreenState with _$SummaryScreenState {
  const factory SummaryScreenState.data({
    required Config config,
  }) = SummaryScreenStateData;
}
