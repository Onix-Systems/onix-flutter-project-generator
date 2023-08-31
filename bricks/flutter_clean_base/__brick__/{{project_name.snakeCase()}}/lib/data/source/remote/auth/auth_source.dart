import 'package:{{project_name}}/core/arch/domain/entity/common/data_response.dart';
import 'package:{{project_name}}/data/model/remote/request/auth/auth_request.dart';
import 'package:{{project_name}}/data/model/remote/response/customer_access_token/customer_token_response_data.dart';

abstract class AuthSource {
  Future<DataResponse<CustomerTokenResponseData>> login(
      AuthRequest requestData);
}
