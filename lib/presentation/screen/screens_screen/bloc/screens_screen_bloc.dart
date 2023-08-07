import 'dart:async';

import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';

import 'package:onix_flutter_bricks/presentation/screen/screens_screen/bloc/screens_screen_bloc_imports.dart';

class ScreensScreenBloc
    extends BaseBloc<ScreensScreenEvent, ScreensScreenState, ScreensScreenSR> {
  ScreensScreenBloc() : super(const ScreensScreenStateData(config: Config())) {
    on<ScreensScreenEventInit>(_onInit);
    on<ScreensScreenEventOnScreenAdd>(_onScreenAdd);
    on<ScreensScreenEventOnScreenDelete>(_onScreenDelete);
    on<ScreensScreenEventOnScreenModify>(_onScreenModify);
  }

  FutureOr<void> _onInit(
    ScreensScreenEventInit event,
    Emitter<ScreensScreenState> emit,
  ) {
    emit(state.copyWith(
      config: event.config.copyWith(
        screens: {
          Screen(name: 'home', exists: true, bloc: false),
          ...event.config.screens
        },
      ),
    ));
  }

  FutureOr<void> _onScreenAdd(
    ScreensScreenEventOnScreenAdd event,
    Emitter<ScreensScreenState> emit,
  ) {
    final screens = state.config.screens.toList();

    if (state.config.screens
        .where((element) => element.name == event.screen.name)
        .isNotEmpty) {
      addSr(const ScreensScreenSR.existsError());
    } else {
      screens.add(event.screen);

      emit(state.copyWith(
        config: state.config.copyWith(screens: screens.toSet()),
      ));
    }
  }

  FutureOr<void> _onScreenDelete(
    ScreensScreenEventOnScreenDelete event,
    Emitter<ScreensScreenState> emit,
  ) {
    var screens = state.config.screens.toList();
    screens.remove(event.screen);
    emit(state.copyWith(
      config: state.config.copyWith(screens: screens.toSet()),
    ));
  }

  FutureOr<void> _onScreenModify(
    ScreensScreenEventOnScreenModify event,
    Emitter<ScreensScreenState> emit,
  ) {
    emit(state.copyWith(stateUpdate: DateTime.now().millisecondsSinceEpoch));
  }
}
