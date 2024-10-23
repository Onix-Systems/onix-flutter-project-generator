import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_request.freezed.dart';

part 'authentication_request.g.dart';

@Freezed(toJson: true)
class AuthenticationRequest with _$AuthenticationRequest {
  const factory AuthenticationRequest({
    @JsonKey(name: 'input') required AuthenticationRequestData input,
  }) = _AuthenticationRequest;

  factory AuthenticationRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationRequestFromJson(json);
}

@Freezed(toJson: true)
class AuthenticationRequestData with _$AuthenticationRequestData {
  const factory AuthenticationRequestData({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
  }) = _AuthenticationRequestData;

  factory AuthenticationRequestData.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationRequestDataFromJson(json);
}
