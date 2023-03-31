import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

@freezed
class AuthenticationEntity with _$AuthenticationEntity {
  const factory AuthenticationEntity({
    required String accessToken,
    required String refreshToken,
  }) = _AuthenticationEntity;
}
