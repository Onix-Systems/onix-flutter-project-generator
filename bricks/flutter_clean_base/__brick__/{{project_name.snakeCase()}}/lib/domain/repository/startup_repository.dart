import 'dart:async';

abstract class StartupRepository {
  Future<void> initialized();

  bool isInited();
}
