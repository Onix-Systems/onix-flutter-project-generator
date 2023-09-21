import 'package:{{project_name}}/core/arch/domain/entity/common/result.dart';
import 'package:{{project_name}}/domain/entity/authentication/authentication.dart';

abstract class RefreshTokenRepository {
  Future<Result<Authentication>> refresh(String refreshToken);
}
