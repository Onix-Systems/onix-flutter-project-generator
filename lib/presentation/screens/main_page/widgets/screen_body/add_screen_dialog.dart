import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/data/model/local/screen_entity.dart';
import 'package:onix_flutter_bricks/presentation/widgets/labeled_checkbox.dart';
import 'package:recase/recase.dart';

class AddScreenDialog extends StatelessWidget {
  AddScreenDialog({Key? key, this.screen}) : super(key: key);

  final TextEditingController _screenNameController = TextEditingController();
  final ScreenEntity? screen;

  bool _useBloc = false;

  @override
  Widget build(BuildContext context) {
    if (screen != null) {
      _screenNameController.text = screen!.name;
      _useBloc = screen!.bloc;
    }
    return CupertinoAlertDialog(
      title: screen != null
          ? const Text('Modify screen')
          : const Text('Add screen'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoTextField(
            controller: _screenNameController,
            placeholder: 'Screen name',
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
            ],
          ),
          const SizedBox(height: 15),
          LabeledCheckbox(
            label: 'Use BLoC?',
            initialValue: screen != null ? screen!.bloc : _useBloc,
            onAction: () {
              if (screen != null) {
                screen!.bloc = !screen!.bloc;
              } else {
                _useBloc = !_useBloc;
              }
            },
          ),
        ],
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            if (_screenNameController.text.isNotEmpty) {
              if (screen != null) {
                screen!.name = _screenNameController.text.snakeCase;
                Navigator.pop(context, screen);
              } else {
                Navigator.pop(
                    context,
                    ScreenEntity(
                        name: _screenNameController.text, bloc: _useBloc));
              }
            } else {
              Navigator.pop(context);
            }
          },
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
    );
  }
}
