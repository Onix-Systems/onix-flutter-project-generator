import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';

part 'figma_styles_dialog_models.freezed.dart';

@freezed
class FigmaStylesDialogEvent with _$FigmaStylesDialogEvent {
  const factory FigmaStylesDialogEvent.getStyles({
    required String figmaId,
    required String token,
  }) = FigmaStylesEventInit;
}

@freezed
class FigmaStylesDialogSR with _$FigmaStylesDialogSR {
  const factory FigmaStylesDialogSR.stub() = FigmaStylesStubSR;
}

@freezed
class FigmaStylesDialogState with _$FigmaStylesDialogState {
  const factory FigmaStylesDialogState.error() = FigmaStylesDialogStateError;

  const factory FigmaStylesDialogState.data({
    @Default([]) List<AppColorStyle> colorStyles,
    @Default([]) List<AppTextStyle> textStyles,
    @Default(false) bool isLoading,
  }) = FigmaStylesDialogStateData;
}
