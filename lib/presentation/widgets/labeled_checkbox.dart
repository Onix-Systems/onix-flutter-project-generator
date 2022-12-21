import 'package:flutter/cupertino.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class LabeledCheckbox extends StatefulWidget {
  const LabeledCheckbox({
    required this.label,
    required this.onAction,
    this.initialValue = false,
    this.disabled = false,
    Key? key,
  }) : super(key: key);

  final String label;
  final bool? initialValue;
  final VoidCallback onAction;
  final bool? disabled;

  @override
  State<LabeledCheckbox> createState() => _LabeledCheckboxState();
}

class _LabeledCheckboxState extends State<LabeledCheckbox> {
  bool _value = false;

  @override
  void initState() {
    _value = widget.initialValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MSHCheckbox(
          value: _value,
          isDisabled: widget.disabled ?? false,
          duration: const Duration(milliseconds: 200),
          colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
            checkedColor: CupertinoColors.activeOrange,
            uncheckedColor: CupertinoColors.activeOrange,
            disabledColor: CupertinoColors.activeOrange,
          ),
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            widget.onAction();
          },
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(widget.label),
      ],
    );
  }
}
