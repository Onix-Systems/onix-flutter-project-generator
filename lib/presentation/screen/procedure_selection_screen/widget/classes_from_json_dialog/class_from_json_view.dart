import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/formatters/first_character_is_not_digit_formatter.dart';
import 'package:onix_flutter_bricks/app/util/formatters/pascal_case_formatter.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/widget/classes_from_json_dialog/bloc/class_from_json_dialog_imports.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog_action_buttons.dart';

class ClassFromJsonView extends StatefulWidget {
  final Stream<ClassFromJsonDialogSR> srStream;
  final String generatedCode;
  final ValueChanged<String> onClassNameChange;

  const ClassFromJsonView({
    required this.srStream,
    required this.generatedCode,
    required this.onClassNameChange,
    super.key,
  });

  @override
  State<ClassFromJsonView> createState() => _ClassFromJsonViewState();
}

class _ClassFromJsonViewState extends State<ClassFromJsonView> {
  final _classNameController = TextEditingController();
  var _generatedCode = '';

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
                    child: Column(
                      children: [
                        CupertinoTextField(
                          controller: _classNameController,
                          style: context.appTextStyles.fs18,
                          placeholder: 'GeneratedClass',
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Z0-9]'),
                            ),
                            const PascalCaseFormatter(),
                            const FirstCharacterNotDigitFormatter(),
                          ],
                          onChanged: widget.onClassNameChange,
                        ),
                        const Gap(10),
                        Expanded(
                          child: StreamBuilder<ClassFromJsonDialogSR>(
                            stream: widget.srStream,
                            builder: (context, snapshot) {
                              _generatedCode = snapshot.data?.generatedCode ??
                                  widget.generatedCode;
                              return SelectableText(
                                _generatedCode,
                                textAlign: TextAlign.start,
                                style: context.appTextStyles.fs18,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DialogActionButtons(
                leftButtonLabel: S.of(context).copyToClipboard,
                rightButtonLabel: S.of(context).cancel,
                leftButtonOnPressed: () async {
                  await Clipboard.setData(
                    ClipboardData(text: _generatedCode),
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

  @override
  void dispose() {
    _classNameController.dispose();
    super.dispose();
  }
}
