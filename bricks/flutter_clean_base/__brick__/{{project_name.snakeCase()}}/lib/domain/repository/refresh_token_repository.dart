import 'package:{{project_name}}/domain/entity/authentication/authentication.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

abstract class RefreshTokenRepository {
  Future<Result<Authentication>> refresh(String refreshToken);
}
