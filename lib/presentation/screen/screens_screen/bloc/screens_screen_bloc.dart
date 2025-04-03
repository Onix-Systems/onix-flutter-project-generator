import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/service/config_service/config_service.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/bloc/screens_screen_bloc_imports.dart';

class ScreensScreenBloc
    extends BaseBloc<ScreensScreenEvent, ScreensScreenState, ScreensScreenSR> {
  final ConfigService _configService;
  final ScreenRepository _screenRepository;

  Config get _config => _configService.config;

  ScreensScreenBloc({
    required ConfigService configService,
    required ScreenRepository screenRepository,
  })  : _configService = configService,
        _screenRepository = screenRepository,
        super(const ScreensScreenStateData(config: Config())) {
    on<ScreensScreenEventInit>(_onInit);
    on<ScreensScreenEventOnScreenAdd>(_onScreenAdd);
    on<ScreensScreenEventOnScreenDelete>(_onScreenDelete);
    on<ScreensScreenEventOnScreenModify>(_onScreenModify);
    on<ScreensScreenEventOnScreenChangeInitial>(_onScreenChangeInitial);
  }

  void _onInit(
    ScreensScreenEventInit event,
    Emitter<ScreensScreenState> emit,
  ) {
    _configService.updateWith(
      screens: _screenRepository.screens,
    );

    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onScreenAdd(
    ScreensScreenEventOnScreenAdd event,
    Emitter<ScreensScreenState> emit,
  ) {
    if (_screenRepository.exists(screenName: event.screen.name)) {
      addSr(const ScreensScreenSR.existsError());
    } else {
      if (event.screen.name.isEmpty) {
        addSr(const ScreensScreenSR.wrongNameError());
        return;
      }

      _screenRepository.addScreen(screen: event.screen);

      _configService.updateWith(
        screens: _screenRepository.screens,
      );

      emit(
        state.copyWith(
          config: _config,
        ),
      );
    }
  }

  void _onScreenDelete(
    ScreensScreenEventOnScreenDelete event,
    Emitter<ScreensScreenState> emit,
  ) {
    _screenRepository.removeScreen(screenName: event.screenName);
    _configService.updateWith(
      screens: _screenRepository.screens,
    );
    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  void _onScreenModify(
    ScreensScreenEventOnScreenModify event,
    Emitter<ScreensScreenState> emit,
  ) {
    _screenRepository.modifyScreen(event.screen, event.oldName);
    _configService.updateWith(
      screens: _screenRepository.screens,
    );
    emit(
      state.copyWith(
        config: _config,
      ),
    );
  }

  FutureOr<void> _onScreenChangeInitial(
    ScreensScreenEventOnScreenChangeInitial event,
    Emitter<ScreensScreenState> emit,
  ) {
    final oldInitial = state.config.screens.firstWhere((e) => e.initial)
      ..initial = false;
    _screenRepository.modifyScreen(oldInitial, oldInitial.name);
    event.screen.initial = true;
    _screenRepository.modifyScreen(event.screen, event.screen.name);
    _configService.updateWith(
      screens: _screenRepository.screens,
    );

    emit(
      state.copyWith(
        stateUpdate: state.stateUpdate + 1,
        config: _config,
      ),
    );
  }
}
