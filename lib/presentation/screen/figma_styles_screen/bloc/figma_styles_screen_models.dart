import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

part 'figma_styles_screen_models.freezed.dart';

@freezed
class FigmaStylesScreenEvent with _$FigmaStylesScreenEvent {
  const factory FigmaStylesScreenEvent.init({
    required Config config,
  }) = FigmaStylesScreenEventInit;

  const factory FigmaStylesScreenEvent.onGetStyles({
    required String figmaId,
    required String token,
  }) = FigmaStylesScreenEventOnGetStyles;

  const factory FigmaStylesScreenEvent.onClear() =
      FigmaStylesScreenEventOnClear;
}

@freezed
class FigmaStylesScreenSR with _$FigmaStylesScreenSR {
  const factory FigmaStylesScreenSR.loadFinished() = _LoadFinished;

  const factory FigmaStylesScreenSR.error({
    required String error,
  }) = _Error;
}

@freezed
class FigmaStylesScreenState with _$FigmaStylesScreenState {
  const factory FigmaStylesScreenState.data({
    required Config config,
  }) = FigmaStylesScreenStateData;
}
