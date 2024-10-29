import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:{{project_name}}/data/model/remote/authentication/authentication_request.dart';
import 'package:{{project_name}}/data/model/remote/customer_access_token/customer_token_response_data.dart';

abstract class AuthSource {
  Future<DataResponse<CustomerTokenResponseData>> login(
    AuthenticationRequest requestData,
  );
}
