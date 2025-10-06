import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';

enum SigningFailureType { invalidParams, exception, signingAlreadyExist }

class SigningFailure implements Exception {
  SigningFailure(
    this.type, {
    this.e,
  });

  SigningFailureType type;
  Exception? e;

  String getSigningFailureMessage(BuildContext context) {
    switch (type) {
      case SigningFailureType.invalidParams:
        return S.of(context).signingErrorParams;
      case SigningFailureType.exception:
        return S.of(context).signingErrorException;
      case SigningFailureType.signingAlreadyExist:
        return S.of(context).signingErrorExist;
    }
  }
}
