import 'package:flutter/cupertino.dart';

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
            ? const BoxDecoration(
                border: Border(
                right: BorderSide(
                  color: CupertinoColors.systemGrey,
                  width: 1,
                ),
              ))
            : null,
        child: value,
      ),
    );
  }
}
