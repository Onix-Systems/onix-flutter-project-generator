import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:{{project_name}}/data/model/authentication/dto/authentication_request.dart';
import 'package:{{project_name}}/data/model/customer_access_token/customer_token_response_data.dart';

abstract class AuthSource {
  Future<DataResponse<CustomerTokenResponseData>> login(
    AuthenticationRequest requestData,
  );
}
