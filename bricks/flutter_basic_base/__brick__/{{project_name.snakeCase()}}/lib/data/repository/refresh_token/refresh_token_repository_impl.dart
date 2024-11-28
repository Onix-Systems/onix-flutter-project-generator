import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:{{project_name}}/data/model/authentication/authentication.dart';
import 'package:{{project_name}}/data/repository/refresh_token/refresh_token_repository.dart';

class RefreshTokenRepositoryImpl implements RefreshTokenRepository {
  @override
  Future<Result<Authentication>> refresh(String refreshToken) async {
    // TODO: implement refresh
    throw UnimplementedError();
    //implementation something like this. Depends on your requirements
    // try {
    //   final response = await _authSource.refreshToken(refreshToken);
    //   if (response.isSuccess()) {
    //     final entities = _authMappers.mapRefreshEntity(response.data);
    //     return Result.success(entities);
    //   } else {
    //  final failure = MapCommonServerError.getServerFailureDetails(response);
    //     return Result.error(failure: failure);
    //   }
    // } catch (e) {
    //   Logger.e(e);
    //   return Result.error(
    //     failure: ApiFailure(
    //       ServerFailure.exception,
    //       message: e.toString(),
    //     ),
    // }
  }
}
