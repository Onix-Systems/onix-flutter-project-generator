import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/domain/usecase/figma/get_figma_styles_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/figma_styles_dialog/bloc/figma_styles_dialog_bloc_imports.dart';

class FigmaStylesDialogBloc extends BaseBloc<FigmaStylesDialogEvent,
    FigmaStylesDialogState, FigmaStylesDialogSR> {
  final GetFigmaStylesUseCase _getFigmaStylesUseCase;

  FigmaStylesDialogBloc(this._getFigmaStylesUseCase)
      : super(const FigmaStylesDialogState.data()) {
    on<FigmaStylesEventInit>(_onInit);
  }

  FutureOr<void> _onInit(
    FigmaStylesEventInit event,
    Emitter<FigmaStylesDialogState> emit,
  ) async {
    emit(
      const FigmaStylesDialogState.data(
        isLoading: true,
      ),
    );
    final styles = await _getFigmaStylesUseCase(
      figmaId: event.figmaId,
      token: event.token,
    );
    final colorStyles = styles.whereType<AppColorStyle>().toList();
    final textStyles = styles.whereType<AppTextStyle>().toList();

    if (colorStyles.isEmpty &&
        (textStyles.isEmpty || textStyles.first.fontFamily == 'Error')) {
      emit(const FigmaStylesDialogState.error());
      return;
    }
    emit(
      FigmaStylesDialogState.data(
        isLoading: false,
        colorStyles: colorStyles,
        textStyles: textStyles,
      ),
    );
  }
}
