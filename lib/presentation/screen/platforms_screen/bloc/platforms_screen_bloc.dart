import 'dart:async';

import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc_imports.dart';

class PlatformsScreenBloc extends BaseBloc<PlatformsScreenEvent,
    PlatformsScreenState, PlatformsScreenSR> {
  PlatformsScreenBloc()
      : super(const PlatformsScreenStateData(config: Config())) {
    on<PlatformsScreenEventInit>(_onInit);
    on<PlatformsScreenEventOnPlatformsChange>(_onPlatformsChange);
  }

  FutureOr<void> _onInit(
    PlatformsScreenEventInit event,
    Emitter<PlatformsScreenState> emit,
  ) {
    emit(state.copyWith(
      config: event.config,
    ));
  }

  FutureOr<void> _onPlatformsChange(
    PlatformsScreenEventOnPlatformsChange event,
    Emitter<PlatformsScreenState> emit,
  ) {
    emit(state.copyWith(
      config: state.config.copyWith(
        platformsList: event.platformsList,
      ),
    ));
  }
}
