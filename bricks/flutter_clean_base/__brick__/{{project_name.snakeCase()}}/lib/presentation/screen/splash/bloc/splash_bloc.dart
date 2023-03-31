import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/core/arch/bloc/base_bloc.dart';
import 'package:{{project_name}}/domain/repository/startup_repository.dart';
import 'package:{{project_name}}/presentation/screen/splash/bloc/splash_bloc_imports.dart';

class SplashBloc extends BaseBloc<SplashEvent, SplashScreenState, SplashSR> {
  final StartupRepository startupRepository;
  Timer? _timer;
  bool _isReadyTimer = false;

  SplashBloc(this.startupRepository) : super(SplashScreenState()) {
    on<SplashEventInit>(_onInit);
    add(const SplashEvent.init());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  FutureOr<void> _onInit(
    SplashEventInit event,
    Emitter<SplashScreenState> emit,
  ) async {
    _timer = Timer(
      const Duration(seconds: 20),
      () {
        _isReadyTimer = true;
        _navNext();
      },
    );
    await startupRepository.initialized();
    await _navNext();
  }

  Future<void> _navNext() async {
    if (_isReadyTimer && startupRepository.isInited()) {
      _timer?.cancel();
      addSr(const SplashSR.loadFinished());
    }
  }
}
