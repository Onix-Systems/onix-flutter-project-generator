import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/bloc/screens_screen_bloc_imports.dart';

class ScreensScreenBloc
    extends BaseBloc<ScreensScreenEvent, ScreensScreenState, ScreensScreenSR> {
  ScreensScreenBloc() : super(const ScreensScreenStateData(config: Config())) {
    on<ScreensScreenEventInit>(_onInit);
    on<ScreensScreenEventOnScreenAdd>(_onScreenAdd);
    on<ScreensScreenEventOnScreenDelete>(_onScreenDelete);
    on<ScreensScreenEventOnScreenModify>(_onScreenModify);
    on<ScreensScreenEventOnScreenChangeInitial>(_onScreenChangeInitial);
  }

  FutureOr<void> _onInit(
    ScreensScreenEventInit event,
    Emitter<ScreensScreenState> emit,
  ) {
    emit(state.copyWith(
      config: event.config.copyWith(
        screens: screenRepository.screens,
      ),
    ));
  }

  FutureOr<void> _onScreenAdd(
    ScreensScreenEventOnScreenAdd event,
    Emitter<ScreensScreenState> emit,
  ) {
    if (screenRepository.exists(screenName: event.screen.name)) {
      addSr(const ScreensScreenSR.existsError());
    } else {
      screenRepository.addScreen(screen: event.screen);

      emit(state.copyWith(
        config: state.config.copyWith(screens: screenRepository.screens),
      ));
    }
  }

  FutureOr<void> _onScreenDelete(
    ScreensScreenEventOnScreenDelete event,
    Emitter<ScreensScreenState> emit,
  ) {
    screenRepository.removeScreen(screenName: event.screenName);
    emit(state.copyWith(
      config: state.config.copyWith(screens: screenRepository.screens),
    ));
  }

  FutureOr<void> _onScreenModify(
    ScreensScreenEventOnScreenModify event,
    Emitter<ScreensScreenState> emit,
  ) {
    screenRepository.modifyScreen(event.screen, event.oldName);
    emit(state.copyWith(
        config: state.config.copyWith(
      screens: screenRepository.screens,
    )));
  }

  FutureOr<void> _onScreenChangeInitial(
    ScreensScreenEventOnScreenChangeInitial event,
    Emitter<ScreensScreenState> emit,
  ) {
    final oldInitial = state.config.screens.firstWhere((e) => e.initial);
    oldInitial.initial = false;
    screenRepository.modifyScreen(oldInitial, oldInitial.name);
    event.screen.initial = true;
    screenRepository.modifyScreen(event.screen, event.screen.name);

    emit(state.copyWith(
        stateUpdate: state.stateUpdate + 1,
        config: state.config.copyWith(
          screens: screenRepository.screens,
        )));
  }
}
