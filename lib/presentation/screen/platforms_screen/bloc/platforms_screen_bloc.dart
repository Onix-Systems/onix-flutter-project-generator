import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/service/config_service/config_service.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc_imports.dart';

class PlatformsScreenBloc extends BaseBloc<PlatformsScreenEvent,
    PlatformsScreenState, PlatformsScreenSR> {
  final ConfigService _configService;

  PlatformsScreenBloc({required ConfigService configService})
      : _configService = configService,
        super(const PlatformsScreenStateData(config: Config())) {
    on<PlatformsScreenEventInit>(_onInit);
    on<PlatformsScreenEventOnPlatformsChange>(_onPlatformsChange);
  }

  void _onInit(
    PlatformsScreenEventInit event,
    Emitter<PlatformsScreenState> emit,
  ) {
    emit(state.copyWith(config: _configService.config));
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

    _configService.updateWith(
      platformsList: copiedPlatforms,
      screenUtil: !copiedPlatforms.webOnly && state.config.screenUtil,
    );

    emit(
      state.copyWith(
        config: _configService.config,
      ),
    );
  }
}
