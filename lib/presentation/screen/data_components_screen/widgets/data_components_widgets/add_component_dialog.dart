import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
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
  final TextEditingController _componentNameController =
      TextEditingController();

  final _dialogFocusNode = FocusNode();
  final _textFieldFocusNode = FocusNode();

  int _currentFocusNode = 0;

  bool _createRequest = false;
  bool _createResponse = false;

  @override
  void initState() {
    _textFieldFocusNode.requestFocus();

    if (widget.dataComponent != null) {
      _componentNameController.text = widget.dataComponent!.name;
      _createRequest = widget.dataComponent!.generateRequest;
      _createResponse = widget.dataComponent!.generateResponse;
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
              _createRequest = !_createRequest;
            } else if (_currentFocusNode == 2) {
              _createResponse = !_createResponse;
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
              initialValue: _createRequest,
              onAction: () {
                setState(() {
                  _createRequest = !_createRequest;
                });
              },
            ),
            LabeledCheckbox(
              focused: _currentFocusNode == 2,
              label: S.of(context).createResponseCheckboxLabel,
              initialValue: _createResponse,
              onAction: () {
                setState(() {
                  _createResponse = !_createResponse;
                });
              },
            ),
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
      if (widget.dataComponent != null) {
        widget.dataComponent!.name = _componentNameController.text.snakeCase;
        widget.dataComponent!.generateRequest = _createRequest;
        widget.dataComponent!.generateResponse = _createResponse;
        Navigator.pop(context, widget.dataComponent);
      } else {
        var dataComponent = DataComponent(
          name: widget.dataComponent != null
              ? _componentNameController.text.snakeCase
              : _componentNameController.text,
          properties: [],
          isGenerated: false,
          generateRequest: _createRequest,
          generateResponse: _createResponse,
        );

        dataComponent.setSourceName(widget.source?.name ?? '');

        Navigator.pop(context, dataComponent);
      }
    } else {
      Navigator.pop(context);
    }
  }
}
