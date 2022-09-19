import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:recase/recase.dart';

class TextFieldWithLabel extends StatefulWidget {
  const TextFieldWithLabel({
    Key? key,
    required this.label,
    required this.textController,
    required this.focusNode,
    required this.onSubmitted,
    this.snakeCase = true,
    this.toSet,
    this.subLabel,
  }) : super(key: key);

  final String label;
  final String? subLabel;
  final TextEditingController textController;

  final FocusNode focusNode;
  final VoidCallback onSubmitted;

  final bool snakeCase;
  final bool? toSet;

  @override
  State<TextFieldWithLabel> createState() => _TextFieldWithLabelState();
}

class _TextFieldWithLabelState extends State<TextFieldWithLabel> {
  late final bool? snakeCase;

  @override
  void initState() {
    if (widget.toSet != null) {
      snakeCase = null;
    } else {
      snakeCase = widget.snakeCase;
    }
    widget.focusNode.addListener(() {
      if (!widget.focusNode.hasFocus) {
        _onSubmit();
      }
    });
    super.initState();
  }

  _onSubmit() {
    if (snakeCase != null) {
      widget.textController.text = snakeCase!
          ? widget.textController.text.snakeCase
          : widget.textController.text.toLowerCase();
    } else {
      widget.textController.text =
          widget.textController.text.paramCase.replaceAll('-', ' ');
    }
    widget.onSubmitted.call();
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
            onChanged: (value) {
              var position = widget.textController.selection.base;
              widget.textController.text = value;
              widget.textController.selection =
                  TextSelection.fromPosition(position);
            },
            onSubmitted: (_) {
              _onSubmit();
            },
          ),
        ),
      ],
    );
  }
}
