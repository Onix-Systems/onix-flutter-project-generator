import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/util/enum/tool_type.dart';

class ToolsPopupButton extends StatelessWidget {
  final ValueChanged<ToolType> onSelected;

  const ToolsPopupButton({
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ToolType>(
      onSelected: onSelected,
      tooltip: S.of(context).tools,
      itemBuilder: (context) => <PopupMenuEntry<ToolType>>[
        PopupMenuItem<ToolType>(
          value: ToolType.generateAndroidSigning,
          child: Text(S.of(context).generateAndroidSigning),
        ),
      ],
    );
  }
}
