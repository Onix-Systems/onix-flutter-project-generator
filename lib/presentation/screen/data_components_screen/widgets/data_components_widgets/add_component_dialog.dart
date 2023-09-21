import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/component_fields_dialog.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/labeled_checkbox.dart';
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
      _dataComponent = widget.dataComponent!;

      _componentNameController.text = widget.dataComponent!.name;

      _dataComponent = DataComponent(
        name: widget.dataComponent!.name,
        properties: widget.dataComponent!.properties,
        isGenerated: widget.dataComponent!.isGenerated,
        generateRequest: widget.dataComponent!.generateRequest,
        generateResponse: widget.dataComponent!.generateResponse,
      );
    } else {
      _dataComponent = DataComponent(
        name: '',
        properties: [],
        isGenerated: false,
        generateRequest: false,
        generateResponse: false,
      );
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
      onKey: (node, event) {
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
          _onOK(context);
          return KeyEventResult.handled;
        }
        if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
          Navigator.pop(context);
          return KeyEventResult.handled;
        }
        if (event.isKeyPressed(LogicalKeyboardKey.space)) {
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
        if (event.isKeyPressed(LogicalKeyboardKey.tab)) {
          if (event.isShiftPressed) {
            _focusPrevious();
          } else {
            _focusNext();
          }
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: CupertinoAlertDialog(
        title: widget.dataComponent != null
            ? Text(S.of(context).modifyComponent)
            : Text(S.of(context).addComponent),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CupertinoTextField(
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
                  _dataComponent.name = _componentNameController.text;
                });
              },
              placeholder: S.of(context).componentNamePlaceholder,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
              ],
              onSubmitted: (_) => _onOK(context),
            ),
            const SizedBox(height: 15),
            LabeledCheckbox(
              focused: _currentFocusNode == 1,
              label: S.of(context).createRequestCheckboxLabel,
              initialValue: _dataComponent.generateRequest,
              onAction: () {
                setState(() {
                  _dataComponent.generateRequest =
                      !_dataComponent.generateRequest;
                });
              },
            ),
            LabeledCheckbox(
              focused: _currentFocusNode == 2,
              label: S.of(context).createResponseCheckboxLabel,
              initialValue: _dataComponent.generateResponse,
              onAction: () {
                setState(() {
                  _dataComponent.generateResponse =
                      !_dataComponent.generateResponse;
                });
              },
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFilledButton(
                  active: _componentNameController.text.isNotEmpty,
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => Center(
                              child: ComponentFieldsDialog(
                                dataComponent: _dataComponent,
                              ),
                            ));
                  },
                  //color: AppColors.orange,
                  label: 'Fields',
                  icon: CupertinoIcons.plus,
                ),
              ],
            )
          ],
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => _onOK(context),
            child: Text(S.of(context).ok),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(S.of(context).cancel),
          ),
        ],
      ),
    );
  }

  Future<void> _onOK(BuildContext context) async {
    if (_componentNameController.text.isNotEmpty) {
      if (widget.dataComponent == null) {
        _dataComponent.name = _componentNameController.text.snakeCase;
        _dataComponent.setSourceName(widget.source?.name ?? '');
      }
      Navigator.pop(context, _dataComponent);
    } else {
      Navigator.pop(context);
    }
  }
}
