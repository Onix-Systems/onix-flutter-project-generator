import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/screen/screen_entity.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_checkbox.dart';
import 'package:recase/recase.dart';

class AddScreenDialog extends StatefulWidget {
  AddScreenDialog({Key? key, this.screen}) : super(key: key);

  final ScreenEntity? screen;

  @override
  State<AddScreenDialog> createState() => _AddScreenDialogState();
}

class _AddScreenDialogState extends State<AddScreenDialog> {
  final TextEditingController _screenNameController = TextEditingController();

  bool _useBloc = false;

  final _dialogFocusNode = FocusNode();
  final _textFieldFocusNode = FocusNode();

  late FocusNode _currentFocusNode;

  @override
  void initState() {
    _currentFocusNode = _textFieldFocusNode;
    _currentFocusNode.requestFocus();
    if (widget.screen != null) {
      _screenNameController.text = widget.screen!.name;
      _useBloc = widget.screen!.bloc;
    }
    super.initState();
  }

  void _focusNext() {
    setState(() {
      if (_currentFocusNode == _textFieldFocusNode) {
        _currentFocusNode = _dialogFocusNode;
      } else {
        _currentFocusNode = _textFieldFocusNode;
      }
      _currentFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _dialogFocusNode,
      onKey: (node, event) {
        logger.d('Key event: ${event.logicalKey}');
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
          _onOk(context);
          return KeyEventResult.handled;
        }
        if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
          Navigator.pop(context);
          return KeyEventResult.handled;
        }
        if (event.isKeyPressed(LogicalKeyboardKey.space)) {
          setState(() {
            logger.d('Space pressed');
            if (_currentFocusNode == _dialogFocusNode) {
              _useBloc = !_useBloc;
              logger.d('Use Bloc: $_useBloc');
            }
          });

          return KeyEventResult.handled;
        }
        if (event.isKeyPressed(LogicalKeyboardKey.tab)) {
          _focusNext();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: CupertinoAlertDialog(
        title: widget.screen != null
            ? const Text('Modify screen')
            : const Text('Add screen'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoTextField(
              controller: _screenNameController,
              focusNode: _textFieldFocusNode,
              onTap: () {
                setState(() {
                  _currentFocusNode = _textFieldFocusNode;
                  _textFieldFocusNode.requestFocus();
                });
              },
              onSubmitted: (_) => _onOk(context),
              placeholder: 'Screen name',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
              ],
            ),
            const SizedBox(height: 15),
            LabeledCheckbox(
              focused: _currentFocusNode == _dialogFocusNode,
              label: 'Use BLoC?',
              initialValue: _useBloc,
              onAction: () {
                setState(() {
                  _useBloc = !_useBloc;
                });
              },
            ),
          ],
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => _onOk(context),
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

  Future<void> _onOk(BuildContext context) async {
    if (_screenNameController.text.isNotEmpty) {
      if (widget.screen != null) {
        widget.screen!.name = _screenNameController.text.snakeCase;
        widget.screen!.bloc = _useBloc;
        Navigator.pop(context, widget.screen);
      } else {
        Navigator.pop(
            context,
            ScreenEntity(
                name: _screenNameController.text,
                bloc: _useBloc,
                exists: false));
      }
    } else {
      Navigator.pop(context);
    }
  }
}