import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/signing_failure.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';

extension FailureDialogExtension on BuildContext {
  Future<bool> onSigningFailure(SigningFailure failure) async {
    if (failure.type == SigningFailureType.signingAlreadyExist) {
      final result = await Dialogs.showOverwriteCancelDialog(
        context: this,
        isError: true,
        title: S.of(this).signingToolTitle,
        content: Text(
          _getSigningFailureMessage(failure),
          style: appTextStyles.fs18?.copyWith(
            fontSize: 16,
          ),
        ),
      );

      return result;
    } else {
      Dialogs.showOkDialog(
        context: this,
        isError: true,
        title: S.of(this).signingToolTitle,
        content: Text(
          _getSigningFailureMessage(failure),
          style: appTextStyles.fs18?.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }
    return false;
  }

  String _getSigningFailureMessage(SigningFailure failure) {
    switch (failure.type) {
      case SigningFailureType.invalidParams:
        return S.of(this).signingErrorParams;
      case SigningFailureType.exception:
        return S.of(this).signingErrorException;
      case SigningFailureType.signingAlreadyExist:
        return S.of(this).signingErrorExist;
    }
  }
}
