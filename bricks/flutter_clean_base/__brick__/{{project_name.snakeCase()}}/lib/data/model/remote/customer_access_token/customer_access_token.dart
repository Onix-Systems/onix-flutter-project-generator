import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_access_token.g.dart';

@JsonSerializable()
class CustomerAccessToken {
  const CustomerAccessToken(this.accessToken, this.expiresAt);

  final String accessToken;
  final String expiresAt;

  factory CustomerAccessToken.fromJson(Map<String, dynamic> json) =>
      _$CustomerAccessTokenFromJson(json);
}
