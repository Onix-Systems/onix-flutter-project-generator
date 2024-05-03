import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/fields_dialog/fields_dialog.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_action_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/labeled_checkbox.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class AddComponentDialog extends StatefulWidget {
  final DataComponent? dataComponent;
  final Source? source;

  const AddComponentDialog({
    this.dataComponent,
    this.source,
    super.key,
  });

  @override
  State<AddComponentDialog> createState() => _AddComponentDialogState();
}

class _AddComponentDialogState extends State<AddComponentDialog> {
  late DataComponent _dataComponent;

  final TextEditingController _componentNameController =
      TextEditingController();

  final _dialogFocusNode = FocusNode();
  final _textFieldFocusNode = FocusNode();

  int _currentFocusNode = 0;

  @override
  void initState() {
    _textFieldFocusNode.requestFocus();

    if (widget.dataComponent != null) {
      _componentNameController.text = widget.dataComponent!.name;

      _dataComponent = DataComponent.copyOf(widget.dataComponent!);
    } else {
      _dataComponent = DataComponent.empty();
      _dataComponent.isGenerated = false;
      if (widget.source != null) {
        _dataComponent.sourceName = widget.source!.name;
      }
    }

    super.initState();
  }

  void _focusNext() {
    setState(() {
      if (_currentFocusNode < 2) {
        _currentFocusNode++;
      } else {
        _currentFocusNode = 0;
      }
      if (_currentFocusNode == 0) {
        _textFieldFocusNode.requestFocus();
      } else {
        _dialogFocusNode.requestFocus();
      }
    });
  }

  void _focusPrevious() {
    setState(() {
      if (_currentFocusNode > 0) {
        _currentFocusNode--;
      } else {
        _currentFocusNode = 2;
      }
      if (_currentFocusNode == 0) {
        _textFieldFocusNode.requestFocus();
      } else {
        _dialogFocusNode.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _dialogFocusNode,
      onKeyEvent: (node, event) {
        if (HardwareKeyboard.instance
            .isLogicalKeyPressed(LogicalKeyboardKey.enter)) {
          _onOK(context);
          return KeyEventResult.handled;
        }
        if (HardwareKeyboard.instance
            .isLogicalKeyPressed(LogicalKeyboardKey.escape)) {
          Navigator.pop(context);
          return KeyEventResult.handled;
        }
        if (HardwareKeyboard.instance
            .isLogicalKeyPressed(LogicalKeyboardKey.space)) {
          setState(() {
            if (_currentFocusNode == 1) {
              _dataComponent.generateRequest = !_dataComponent.generateRequest;
            } else if (_currentFocusNode == 2) {
              _dataComponent.generateResponse =
                  !_dataComponent.generateResponse;
            }
          });

          return KeyEventResult.handled;
        }
        if (HardwareKeyboard.instance
            .isLogicalKeyPressed(LogicalKeyboardKey.tab)) {
          if (HardwareKeyboard.instance
              .isLogicalKeyPressed(LogicalKeyboardKey.shift)) {
            _focusPrevious();
          } else {
            _focusNext();
          }
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: AnimatedContainer(
        width: _dataComponent.name.isNotEmpty ? 800 : 300,
        duration: const Duration(milliseconds: 300),
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.bgDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  widget.dataComponent != null
                      ? S.of(context).modifyComponent
                      : S.of(context).addComponent,
                  textAlign: TextAlign.center,
                  style: context.appTextStyles.fs18,
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: ColoredBox(
                    color: AppColors.inactiveText,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CupertinoTextField(
                              controller: _componentNameController,
                              focusNode: _textFieldFocusNode,
                              style: context.appTextStyles.fs18,
                              onTap: () {
                                setState(() {
                                  _currentFocusNode = 0;
                                  _textFieldFocusNode.requestFocus();
                                });
                              },
                              onChanged: (_) {
                                setState(() {
                                  _dataComponent.name =
                                      _componentNameController.text.pascalCase;
                                });
                              },
                              placeholder:
                                  S.of(context).componentNamePlaceholder,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z]')),
                              ],
                              onSubmitted: (_) => _onOK(context),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              height: 43,
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: LabeledCheckbox(
                                  focused: _currentFocusNode == 1,
                                  label:
                                      S.of(context).createRequestCheckboxLabel,
                                  initialValue: _dataComponent.generateRequest,
                                  onAction: () {
                                    setState(() {
                                      _dataComponent.generateRequest =
                                          !_dataComponent.generateRequest;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              height: 43,
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: LabeledCheckbox(
                                  focused: _currentFocusNode == 2,
                                  label:
                                      S.of(context).createResponseCheckboxLabel,
                                  initialValue: _dataComponent.generateResponse,
                                  onAction: () {
                                    setState(() {
                                      _dataComponent.generateResponse =
                                          !_dataComponent.generateResponse;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppFilledButton(
                                active:
                                    _componentNameController.text.isNotEmpty,
                                onPressed: () {
                                  showCupertinoModalPopup<DataComponent>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => Center(
                                            child: FieldsDialog(
                                              dataComponent: _dataComponent,
                                            ),
                                          )).then((_) {
                                    setState(() {});
                                  });
                                },
                                //color: AppColors.orange,
                                label: S.of(context).fields,
                                icon: CupertinoIcons.plus,
                              ),
                            ],
                          ),
                          const Delimiter.height(20),
                        ],
                      ),
                    ),
                    if (_dataComponent.name.isNotEmpty) ...[
                      const SizedBox(
                        width: 1,
                        height: 210,
                        child: VerticalDivider(
                          color: AppColors.inactiveText,
                          thickness: 1,
                          width: 1,
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 210,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomScrollView(
                              shrinkWrap: true,
                              slivers: [
                                SliverToBoxAdapter(
                                  child: Text(
                                    'class ${_dataComponent.name.pascalCase} {',
                                    textAlign: TextAlign.left,
                                    style: context.appTextStyles.fs18,
                                  ),
                                ),
                                SliverList.builder(
                                    itemCount: _dataComponent.properties.length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        '      ${_dataComponent.properties[index].nullable ? '' : 'required '}${_dataComponent.properties[index].isList ? 'List<' : ''}${TypeMatcher.getDartType(_dataComponent.properties[index].type)}${_dataComponent.properties[index].isList ? '>' : ''}${_dataComponent.properties[index].nullable ? '?' : ''} ${_dataComponent.properties[index].name.camelCase};',
                                        textAlign: TextAlign.left,
                                        style: context.appTextStyles.fs18,
                                      );
                                    }),
                                SliverToBoxAdapter(
                                  child: Text(
                                    '}',
                                    textAlign: TextAlign.left,
                                    style: context.appTextStyles.fs18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: ColoredBox(
                    color: AppColors.inactiveText,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AppActionButton(
                        label: S.of(context).ok,
                        onPressed: () => _onOK(context),
                      ),
                    ),
                    const SizedBox(
                      height: 55,
                      width: 1,
                      child: ColoredBox(
                        color: AppColors.inactiveText,
                      ),
                    ),
                    Expanded(
                      child: AppActionButton(
                        label: S.of(context).cancel,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onOK(BuildContext context) async {
    if (_componentNameController.text.isNotEmpty) {
      if (widget.dataComponent == null) {
        _dataComponent.name = _componentNameController.text.pascalCase;
      }
      Navigator.pop(context, _dataComponent);
    } else {
      Navigator.pop(context);
    }
  }
}
