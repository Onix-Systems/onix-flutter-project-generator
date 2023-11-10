import 'dart:async';

import 'package:{{project_name}}/app/service/session_service/session_status.dart';
import 'package:{{project_name}}/domain/repository/firebase_auth_repository.dart';
import 'package:flutter/cupertino.dart';

class FirebaseSessionService extends ChangeNotifier {
  final FirebaseAuthRepository _authRepository;
  SessionStatus _sessionStatus = SessionStatus.closed;

  SessionStatus get sessionStatus => _sessionStatus;

  FirebaseSessionService(this._authRepository);

  Future<void> updateSessionStatus() async {
    _sessionStatus = _authRepository.isAuthenticated()
        ? SessionStatus.open
        : SessionStatus.closed;
    notifyListeners();
  }
}
