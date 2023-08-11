import 'package:onix_flutter_bricks/core/arch/domain/common/converter/mapper.dart';
import 'package:onix_flutter_bricks/data/model/remote/auth/auth_response.dart';
import 'package:onix_flutter_bricks/domain/entity/auth/auth_entity.dart';

class _ResponseToEntity implements Mapper<AuthResponse, AuthenticationEntity> {
  @override
  AuthenticationEntity map(AuthResponse from) {
    return AuthenticationEntity(
      accessToken: from.accessToken ?? '',
      refreshToken: from.refreshToken ?? '',
    );
  }
}

class _RefreshEntity implements Mapper<AuthResponse, AuthenticationEntity> {
  @override
  AuthenticationEntity map(AuthResponse from) {
    return AuthenticationEntity(
      accessToken: from.accessToken ?? '',
      refreshToken: from.refreshToken ?? '',
    );
  }
}

class AuthMapper {
  final _responseToEntity = _ResponseToEntity();
  final _refreshEntity = _RefreshEntity();

  AuthenticationEntity mapResponseToEntity(AuthResponse from) =>
      _responseToEntity.map(from);

  AuthenticationEntity mapRefreshEntity(AuthResponse from) =>
      _refreshEntity.map(from);
}