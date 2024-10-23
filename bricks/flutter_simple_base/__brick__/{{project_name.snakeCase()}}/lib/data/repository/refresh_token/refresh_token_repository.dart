import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:{{project_name}}/data/model/authentication/authentication.dart';

abstract class RefreshTokenRepository {
  Future<Result<Authentication>> refresh(String refreshToken);
}
