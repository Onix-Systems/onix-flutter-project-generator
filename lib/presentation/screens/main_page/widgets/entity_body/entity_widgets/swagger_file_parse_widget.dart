import 'package:flutter/cupertino.dart';

class SwaggerFileParseWidget extends StatefulWidget {
  final VoidCallback onParse;
  final TextEditingController urlController;

  const SwaggerFileParseWidget(
      {required this.onParse, required this.urlController, Key? key})
      : super(key: key);

  @override
  State<SwaggerFileParseWidget> createState() => _SwaggerFileParseWidgetState();
}

class _SwaggerFileParseWidgetState extends State<SwaggerFileParseWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoTextField(
            controller: widget.urlController,
            decoration: BoxDecoration(
              border: Border.all(
                color: CupertinoColors.systemGrey,
              ),
            ),
            onChanged: (_) => setState(() {}),
          ),
        ),
        const SizedBox(width: 10),
        CupertinoButton(
          color: widget.urlController.text.isNotEmpty
              ? CupertinoColors.activeOrange
              : CupertinoColors.systemGrey,
          onPressed:
              widget.urlController.text.isNotEmpty ? widget.onParse : null,
          child: const Text('Parse'),
        ),
      ],
    );
  }
}
