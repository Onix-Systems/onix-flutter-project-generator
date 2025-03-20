import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/ok_cancel_keyboard_listener.dart';

class Dialogs {
  static Future<void> showOkDialog({
    required BuildContext context,
    required Widget content,
    bool isError = false,
    String title = '',
    VoidCallback? onOk,
  }) async {
    await showCupertinoDialog(
      context: context,
      builder: (ctx) => OkCancelKeyboardListener(
        onOk: onOk?.call,
        child: CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: context.appTextStyles.fs18?.copyWith(
                color: isError ? context.appColors.alarmColor : null,
              ),
            ),
          ),
          content: content,
          actions: [
            CupertinoDialogAction(
              child: Text(S.of(context).ok),
              onPressed: () {
                onOk?.call();
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> showOkCancelDialog({
    required BuildContext context,
    required Widget content,
    bool isError = false,
    String title = '',
    String? okLabel,
    String? cancelLabel,
    VoidCallback? onOk,
    VoidCallback? onCancel,
  }) async {
    await showCupertinoDialog(
      context: context,
      builder: (ctx) => OkCancelKeyboardListener(
        onOk: onOk?.call,
        onCancel: onCancel?.call,
        child: CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: context.appTextStyles.fs18?.copyWith(
                color: isError ? context.appColors.alarmColor : null,
              ),
            ),
          ),
          content: content,
          actions: [
            CupertinoDialogAction(
              child: Text(okLabel ?? S.of(context).ok),
              onPressed: () {
                onOk?.call();
                Navigator.of(ctx).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text(cancelLabel ?? S.of(context).cancel),
              onPressed: () {
                onCancel?.call();
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  static void showYesNoCancelDialog({
    required BuildContext context,
    required Widget content,
    bool isError = false,
    String title = '',
    VoidCallback? onYes,
    VoidCallback? onNo,
    VoidCallback? onCancel,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) => OkCancelKeyboardListener(
        onOk: onYes?.call,
        onCancel: onCancel?.call,
        child: CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: context.appTextStyles.fs18?.copyWith(
                color: isError ? context.appColors.alarmColor : null,
              ),
            ),
          ),
          content: content,
          actions: [
            CupertinoDialogAction(
              child: Text(S.of(context).yes),
              onPressed: () {
                onYes?.call();
                Navigator.of(ctx).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text(S.of(context).no),
              onPressed: () {
                onNo?.call();
                Navigator.of(ctx).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text(S.of(context).cancel),
              onPressed: () {
                onCancel?.call();
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  static Future<bool> showOverwriteCancelDialog({
    required BuildContext context,
    required Widget content,
    bool isError = false,
    String title = '',
  }) async {
    final overwrite = await showCupertinoDialog(
      context: context,
      builder: (ctx) => OkCancelKeyboardListener(
        okValue: true,
        child: CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: context.appTextStyles.fs18?.copyWith(
                color: isError ? context.appColors.alarmColor : null,
              ),
            ),
          ),
          content: content,
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(ctx).pop(true);
              },
              child: Text(S.of(context).overwrite),
            ),
            CupertinoDialogAction(
              child: Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      ),
    );

    return overwrite ?? false;
  }
}
