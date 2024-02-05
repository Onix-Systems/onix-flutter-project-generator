import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widgets/inputs/labeled_checkbox.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:recase/recase.dart';

class AddScreenDialog extends StatefulWidget {
  final Screen? screen;

  const AddScreenDialog({
    this.screen,
    super.key,
  });

  @override
  State<AddScreenDialog> createState() => _AddScreenDialogState();
}

class _AddScreenDialogState extends State<AddScreenDialog> {
  final TextEditingController _screenNameController = TextEditingController();

  ScreenStateManager _stateManagement = ScreenStateManager.none;

  final _dialogFocusNode = FocusNode();
  final _textFieldFocusNode = FocusNode();

  late FocusNode _currentFocusNode;

  @override
  void initState() {
    _currentFocusNode = _textFieldFocusNode;
    _currentFocusNode.requestFocus();
    if (widget.screen != null) {
      _screenNameController.text = widget.screen!.name;
      _stateManagement = widget.screen!.stateManager;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _dialogFocusNode,
      onKey: (node, event) {
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
          _onOk(context);
          return KeyEventResult.handled;
        }
        if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
          Navigator.pop(context);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            widget.screen != null
                ? S.of(context).modifyScreen
                : S.of(context).addScreen,
            style: context.appTextStyles.fs18,
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoTextField(
              controller: _screenNameController,
              focusNode: _textFieldFocusNode,
              style: context.appTextStyles.fs18,
              onTap: () {
                setState(() {
                  _currentFocusNode = _textFieldFocusNode;
                  _textFieldFocusNode.requestFocus();
                });
              },
              onSubmitted: (_) => _onOk(context),
              placeholder: S.of(context).screenName,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
              ],
            ),
            const SizedBox(height: 15),
            LabeledCheckbox(
              focused: _currentFocusNode == _dialogFocusNode,
              label: S.of(context).usingBloc,
              initialValue: _stateManagement == ScreenStateManager.bloc,
              onAction: () {
                setState(() {
                  if (_stateManagement == ScreenStateManager.bloc) {
                    _stateManagement = ScreenStateManager.none;
                  } else {
                    _stateManagement = ScreenStateManager.bloc;
                  }
                });
              },
            ),
            LabeledCheckbox(
              focused: _currentFocusNode == _dialogFocusNode,
              label: S.of(context).usingCubit,
              initialValue: _stateManagement == ScreenStateManager.cubit,
              onAction: () {
                setState(() {
                  if (_stateManagement == ScreenStateManager.cubit) {
                    _stateManagement = ScreenStateManager.none;
                  } else {
                    _stateManagement = ScreenStateManager.cubit;
                  }
                });
              },
            ),
          ],
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => _onOk(context),
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

  Future<void> _onOk(BuildContext context) async {
    if (_screenNameController.text.isNotEmpty) {
      String screenName = _screenNameController.text.pascalCase;

      while (screenName.endsWith('Screen')) {
        screenName = screenName.replaceLast('Screen', '');
      }

      if (widget.screen != null) {
        widget.screen!.name = screenName;
        widget.screen!.stateManager = _stateManagement;
        Navigator.pop(context, widget.screen);
      } else {
        Navigator.pop(
            context,
            Screen(
                name: screenName,
                stateManager: _stateManagement,
                exists: false));
      }
    } else {
      Navigator.pop(context);
    }
  }
}
