import 'package:{{project_name}}/data/model/authentication/dto/authentication_response.dart';
import 'package:{{project_name}}/data/model/authentication/authentication.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class _ResponseToEntity
    implements Mapper<AuthenticationResponse, Authentication> {
  @override
  Authentication map(AuthenticationResponse from) {
    return Authentication(
      accessToken: from.accessToken ?? '',
      refreshToken: from.refreshToken ?? '',
    );
  }
}

class _RefreshEntity implements Mapper<AuthenticationResponse, Authentication> {
  @override
  Authentication map(AuthenticationResponse from) {
    return Authentication(
      accessToken: from.accessToken ?? '',
      refreshToken: from.refreshToken ?? '',
    );
  }
}

class AuthenticationMappers {
  final _responseToEntity = _ResponseToEntity();
  final _refreshEntity = _RefreshEntity();

  Authentication mapResponseToEntity(AuthenticationResponse from) =>
      _responseToEntity.map(from);

  Authentication mapRefreshEntity(AuthenticationResponse from) =>
      _refreshEntity.map(from);
}
