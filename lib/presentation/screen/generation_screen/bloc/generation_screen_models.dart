import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

part 'generation_screen_models.freezed.dart';

@freezed
class GenerationScreenEvent with _$GenerationScreenEvent {
  const factory GenerationScreenEvent.init({
    required Config config,
  }) = GenerationScreenEventInit;

  const factory GenerationScreenEvent.generateProject() =
      GenerationScreenEventGenerateProject;

  const factory GenerationScreenEvent.open() = GenerationScreenEventOpenProject;
}

@freezed
class GenerationScreenSR with _$GenerationScreenSR {
  const factory GenerationScreenSR.loadFinished() = _LoadFinished;
}

@freezed
class GenerationScreenState with _$GenerationScreenState {
  const factory GenerationScreenState.data({
    required Config config,
    @Default(GeneratingState.init) GeneratingState generatingState,
  }) = GenerationScreenStateData;
}

enum GeneratingState { init, generating, waiting }
