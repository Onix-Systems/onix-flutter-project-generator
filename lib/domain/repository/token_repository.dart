import 'package:onix_flutter_bricks/domain/entity/auth/auth_entity.dart';

abstract class TokenRepository {
  String? accessToken;
  String? refreshToken;

  Future<void> clear();

  Future<void> update(AuthenticationEntity authEntity);

  Future<AuthenticationEntity?> getAuthData();
}
