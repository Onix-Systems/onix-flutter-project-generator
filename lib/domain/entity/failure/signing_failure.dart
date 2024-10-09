import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

enum SigningFailureType { invalidParams, exception, signingAlreadyExist }

class SigningFailure implements Failure {
  SigningFailure(
    this.type, {
    this.e,
  });

  SigningFailureType type;
  Exception? e;
}
