import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/widget/classes_from_json_dialog/class_from_json_view.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog_action_buttons.dart';

class ClassesFromJsonDialog extends StatefulWidget {
  const ClassesFromJsonDialog({super.key});

  @override
  State<ClassesFromJsonDialog> createState() => _ClassesFromJsonDialogState();
}

class _ClassesFromJsonDialogState extends State<ClassesFromJsonDialog> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.5,
          decoration: BoxDecoration(
            color: context.appColors.darkColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      S.of(context).pasteJsonHere,
                      style: context.appTextStyles.fs18,
                    ),
                    const Gap(20),
                    CupertinoTextField(
                      controller: _controller,
                      maxLines: 10,
                      style: context.appTextStyles.fs18,
                      onChanged: (_) {
                        setState(() {});
                      },
                    ),
                    const Gap(20),
                  ],
                ),
              ),
              DialogActionButtons(
                leftButtonLabel: S.of(context).ok,
                rightButtonLabel: S.of(context).cancel,
                leftButtonOnPressed: () {
                  Navigator.of(context).pop();
                  if (_controller.text.isNotEmpty && context.mounted) {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (ctx) =>
                          ClassFromJsonView(json: _controller.text),
                    );
                  }
                },
                rightButtonOnPressed: () => Navigator.of(context).pop(),
                isLeftButtonActive: _controller.text.isNotEmpty,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
