import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_wrapper/entity_wrapper.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_checkbox.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/class_entity.dart';
import 'package:recase/recase.dart';

class AddEntityDialog extends StatefulWidget {
  const AddEntityDialog({Key? key, this.entity, this.standalone = true})
      : super(key: key);

  final EntityWrapper? entity;
  final bool standalone;

  @override
  State<AddEntityDialog> createState() => _AddEntityDialogState();
}

class _AddEntityDialogState extends State<AddEntityDialog> {
  final TextEditingController _entityNameController = TextEditingController();

  final _dialogFocusNode = FocusNode();
  final _textFieldFocusNode = FocusNode();

  int _currentFocusNode = 0;

  bool _createRequest = false;
  bool _createResponse = false;

  @override
  void initState() {
    _textFieldFocusNode.requestFocus();
    if (widget.entity != null) {
      _entityNameController.text = widget.entity!.name;
      _createRequest = widget.entity!.generateRequest;
      _createResponse = widget.entity!.generateResponse;
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
            logger.d('Space pressed');
            if (_currentFocusNode == 1) {
              _createRequest = !_createRequest;
              logger.d('Create request: $_createRequest');
            } else if (_currentFocusNode == 2) {
              _createResponse = !_createResponse;
              logger.d('Create response: $_createResponse');
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
          // _currentFocusNode.requestFocus();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: CupertinoAlertDialog(
        title: widget.entity != null
            ? const Text('Modify entity')
            : const Text('Add entity'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CupertinoTextField(
              controller: _entityNameController,
              focusNode: _textFieldFocusNode,
              onTap: () {
                setState(() {
                  _currentFocusNode = 0;
                  _textFieldFocusNode.requestFocus();
                });
              },
              placeholder: 'Entity name',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
              ],
              onSubmitted: (_) => _onOK(context),
            ),
            const SizedBox(height: 15),
            LabeledCheckbox(
              focused: _currentFocusNode == 1,
              label: 'Create request?',
              initialValue: _createRequest,
              onAction: () {
                setState(() {
                  _createRequest = !_createRequest;
                });
              },
            ),
            LabeledCheckbox(
              focused: _currentFocusNode == 2,
              label: 'Create response?',
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
            child: const Text('Ok'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Future<void> _onOK(BuildContext context) async {
    if (_entityNameController.text.isNotEmpty) {
      logger.d('onOk: ${_entityNameController.text}');
      if (widget.entity != null) {
        widget.entity!.name = _entityNameController.text.snakeCase;
        widget.entity!.generateRequest = _createRequest;
        widget.entity!.generateResponse = _createResponse;
        Navigator.pop(context, widget.entity);
      } else {
        Navigator.pop(
            context,
            EntityWrapper(
              name: widget.entity != null
                  ? _entityNameController.text.snakeCase
                  : _entityNameController.text,
              entity: ClassEntity(
                name: _entityNameController.text.snakeCase,
                properties: [],
              ),
              generateRequest: _createRequest,
              generateResponse: _createResponse,
            ));
      }
    } else {
      Navigator.pop(context);
    }
  }
}
