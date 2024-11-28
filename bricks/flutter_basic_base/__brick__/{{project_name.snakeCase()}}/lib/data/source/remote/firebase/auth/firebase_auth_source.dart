import 'package:onix_flutter_core/onix_flutter_core.dart';

//{response_imports}
//{request_imports}

abstract class FirebaseAuthSource {
  Future<DataResponse<OperationStatus>> createUser(
    String email,
    String password,
  );

  Future<DataResponse<OperationStatus>> authenticate(
    String email,
    String password,
  );

  Future<OperationStatus> logOut();

  bool isAuthenticated();

  String getUserUID();
}
