import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class LabeledSegmentedControl extends StatefulWidget {
  const LabeledSegmentedControl(
      {Key? key, required this.label, required this.values})
      : super(key: key);

  final String label;
  final List<String> values;

  @override
  State<LabeledSegmentedControl> createState() =>
      _LabeledSegmentedControlState();
}

class _LabeledSegmentedControlState extends State<LabeledSegmentedControl> {
  late String route;

  @override
  initState() {
    route = widget.values.first;
    super.initState();
  }

  Map<String, Widget> mapValues() {
    Map<String, Widget> result = {};
    for (String value in widget.values) {
      result.addAll({
        value: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            value,
            style: TextStyle(
              color: route == value
                  ? CupertinoColors.black
                  : AppColors.inactiveText,
            ),
          ),
        )
      });
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              widget.label,
              style: const TextStyle(color: AppColors.white),
            ),
          ),
          CupertinoSegmentedControl<String>(
            padding: EdgeInsets.zero,
            groupValue: route,
            selectedColor: AppColors.green,
            borderColor: AppColors.white,
            children: mapValues(),
            onValueChanged: (value) {
              setState(() {
                route = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
