import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/app/extension/ui_utils_extension.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog_action_buttons.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/labeled_checkbox.dart';

class DeleteRequestDialog extends StatefulWidget {
  final String? requestBodyComponentName;

  const DeleteRequestDialog({
    this.requestBodyComponentName,
    super.key,
  });

  @override
  State<DeleteRequestDialog> createState() => _DeleteRequestDialogState();
}

class _DeleteRequestDialogState extends State<DeleteRequestDialog> {
  bool _deleteRequestBodyComponent = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.screenWidth * 0.5,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(10),
            Text(
              'Delete request?',
              style: context.appTextStyles.fs22,
            ),
            if (widget.requestBodyComponentName != null) ...[
              Divider(
                color: context.appColors.controlColor,
                height: 20,
                thickness: 0.2,
              ),
              LabeledCheckbox(
                label: 'Delete ${widget.requestBodyComponentName} component',
                initialValue: _deleteRequestBodyComponent,
                onAction: () {
                  setState(() {
                    _deleteRequestBodyComponent = !_deleteRequestBodyComponent;
                  });
                },
              ),
            ],
            const Gap(10),
            DialogActionButtons(
              leftButtonLabel: S.of(context).delete,
              rightButtonLabel: S.of(context).cancel,
              leftButtonOnPressed: () =>
                  Navigator.of(context).pop(_deleteRequestBodyComponent),
              rightButtonOnPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
