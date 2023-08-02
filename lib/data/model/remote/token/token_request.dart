import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_request.freezed.dart';

part 'token_request.g.dart';

@Freezed(toJson: true)
class TokenRequest with _$TokenRequest {
  const factory TokenRequest({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _TokenRequest;
}
