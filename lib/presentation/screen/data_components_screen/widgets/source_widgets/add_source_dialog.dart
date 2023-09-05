import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:recase/recase.dart';

class AddSourceDialog extends StatelessWidget {
  final TextEditingController _sourceNameController = TextEditingController();
  final Source? source;

  AddSourceDialog({
    this.source,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (source != null) {
      _sourceNameController.text = source!.name;
    }
    return CupertinoAlertDialog(
      title: source != null
          ? Text(S.of(context).modifySource)
          : Text(S.of(context).addSource),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          CupertinoTextField(
            autofocus: true,
            controller: _sourceNameController,
            style: context.appTextStyles.fs18,
            placeholder: S.of(context).sourceNamePlaceholder,
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
    );
  }

  void _onSubmitted(BuildContext context) {
    if (_sourceNameController.text.isNotEmpty) {
      if (source != null) {
        source!.name = _sourceNameController.text.snakeCase;
        Navigator.pop(context, source);
      } else {
        final source = Source(
          name: _sourceNameController.text.snakeCase,
          dataComponents: [],
          dataComponentsNames: [],
        );

        Navigator.pop(context, source);
      }
    } else {
      Navigator.pop(context);
    }
  }
}
