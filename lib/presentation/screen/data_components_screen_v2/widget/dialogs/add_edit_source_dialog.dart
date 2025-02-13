import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/formatters/first_character_is_not_digit_formatter.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/bloc/data_components_screen_v2_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/bloc/data_components_screen_v2_models.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class AddEditSourceDialog extends StatefulWidget {
  final String? sourceName;
  final DataComponentsScreenV2Bloc bloc;

  const AddEditSourceDialog({
    required this.bloc,
    this.sourceName,
    super.key,
  });

  @override
  State<AddEditSourceDialog> createState() => _AddEditSourceDialogState();
}

class _AddEditSourceDialogState extends State<AddEditSourceDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.sourceName != null) {
      _controller.text = widget.sourceName!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        if (HardwareKeyboard.instance
            .isLogicalKeyPressed(LogicalKeyboardKey.enter)) {
          onOk();
          Navigator.of(context).pop();
          return KeyEventResult.handled;
        } else if (HardwareKeyboard.instance
            .isLogicalKeyPressed(LogicalKeyboardKey.escape)) {
          Navigator.of(context).pop();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            S.of(context).addSource,
            style: context.appTextStyles.fs18,
          ),
        ),
        content: CupertinoTextField(
          controller: _controller,
          style: context.appTextStyles.fs18,
          inputFormatters: [
            const FirstCharacterNotDigitFormatter(),
            FilteringTextInputFormatter.allow(
              AppConsts.digitsAndLatinLetters,
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(S.of(context).ok),
            onPressed: () {
              onOk();
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text(S.of(context).cancel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void onOk() {
    if (_controller.text.isEmpty) {
      return;
    }
    if (widget.sourceName != null) {
      widget.bloc.add(
        DataComponentsScreenV2Event.editSourceName(
          sourceName: widget.sourceName!,
          newName: _controller.text,
        ),
      );
    } else {
      widget.bloc.add(
        DataComponentsScreenV2Event.addSource(
          sourceName: _controller.text,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
