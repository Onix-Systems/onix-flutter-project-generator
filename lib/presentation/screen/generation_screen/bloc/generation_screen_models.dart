import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/config/output_line.dart';

part 'generation_screen_models.freezed.dart';

@freezed
class GenerationScreenEvent with _$GenerationScreenEvent {
  const factory GenerationScreenEvent.init({
    required Config config,
    required bool isModify,
  }) = GenerationScreenEventInit;

  const factory GenerationScreenEvent.generateProject() =
      GenerationScreenEventGenerateProject;

  const factory GenerationScreenEvent.open() = GenerationScreenEventOpenProject;
}

@freezed
class GenerationScreenSR with _$GenerationScreenSR {
  const factory GenerationScreenSR.stub() = _StubSR;
}

@freezed
class GenerationScreenState with _$GenerationScreenState {
  const factory GenerationScreenState.data({
    required Config config,
    @Default(false) bool isModify,
    @Default(GeneratingState.init) GeneratingState generatingState,
    Stream<List<OutputLine>>? outputStream,
  }) = GenerationScreenStateData;
}

enum GeneratingState { init, generating, waiting }
