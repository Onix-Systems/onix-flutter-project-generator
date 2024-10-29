import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/formatters/lower_case_formatter.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class FlavorsDialog extends StatefulWidget {
  const FlavorsDialog({
    super.key,
  });

  @override
  State<FlavorsDialog> createState() => _FlavorsDialogState();
}

class _FlavorsDialogState extends State<FlavorsDialog> {
  final TextEditingController _flavorController = TextEditingController();
  final FocusNode _flavorFocus = FocusNode();

  final Set<String> _flavors = {};
  bool _flavorsValid = true;

  @override
  void initState() {
    _flavors.addAll(AppConsts.defaultFlavors);
    _flavorFocus.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: FocusNode(),
      autofocus: true,
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          _flavorFocus.requestFocus();
        }
      },
      onKeyEvent: (node, event) {
        if (HardwareKeyboard.instance
            .isLogicalKeyPressed(LogicalKeyboardKey.enter)) {
          if (_flavorController.text.isNotEmpty) {
            _flavors.add(_flavorController.text);
            _flavorController.clear();
            _validate();
          } else {
            _onOk(context);
          }
          return KeyEventResult.handled;
        } else if (HardwareKeyboard.instance
            .isLogicalKeyPressed(LogicalKeyboardKey.escape)) {
          Navigator.pop(context);
          return KeyEventResult.handled;
        } else {
          return KeyEventResult.skipRemainingHandlers;
        }
      },
      child: CupertinoAlertDialog(
        title: Text(S.of(context).generateFlavors),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      for (final flavor in _flavors)
                        Material(
                          child: Chip(
                            label: Text(flavor),
                            onDeleted: () {
                              setState(() {
                                _flavors.remove(flavor);
                                _validate();
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(15),
            SizedBox(
              height: 40,
              child: CupertinoTextField(
                controller: _flavorController,
                focusNode: _flavorFocus,
                style: context.appTextStyles.fs18,
                placeholder: S.of(context).flavorName,
                suffixMode: OverlayVisibilityMode.editing,
                suffix: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  icon: Icon(
                    CupertinoIcons.add,
                    color: context.appColors.controlColor,
                  ),
                  onPressed: () {
                    if (_flavorValid()) {
                      setState(() {
                        _flavors.add(_flavorController.text);
                        _flavorController.clear();
                        _validate();
                      });
                    }
                  },
                ),
                autofocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  const LowerCaseFormatter(),
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => _flavorsValid ? _onOk(context) : null,
            textStyle: TextStyle(
              color: _flavorsValid
                  ? context.appColors.controlColor
                  : context.appColors.fadedColor,
            ),
            child: Text(S.of(context).ok),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            textStyle: TextStyle(
              color: context.appColors.controlColor,
            ),
            child: Text(S.of(context).cancel),
          ),
        ],
      ),
    );
  }

  bool _flavorValid() {
    final flavor = _flavorController.text;
    final regExp = RegExp('[a-z]');
    return flavor.isNotEmpty && regExp.hasMatch(flavor);
  }

  void _validate() {
    setState(() {
      _flavorsValid = _flavors.length > 1;
    });
  }

  void _onOk(BuildContext context) {
    context.pop(
      _flavors,
    );
  }
}
