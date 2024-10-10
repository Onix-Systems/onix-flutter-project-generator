import 'package:firebase_auth/firebase_auth.dart';
import 'package:onix_flutter_core_models/onix_flutter_core.dart';
import 'package:{{project_name}}/data/source/remote/firebase/auth/firebase_auth_source.dart';

//{response_imports}
//{request_imports}

typedef AuthProcessFunction = Future<UserCredential> Function({
  required String email,
  required String password,
});

class FirebaseAuthSourceImpl extends FirebaseAuthSource {
  final FirebaseAuth _client;

  FirebaseAuthSourceImpl(this._client);

  @override
  Future<DataResponse<OperationStatus>> authenticate(
    String email,
    String password,
  ) async {
    return _makeAuthCall(
      _client.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<DataResponse<OperationStatus>> createUser(
    String email,
    String password,
  ) async {
    return _makeAuthCall(
      _client.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<OperationStatus> logOut() async {
    try {
      await _client.signOut();
      return OperationStatus.success;
    } catch (e) {
      return OperationStatus.failed;
    }
  }

  @override
  String getUserUID() => _client.currentUser?.uid ?? '';

  @override
  bool isAuthenticated() => _client.currentUser != null;

  Future<DataResponse<OperationStatus>> _makeAuthCall(
    Future<UserCredential> authFunction,
  ) async {
    try {
      final credential = await authFunction;
      if (credential.user != null) {
        return const DataResponse.success(OperationStatus.success);
      } else {
        return const DataResponse.unauthorized();
      }
    } on FirebaseAuthException catch (e) {
      return DataResponse.undefinedError(e);
    } catch (e) {
      return DataResponse.undefinedError(e);
    }
  }
}
