import 'dart:async';

import 'package:onix_flutter_bricks/core/di/remote.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/auth/auth_entity.dart';
import 'package:onix_flutter_bricks/domain/service/session_service/session_status.dart';

class SessionService {
  final StreamController<SessionStatus> _sessionObserver =
      StreamController<SessionStatus>();

  SessionStatus _sessionStatus = SessionStatus.closed;

  Stream<SessionStatus> get sessionObserver => _sessionObserver.stream;

  SessionStatus get sessionStatus => _sessionStatus;

  Future<void> openSession(AuthenticationEntity authEntity) async {
    apiClientJsonPlaceholder().attachInterceptors();
    await tokenRepository.update(authEntity);
    _sessionStatus = SessionStatus.open;
    _sessionObserver.add(_sessionStatus);
  }

  Future<void> closeSession() async {
    apiClientJsonPlaceholder().deAttachInterceptors();
    await tokenRepository.clear();
    _sessionStatus = SessionStatus.closed;
    _sessionObserver.add(_sessionStatus);
  }
}
