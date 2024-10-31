import 'package:{{project_name}}/data/model/customer_access_token/customer_access_token.dart';
import 'package:{{project_name}}/data/model/customer_access_token/customer_user_error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_access_token_create_response.g.dart';

@JsonSerializable()
class CustomerAccessTokenCreateResponse {
  const CustomerAccessTokenCreateResponse(
    this.typename,
    this.customerAccessToken,
    this.customerUserErrors,
  );

  @JsonKey(name: '__typename')
  final String? typename;
  final CustomerAccessToken? customerAccessToken;
  final List<CustomerUserErrorResponse>? customerUserErrors;

  factory CustomerAccessTokenCreateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$CustomerAccessTokenCreateResponseFromJson(json);
  }
}
