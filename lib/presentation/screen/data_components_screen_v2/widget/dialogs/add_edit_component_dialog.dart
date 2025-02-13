import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/formatters/first_character_is_not_digit_formatter.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/bloc/data_components_screen_v2_bloc.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/text_field_with_label.dart';

class AddEditComponentDialog extends StatefulWidget {
  final String? componentName;
  final DataComponentsScreenV2Bloc bloc;

  const AddEditComponentDialog({
    required this.bloc,
    this.componentName,
    super.key,
  });

  @override
  State<AddEditComponentDialog> createState() => _AddEditComponentDialogState();
}

class _AddEditComponentDialogState extends State<AddEditComponentDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.componentName != null) {
      _controller.text = widget.componentName!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 600,
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
                  children: [
                    Text(
                      S.of(context).addComponent,
                      style: context.appTextStyles.fs18,
                    ),
                    const Gap(20),
                    TextFieldWithLabel(
                      label: S.of(context).componentName,
                      textController: _controller,
                      expanded: true,
                      onChanged: () {},
                      inputFormatters: [
                        const FirstCharacterNotDigitFormatter(),
                        FilteringTextInputFormatter.allow(
                          AppConsts.digitsAndLatinLetters,
                        ),
                      ],
                    ),
                    const Gap(20),
                  ],
                ),
              ),
              Divider(
                color: context.appColors.controlColor,
                height: 0,
                thickness: 0.2,
              ),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      child: Text(S.of(context).ok),
                      onPressed: () {
                        onOk();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    color: context.appColors.controlColor,
                    height: 50,
                    width: 0.2,
                  ),
                  Expanded(
                    child: CupertinoButton(
                      child: Text(S.of(context).cancel),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }

  void onOk() {
    // if (_controller.text.isEmpty) {
    //   return;
    // }
    // if (widget.componentName != null) {
    //   widget.bloc.add(
    //     DataComponentsScreenV2Event.editSourceName(
    //       sourceName: widget.componentName!,
    //       newName: _controller.text,
    //     ),
    //   );
    // } else {
    //   widget.bloc.add(
    //     DataComponentsScreenV2Event.addSource(
    //       sourceName: _controller.text,
    //     ),
    //   );
    // }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
