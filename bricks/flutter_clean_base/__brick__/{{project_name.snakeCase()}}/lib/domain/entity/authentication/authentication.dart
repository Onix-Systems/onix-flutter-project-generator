import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

part 'auth_entity.g.dart';

@freezed
class Authentication with _$Authentication {
  const factory Authentication({
    required String accessToken,
    required String refreshToken,
  }) = _Authentication;

  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);

  factory Authentication.empty() => Authentication(
        accessToken: '',
        refreshToken: '',
      );
}
