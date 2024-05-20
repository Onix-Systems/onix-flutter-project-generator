import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';

class Dialogs {
  static void showOkDialog({
    required BuildContext context,
    required Widget content,
    bool isError = false,
    String title = '',
    VoidCallback? onOk,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            title,
            style: context.appTextStyles.fs18?.copyWith(
              color: isError ? AppColors.red : null,
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
    );
  }

  static showOkCancelDialog({
    required BuildContext context,
    bool isError = false,
    String title = '',
    String? okLabel,
    String? cancelLabel,
    required Widget content,
    VoidCallback? onOk,
    VoidCallback? onCancel,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) => Focus(
        autofocus: true,
        onKeyEvent: (node, event) {
          if (HardwareKeyboard.instance
              .isLogicalKeyPressed(LogicalKeyboardKey.enter)) {
            onOk?.call();
            Navigator.of(ctx).pop();
            return KeyEventResult.handled;
          } else if (HardwareKeyboard.instance
              .isLogicalKeyPressed(LogicalKeyboardKey.escape)) {
            onCancel?.call();
            Navigator.of(ctx).pop();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: context.appTextStyles.fs18?.copyWith(
                color: isError ? AppColors.red : null,
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

  static showYesNoCancelDialog({
    required BuildContext context,
    bool isError = false,
    String title = '',
    required Widget content,
    VoidCallback? onYes,
    VoidCallback? onNo,
    VoidCallback? onCancel,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) => Focus(
        autofocus: true,
        onKeyEvent: (node, event) {
          if (HardwareKeyboard.instance
              .isLogicalKeyPressed(LogicalKeyboardKey.enter)) {
            onYes?.call();
            Navigator.of(ctx).pop();
            return KeyEventResult.handled;
          } else if (HardwareKeyboard.instance
              .isLogicalKeyPressed(LogicalKeyboardKey.escape)) {
            onCancel?.call();
            Navigator.of(ctx).pop();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: context.appTextStyles.fs18?.copyWith(
                color: isError ? AppColors.red : null,
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
}
