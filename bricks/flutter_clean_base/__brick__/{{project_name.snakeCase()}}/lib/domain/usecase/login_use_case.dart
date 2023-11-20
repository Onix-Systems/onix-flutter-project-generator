import 'package:{{project_name}}/app/service/firebase_session_service/firebase_session_service.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/result.dart';

import 'package:{{project_name}}/domain/repository/firebase_auth_repository.dart';

class LoginUseCase {
  final FirebaseAuthRepository _authRepository;
  final FirebaseSessionService _sessionService;

  LoginUseCase(
    this._authRepository,
    this._sessionService,
  );

  Future<Result<String>> call(String email, String password) async {
    final result = await _authRepository.login(
      email,
      password,
    );
    if (result.success) {
      await _sessionService.updateSessionStatus();
    }
    return Future.value(result);
  }
}
