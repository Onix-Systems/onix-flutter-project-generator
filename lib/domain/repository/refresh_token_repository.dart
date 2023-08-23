import 'package:onix_flutter_bricks/core/arch/domain/entity/common/result.dart';
import 'package:onix_flutter_bricks/domain/entity/auth/auth_entity.dart';

abstract class RefreshTokenRepository {
  Future<Result<AuthenticationEntity>> refresh(String refreshToken);
}
