import 'package:onix_flutter_bricks/core/arch/domain/entity/failure/failure.dart';

enum SigningFailureType { invalidParams, exception, signingAlreadyExist }

class SigningFailure implements Failure {
  SigningFailure(
    this.type, {
    this.e,
  });

  SigningFailureType type;
  Exception? e;
}
