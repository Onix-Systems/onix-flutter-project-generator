import 'package:{{project_name}}/core/arch/domain/entity/common/data_response.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/operation_status.dart';

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
