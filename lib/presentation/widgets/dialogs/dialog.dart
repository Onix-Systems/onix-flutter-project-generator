import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';

class Dialogs {
  static void showOkDialog({
    required BuildContext context,
    bool isError = false,
    String title = '',
    String content = '',
    VoidCallback? onOk,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Text(
            title,
            style: context.appTextStyles.fs18?.copyWith(
              color: isError ? AppColors.red : null,
            ),
          ),
        ),
        content: Text(content,
            style: context.appTextStyles.fs18?.copyWith(
              fontSize: 16.sp,
            )),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
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
    String content = '',
    VoidCallback? onOk,
    VoidCallback? onCancel,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(title, style: context.appTextStyles.fs18),
        content: Text(
          content,
          style: context.appTextStyles.fs18?.copyWith(
            fontSize: 16.sp,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              onOk?.call();
              Navigator.of(ctx).pop();
            },
          ),
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              onCancel?.call();
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }
}
