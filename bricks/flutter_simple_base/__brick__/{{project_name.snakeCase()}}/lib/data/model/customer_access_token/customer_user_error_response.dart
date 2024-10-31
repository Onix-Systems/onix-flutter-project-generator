import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_user_error_response.g.dart';

@JsonSerializable()
class CustomerUserErrorResponse {
  const CustomerUserErrorResponse(this.code, this.field, this.message);

  final String? code;
  final List<String?>? field;
  final String? message;

  factory CustomerUserErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerUserErrorResponseFromJson(json);
}
