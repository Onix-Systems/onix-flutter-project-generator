import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:recase/recase.dart';

class TextFieldWithLabel extends StatefulWidget {
  const TextFieldWithLabel({
    Key? key,
    required this.label,
    required this.textController,
    required this.focusNode,
    this.onSubmitted,
    this.snakeCase = true,
    this.subLabel,
  }) : super(key: key);

  final String label;
  final String? subLabel;
  final TextEditingController textController;

  final FocusNode focusNode;
  final VoidCallback? onSubmitted;

  final bool snakeCase;

  @override
  State<TextFieldWithLabel> createState() => _TextFieldWithLabelState();
}

class _TextFieldWithLabelState extends State<TextFieldWithLabel> {
  late bool inFocus = false;

  @override
  void initState() {
    widget.focusNode.addListener(() {
      setState(() {
        inFocus = widget.focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: const TextStyle(color: AppColors.white),
              ),
              if (widget.subLabel != null)
                Text(
                  widget.subLabel ?? '',
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: AppColors.white, fontSize: 13),
                ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 300,
          child: CupertinoTextField(
            controller: widget.textController,
            focusNode: widget.focusNode,
            keyboardType: TextInputType.text,
            onChanged: (value) {},
            onSubmitted: (value) {
              setState(() {
                widget.textController.text =
                    widget.snakeCase ? value.snakeCase : value.dotCase;
                widget.onSubmitted;
              });
            },
          ),
        ),
      ],
    );
  }
}
