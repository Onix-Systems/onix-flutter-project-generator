import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_request.freezed.dart';

part 'auth_request.g.dart';

@Freezed(toJson: true)
class AuthRequest with _$AuthRequest {
  const factory AuthRequest({
    @JsonKey(name: 'input') required AuthRequestData input,
  }) = _AuthRequest;

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);
}

@Freezed(toJson: true)
class AuthRequestData with _$AuthRequestData {
  const factory AuthRequestData({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
  }) = _AuthRequestData;

  factory AuthRequestData.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestDataFromJson(json);
}
