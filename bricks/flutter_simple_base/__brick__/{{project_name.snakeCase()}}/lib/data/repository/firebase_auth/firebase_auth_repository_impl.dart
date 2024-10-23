import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';
import 'package:{{project_name}}/app/logger/app_logger_impl.dart';
import 'package:{{project_name}}/data/source/remote/firebase/auth/firebase_auth_source.dart';
import 'package:{{project_name}}/data/model/failure/firebase_failure.dart';
import 'package:{{project_name}}/data/model/params/create_user/create_account_params.dart';
import 'package:{{project_name}}/data/repository/firebase_auth/firebase_auth_repository.dart';
//{entities_imports}

class FirebaseAuthRepositoryImpl extends FirebaseAuthRepository {
  final FirebaseAuthSource _authSource;

  FirebaseAuthRepositoryImpl(this._authSource);

  @override
  Future<Result<String>> createUser(CreateAccountParams params) async {
    try {
      final registrationResponse = await _authSource.createUser(
        params.email,
        params.password,
      );
      if (registrationResponse.isSuccess()) {
        return Result.success(_authSource.getUserUID());
      } else {
        return Result.error(failure: ApiFailure(ServerFailure.unAuthorized));
      }
    } catch (e, trace) {
      logger.crash(reason: 'createUser_ERR', error: e, stackTrace: trace);
      return Result.error(
        failure: ApiFailure(
          ServerFailure.exception,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<String>> login(
    String email,
    String password,
  ) async {
    try {
      final registrationResponse = await _authSource.authenticate(
        email,
        password,
      );
      if (registrationResponse.isSuccess()) {
        return Result.success(_authSource.getUserUID());
      } else {
        return Result.error(failure: ApiFailure(ServerFailure.unAuthorized));
      }
    } catch (e, trace) {
      logger.crash(reason: 'login_ERR', error: e, stackTrace: trace);
      return Result.error(
        failure: ApiFailure(
          ServerFailure.exception,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<void>> logOut() async {
    final response = await _authSource.logOut();
    if (response == OperationStatus.success) {
      return const Result.success(null);
    } else {
      return Result.error(failure: FirebaseFailure('logout-failed'));
    }
  }

  @override
  bool isAuthenticated() => _authSource.isAuthenticated();
}
