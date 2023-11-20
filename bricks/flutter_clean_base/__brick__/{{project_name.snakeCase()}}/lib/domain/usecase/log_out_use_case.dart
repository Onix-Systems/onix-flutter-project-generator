import 'package:{{project_name}}/app/service/firebase_session_service/firebase_session_service.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/result.dart';
import 'package:{{project_name}}/domain/repository/firebase_auth_repository.dart';

class LogOutUseCase {
  final FirebaseAuthRepository _authRepository;
  final FirebaseSessionService _sessionService;

  LogOutUseCase(
    this._authRepository,
    this._sessionService,
  );

  Future<Result<void>> call() async {
    final result = await _authRepository.logOut();
    if (result.success) {
      await _sessionService.updateSessionStatus();
    }
    return Future.value(result);
  }
}
