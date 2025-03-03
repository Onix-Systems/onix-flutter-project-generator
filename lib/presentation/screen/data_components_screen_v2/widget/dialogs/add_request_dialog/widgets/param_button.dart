import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';

class ParamButton extends StatelessWidget {
  final String paramType;
  final bool edit;
  final VoidCallback onPressed;
  final VoidCallback onDelete;

  const ParamButton({
    required this.paramType,
    required this.edit,
    required this.onPressed,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppFilledButton(
            label: edit
                ? S.of(context).editParams(paramType)
                : S.of(context).addParams(paramType),
            onPressed: onPressed,
          ),
        ),
        if (edit)
          AppFilledButton(
            label: '',
            icon: Icons.delete,
            minimumSize: const Size(20, 58),
            padding: const EdgeInsets.all(
              10,
            ),
            color: context.appColors.alarmColor,
            onPressed: onDelete,
          ),
      ],
    );
  }
}
