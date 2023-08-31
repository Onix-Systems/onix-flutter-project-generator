import 'package:{{project_name}}/data/model/remote/response/customer_access_token/customer_access_token_create_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_token_response_data.g.dart';

@JsonSerializable()
class CustomerTokenResponseData {
  const CustomerTokenResponseData(
    this.typename,
    this.customerAccessTokenCreate,
  );

  @JsonKey(name: '__typename')
  final String typename;
  final CustomerAccessTokenCreateResponse customerAccessTokenCreate;

  factory CustomerTokenResponseData.fromJson(Map<String, dynamic> json) =>
      _$CustomerTokenResponseDataFromJson(json);
}
