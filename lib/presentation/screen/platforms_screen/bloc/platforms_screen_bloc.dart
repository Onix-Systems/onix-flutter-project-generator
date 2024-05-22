import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc_imports.dart';

class PlatformsScreenBloc extends BaseBloc<PlatformsScreenEvent,
    PlatformsScreenState, PlatformsScreenSR> {
  PlatformsScreenBloc() : super(const PlatformsScreenState(config: Config())) {
    on<PlatformsScreenEventInit>(_onInit);
    on<PlatformsScreenEventOnPlatformsChange>(_onPlatformsChange);
  }

  void _onInit(
    PlatformsScreenEventInit event,
    Emitter<PlatformsScreenState> emit,
  ) {
    emit(state.copyWith(config: event.config));
  }

  void _onPlatformsChange(
    PlatformsScreenEventOnPlatformsChange event,
    Emitter<PlatformsScreenState> emit,
  ) {
    var copiedPlatforms = state.config.platformsList;

    switch (event.item) {
      case AvailablePlatforms.mobile:
        copiedPlatforms = copiedPlatforms.copyWith(
          android: !state.config.platformsList.android,
          ios: !state.config.platformsList.ios,
        );
      case AvailablePlatforms.web:
        copiedPlatforms = copiedPlatforms.copyWith(
          web: !state.config.platformsList.web,
        );
      case AvailablePlatforms.windows:
        copiedPlatforms = copiedPlatforms.copyWith(
          windows: !state.config.platformsList.windows,
        );
      case AvailablePlatforms.macos:
        copiedPlatforms = copiedPlatforms.copyWith(
          macos: !state.config.platformsList.macos,
        );
      case AvailablePlatforms.linux:
        copiedPlatforms = copiedPlatforms.copyWith(
          linux: !state.config.platformsList.linux,
        );
    }
    emit(
      state.copyWith(
        config: state.config.copyWith(platformsList: copiedPlatforms),
      ),
    );
  }
}
