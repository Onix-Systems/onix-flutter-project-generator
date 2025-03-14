import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/formatters/first_character_is_not_digit_formatter.dart';
import 'package:onix_flutter_bricks/app/util/formatters/pascal_case_formatter.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/widget/classes_from_json_dialog/bloc/class_from_json_view_imports.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog_action_buttons.dart';

class ClassFromJsonView extends StatefulWidget {
  final String json;

  const ClassFromJsonView({
    required this.json,
    super.key,
  });

  @override
  State<ClassFromJsonView> createState() => _ClassFromJsonViewState();
}

class _ClassFromJsonViewState extends BaseCubitState<ClassFromJsonViewState,
    ClassFromJsonViewCubit, ClassFromJsonViewSR, ClassFromJsonView> {
  final _classNameController = TextEditingController();

  @override
  ClassFromJsonViewCubit createCubit() => GetIt.I.get<ClassFromJsonViewCubit>();

  @override
  void onCubitCreated(BuildContext context, ClassFromJsonViewCubit cubit) {
    super.onCubitCreated(context, cubit);

    cubit.init(widget.json);

    _classNameController.addListener(() {
      if (_classNameController.text != cubit.state.className) {
        cubit.onClassNameChange(_classNameController.text);
      }
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
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
          child: blocBuilder(
            builder: (context, state) {
              return Column(
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
                                const PascalCaseFormatter(),
                                const FirstCharacterNotDigitFormatter(),
                                FilteringTextInputFormatter.allow(
                                  RegExp('[a-zA-Z0-9]'),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Expanded(
                              child: SelectableText(
                                state.generatedCode,
                                textAlign: TextAlign.start,
                                style: context.appTextStyles.fs18,
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
                        ClipboardData(text: widget.json),
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
              );
            },
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
