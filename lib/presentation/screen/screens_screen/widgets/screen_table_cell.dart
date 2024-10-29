import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class Cell extends StatelessWidget {
  final Widget value;
  final bool decorated;
  final Alignment alignment;

  const Cell({
    required this.value,
    this.decorated = false,
    this.alignment = Alignment.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: alignment,
        decoration: decorated
            ? BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: context.appColors.fadedColor,
                  ),
                ),
              )
            : null,
        child: value,
      ),
    );
  }
}
