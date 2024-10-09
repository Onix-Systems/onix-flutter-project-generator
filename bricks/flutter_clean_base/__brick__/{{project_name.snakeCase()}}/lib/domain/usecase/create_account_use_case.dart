import 'package:onix_flutter_core_models/onix_flutter_core.dart';
import 'package:{{project_name}}/app/service/firebase_session_service/firebase_session_service.dart';
import 'package:{{project_name}}/domain/params/create_user/create_account_params.dart';
import 'package:{{project_name}}/domain/repository/firebase_auth_repository.dart';

class CreateAccountUseCase {
  final FirebaseAuthRepository _authRepository;
  final FirebaseSessionService _sessionService;

  CreateAccountUseCase(
    this._authRepository,
    this._sessionService,
  );

  Future<Result<String>> call(CreateAccountParams params) async {
    final result = await _authRepository.createUser(params);
    if (result.success) {
      await _sessionService.updateSessionStatus();
    }
    return Future.value(result);
  }
}
