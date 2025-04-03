import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/service/config_service/config_service.dart';
import 'package:onix_flutter_bricks/domain/usecase/styles/get_figma_styles_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/figma_styles_screen/bloc/figma_styles_screen_bloc_imports.dart';

class FigmaStylesScreenBloc extends BaseBloc<FigmaStylesScreenEvent,
    FigmaStylesScreenState, FigmaStylesScreenSR> {
  final ConfigService _configService;
  final GetFigmaStylesUseCase _getFigmaStylesUseCase;

  Config get _config => _configService.config;

  FigmaStylesScreenBloc({
    required GetFigmaStylesUseCase getFigmaStylesUseCase,
    required ConfigService configService,
  })  : _configService = configService,
        _getFigmaStylesUseCase = getFigmaStylesUseCase,
        super(const FigmaStylesScreenStateData(config: Config())) {
    on<FigmaStylesScreenEventInit>(_onInit);
    on<FigmaStylesScreenEventOnGetStyles>(_onGetStyles);
    on<FigmaStylesScreenEventOnClear>(_onClear);
  }

  void _onInit(
    FigmaStylesScreenEventInit event,
    Emitter<FigmaStylesScreenState> emit,
  ) {
    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  Future<void> _onGetStyles(
    FigmaStylesScreenEventOnGetStyles event,
    Emitter<FigmaStylesScreenState> emit,
  ) async {
    if (event.figmaId.isEmpty) {
      addSr(
        FigmaStylesScreenSR.error(error: S.current.figmaGetStylesEmptyFileId),
      );
      return;
    }

    if (event.token.isEmpty) {
      addSr(
        FigmaStylesScreenSR.error(error: S.current.figmaGetStylesEmptyToken),
      );
      return;
    }

    showProgress();

    try {
      final styles = await _getFigmaStylesUseCase(
        figmaId: event.figmaId,
        token: event.token,
      );

      if (styles.isEmpty) {
        addSr(FigmaStylesScreenSR.error(error: S.current.figmaGetStylesEmpty));
        return;
      }

      if (styles.length == 1 && styles.first.name == 'Error') {
        addSr(FigmaStylesScreenSR.error(error: S.current.figmaGetStylesError));
        return;
      }

      _configService.updateWith(
        styles: styles,
      );

      emit(
        state.copyWith(
          config: _config,
        ),
      );
    } catch (e) {
      addSr(FigmaStylesScreenSR.error(error: e.toString()));
    } finally {
      await hideProgress();
    }
  }

  void _onClear(
    FigmaStylesScreenEventOnClear event,
    Emitter<FigmaStylesScreenState> emit,
  ) {
    _configService.updateWith(
      styles: [],
    );

    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }
}
