import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:recase/recase.dart';

class AddSourceDialog extends StatelessWidget {
  AddSourceDialog({Key? key, this.source}) : super(key: key);

  final TextEditingController _sourceNameController = TextEditingController();
  final SourceWrapper? source;

  @override
  Widget build(BuildContext context) {
    if (source != null) {
      _sourceNameController.text = source!.name;
    }
    return CupertinoAlertDialog(
      title: source != null
          ? const Text('Modify source')
          : const Text('Add source'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          CupertinoTextField(
            autofocus: true,
            controller: _sourceNameController,
            placeholder: 'Source name',
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
            ],
            onSubmitted: (_) => _onSubmitted(context),
          ),
          const SizedBox(height: 15),
        ],
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => _onSubmitted(context),
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

  void _onSubmitted(BuildContext context) {
    if (_sourceNameController.text.isNotEmpty) {
      if (source != null) {
        source!.name = _sourceNameController.text.snakeCase;
        Navigator.pop(context, source);
      } else {
        Navigator.pop(context,
            SourceWrapper(name: _sourceNameController.text, entities: []));
      }
    } else {
      Navigator.pop(context);
    }
  }
}
