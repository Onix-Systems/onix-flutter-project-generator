import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/signing_failure.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';

extension FailureDialogExtension on BuildContext {
  void onSigningFailure(SigningFailure failure) {
    Dialogs.showOkDialog(
      context: this,
      isError: true,
      title: S.of(this).signingToolTitle,
      content: Text(
        failure.getSigningFailureMessage(this),
        style: appTextStyles.fs18?.copyWith(
          fontSize: 16,
        ),
      ),
    );
  }
}
