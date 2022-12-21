import 'package:flutter/cupertino.dart';

class Cell extends StatelessWidget {
  const Cell({
    required this.value,
    this.decorated = false,
    Key? key,
  }) : super(key: key);

  final Widget value;
  final bool decorated;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
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
