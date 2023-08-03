import 'dart:async';

import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';

import 'package:onix_flutter_bricks/presentation/screen/screens_screen/bloc/screens_screen_bloc_imports.dart';

class ScreensScreenBloc
    extends BaseBloc<ScreensScreenEvent, ScreensScreenState, ScreensScreenSR> {
  ScreensScreenBloc() : super(const ScreensScreenStateData()) {
    on<ScreensScreenEventInit>(_onInit);
    on<ScreensScreenEventOnScreenAdd>(_onScreenAdd);
    on<ScreensScreenEventOnScreenDelete>(_onScreenDelete);
    on<ScreensScreenEventOnScreenModify>(_onScreenModify);
    add(const ScreensScreenEvent.init());
  }

  FutureOr<void> _onInit(
    ScreensScreenEventInit event,
    Emitter<ScreensScreenState> emit,
  ) {
    emit(state.copyWith(
      screens: List.generate(
        20,
        (index) => Screen(
          name: 'screen $index',
          exists: false,
          bloc: false,
        ),
      ).toSet(),
      // {
      //   Screen(name: 'home', exists: true, bloc: false),
      // },
    ));
  }

  FutureOr<void> _onScreenAdd(
    ScreensScreenEventOnScreenAdd event,
    Emitter<ScreensScreenState> emit,
  ) {
    final screens = state.screens.toList();

    if (state.screens
        .where((element) => element.name == event.screen.name)
        .isNotEmpty) {
      addSr(const ScreensScreenSR.existsError());
    } else {
      screens.add(event.screen);

      emit(state.copyWith(screens: screens.toSet()));
    }
  }

  FutureOr<void> _onScreenDelete(
    ScreensScreenEventOnScreenDelete event,
    Emitter<ScreensScreenState> emit,
  ) {
    var screens = state.screens.toList();
    screens.remove(event.screen);
    emit(state.copyWith(screens: screens.toSet()));
  }

  FutureOr<void> _onScreenModify(
    ScreensScreenEventOnScreenModify event,
    Emitter<ScreensScreenState> emit,
  ) {
    emit(state.copyWith(stateUpdate: DateTime.now().millisecondsSinceEpoch));
  }
}
