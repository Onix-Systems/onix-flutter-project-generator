import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

part 'procedure_selection_screen_models.freezed.dart';

@freezed
class ProcedureSelectionScreenEvent with _$ProcedureSelectionScreenEvent {
  const factory ProcedureSelectionScreenEvent.init({
    required Config config,
  }) = ProcedureSelectionScreenEventInit;

  const factory ProcedureSelectionScreenEvent.onProjectOpen({
    required String projectURI,
  }) = ProcedureSelectionScreenEventOnProjectOpen;
}

@freezed
class ProcedureSelectionScreenSR with _$ProcedureSelectionScreenSR {
  const factory ProcedureSelectionScreenSR.loadFinished() = _LoadFinished;

  const factory ProcedureSelectionScreenSR.emptyConfig() = _EmptyConfig;
}

@freezed
class ProcedureSelectionScreenState with _$ProcedureSelectionScreenState {
  const factory ProcedureSelectionScreenState.data({
    required Config config,
  }) = ProcedureSelectionScreenStateData;
}
