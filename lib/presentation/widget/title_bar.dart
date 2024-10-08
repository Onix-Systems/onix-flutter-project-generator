import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

const double _titleBarHeight = 100;

class TitleBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const TitleBar({
    required this.title,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _titleBarHeight,
      color: context.appColors.contrastColor,
      padding: const EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Text(
              title,
              style: context.appTextStyles.fs28?.copyWith(
                color: context.appColors.textColor,
                fontWeight: FontWeight.w100,
              ),
            ),
            const Spacer(),
            ...actions ?? List<Widget>.empty(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_titleBarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return false;
  }
}
