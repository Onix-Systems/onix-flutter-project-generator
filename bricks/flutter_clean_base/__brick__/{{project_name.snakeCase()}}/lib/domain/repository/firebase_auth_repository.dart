import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';
import 'package:{{project_name}}/domain/params/create_user/create_account_params.dart';

//{entities_imports}

abstract class FirebaseAuthRepository {
  Future<Result<String>> createUser(CreateAccountParams params);

  Future<Result<String>> login(String email, String password);

  Future<Result<void>> logOut();

  bool isAuthenticated();
}
