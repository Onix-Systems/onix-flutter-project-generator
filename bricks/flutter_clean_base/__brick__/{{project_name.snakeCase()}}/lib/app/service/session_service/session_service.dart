import 'dart:async';

import 'package:{{project_name}}/core/di/repository.dart';
import 'package:{{project_name}}/domain/entity/authentication/authentication.dart';
import 'package:{{project_name}}/app/service/session_service/session_status.dart';

class SessionService {{#isGoRouter}}extends ChangeNotifier{{/isGoRouter}} {

{{^isGoRouter}}
  final StreamController<SessionStatus> _sessionObserver =
  StreamController<SessionStatus>();
{{/isGoRouter}}

  SessionStatus _sessionStatus = SessionStatus.closed;

{{^isGoRouter}}
  Stream<SessionStatus> get sessionObserver => _sessionObserver.stream;
{{/isGoRouter}}

  SessionStatus get sessionStatus => _sessionStatus;

  Future<void> renewSession() async {
    final authData = await tokenRepository.getAuthData();
    if (authData == null) {
        return;
    }
    if (authData.accessToken.isEmpty) {
        return;
    }
    _sessionStatus = SessionStatus.open;
{{#isGoRouter}}
notifyListeners();
{{/isGoRouter}}
{{^isGoRouter}}
_sessionObserver.add(_sessionStatus);
{{/isGoRouter}}
}

  Future<void> openSession(Authentication authEntity) async {
    await tokenRepository.update(authEntity);
    _sessionStatus = SessionStatus.open;
{{#isGoRouter}}
notifyListeners();
{{/isGoRouter}}
{{^isGoRouter}}
    _sessionObserver.add(_sessionStatus);
{{/isGoRouter}}
  }

  Future<void> closeSession() async {
    await tokenRepository.clear();
    _sessionStatus = SessionStatus.closed;
{{#isGoRouter}}
notifyListeners();
{{/isGoRouter}}
{{^isGoRouter}}
_sessionObserver.add(_sessionStatus);
{{/isGoRouter}}
  }
}
