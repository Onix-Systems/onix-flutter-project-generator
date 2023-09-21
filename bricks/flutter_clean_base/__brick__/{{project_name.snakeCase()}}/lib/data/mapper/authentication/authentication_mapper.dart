import 'package:{{project_name}}/core/arch/domain/common/converter/mapper.dart';
import 'package:{{project_name}}/data/model/remote/auth/auth_response.dart';
import 'package:{{project_name}}/domain/entity/authentication/authentication.dart';

class _ResponseToEntity implements Mapper<AuthResponse, Authentication> {
  @override
  Authentication map(AuthResponse from) {
    return Authentication(
      accessToken: from.accessToken ?? '',
      refreshToken: from.refreshToken ?? '',
    );
  }
}

class _RefreshEntity implements Mapper<AuthResponse, Authentication> {
  @override
  Authentication map(AuthResponse from) {
    return Authentication(
      accessToken: from.accessToken ?? '',
      refreshToken: from.refreshToken ?? '',
    );
  }
}

class AuthMapper {
  final _responseToEntity = _ResponseToEntity();
  final _refreshEntity = _RefreshEntity();

  Authentication mapResponseToEntity(AuthResponse from) =>
      _responseToEntity.map(from);

  Authentication mapRefreshEntity(AuthResponse from) =>
      _refreshEntity.map(from);
}
