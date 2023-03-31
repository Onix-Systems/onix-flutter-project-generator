import 'dart:async';

import 'package:{{project_name}}/domain/repository/startup_repository.dart';

class StartupRepositoryImpl implements StartupRepository {
  bool _isInited = false;

  @override
  Future<void> initialized() async {
    //TODO init firebaseMessagingService / accountService
    _isInited = true;
  }

  @override
  bool isInited() => _isInited;
}
