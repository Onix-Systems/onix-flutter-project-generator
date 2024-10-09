import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class BranchSelectorWidget extends StatelessWidget {
  final List<String> branches;
  final String selectedBranch;
  final ValueChanged<String> onSelected;

  const BranchSelectorWidget({
    required this.branches,
    required this.selectedBranch,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.appColors.darkColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              S.of(context).masonBrickSource,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Delimiter.width(20),
            DropdownButton(
              value: selectedBranch,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: branches.map(
                (items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                },
              ).toList(),
              onChanged: (newValue) {
                if (newValue != null) {
                  onSelected(newValue);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
