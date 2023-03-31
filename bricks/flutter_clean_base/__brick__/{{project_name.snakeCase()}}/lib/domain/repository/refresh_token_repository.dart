import 'package:{{project_name}}/core/arch/domain/entity/common/result.dart';
import 'package:{{project_name}}/domain/entity/auth/auth_entity.dart';

abstract class RefreshTokenRepository {
  Future<Result<AuthenticationEntity>> refresh(String refreshToken);
}
