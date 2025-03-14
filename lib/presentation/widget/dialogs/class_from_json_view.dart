import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog_action_buttons.dart';

class ClassFromJsonView extends StatelessWidget {
  final String result;

  const ClassFromJsonView({
    required this.result,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.8,
            minWidth: MediaQuery.sizeOf(context).width * 0.5,
            maxWidth: MediaQuery.sizeOf(context).width * 0.8,
          ),
          decoration: BoxDecoration(
            color: context.appColors.darkColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox.expand(
                    child: SelectableText(
                      result,
                      textAlign: TextAlign.start,
                      style: context.appTextStyles.fs18,
                    ),
                  ),
                ),
              ),
              DialogActionButtons(
                leftButtonLabel: S.of(context).copyToClipboard,
                rightButtonLabel: S.of(context).cancel,
                leftButtonOnPressed: () async {
                  await Clipboard.setData(
                    ClipboardData(text: result),
                  );
                  if (context.mounted) {
                    showToast(
                      S.of(context).copyToClipboardSuccess,
                      context: context,
                    );
                  }
                },
                rightButtonOnPressed: Navigator.of(context).pop,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
