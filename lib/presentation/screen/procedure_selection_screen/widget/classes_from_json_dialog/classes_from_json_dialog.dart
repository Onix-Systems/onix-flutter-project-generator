import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/json_parser_failure.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/widget/classes_from_json_dialog/bloc/class_from_json_dialog_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/widget/classes_from_json_dialog/class_from_json_view.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog_action_buttons.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

class ClassesFromJsonDialog extends StatefulWidget {
  const ClassesFromJsonDialog({super.key});

  @override
  State<ClassesFromJsonDialog> createState() => _ClassesFromJsonDialogState();
}

class _ClassesFromJsonDialogState extends BaseCubitState<
    ClassFromJsonDialogState,
    ClassFromJsonDialogCubit,
    ClassFromJsonDialogSR,
    ClassesFromJsonDialog> {
  final _inputController = TextEditingController();
  final _generatedCodeController = TextEditingController();

  @override
  ClassFromJsonDialogCubit createCubit() =>
      GetIt.I.get<ClassFromJsonDialogCubit>();

  @override
  void onFailure(BuildContext context, Failure failure) {
    super.onFailure(context, failure);
    if (failure is JsonParserFailure) {
      final message = failure.e.toString();

      Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).addVariableFailureTitle,
        content: Text(
          message,
          textAlign: TextAlign.start,
          style: context.appTextStyles.fs18?.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      onSR: _onSR,
      child: Center(
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
                        controller: _inputController,
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
                    if (_inputController.text.isNotEmpty && context.mounted) {
                      final generatedCode = cubitOf(context)
                          .generate(json: _inputController.text);

                      if (generatedCode.isNotEmpty) {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (ctx) => ClassFromJsonView(
                            srStream: cubitOf(context).singleResults,
                            generatedCode: generatedCode,
                            onClassNameChange: (name) =>
                                cubitOf(context).generate(
                              json: _inputController.text,
                              className: name,
                            ),
                          ),
                        );
                      }
                    }
                  },
                  rightButtonOnPressed: () => Navigator.of(context).pop(),
                  isLeftButtonActive: _inputController.text.isNotEmpty,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSR(BuildContext context, ClassFromJsonDialogSR sr) {
    if (context.mounted) {
      _generatedCodeController.text = sr.generatedCode;
    }
  }

  @override
  void dispose() {
    _inputController.dispose();
    _generatedCodeController.dispose();
    super.dispose();
  }
}
