import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/data/model/local/source_entity.dart';
import 'package:recase/recase.dart';

class AddSourceDialog extends StatelessWidget {
  AddSourceDialog({Key? key, this.source}) : super(key: key);

  final TextEditingController _sourceNameController = TextEditingController();
  final SourceEntity? source;

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
            controller: _sourceNameController,
            placeholder: 'Source name',
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            if (_sourceNameController.text.isNotEmpty) {
              if (source != null) {
                source!.name = _sourceNameController.text.snakeCase;
                Navigator.pop(context, source);
              } else {
                Navigator.pop(
                    context,
                    SourceEntity(
                        name: _sourceNameController.text, entities: []));
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
