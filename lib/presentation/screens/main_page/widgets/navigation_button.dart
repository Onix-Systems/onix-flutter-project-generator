import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class NavigationButton extends StatefulWidget {
  const NavigationButton(
      {required this.selected,
      required this.label,
      required this.onTap,
      Key? key})
      : super(key: key);

  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  bool hovered = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        widget.onTap();
      },
      onHover: (value) {
        if (!widget.selected) {
          setState(() {
            hovered = value;
          });
        }
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: hovered ? AppColors.orange : Colors.transparent,
        backgroundColor:
            widget.selected ? AppColors.orange : Colors.transparent,
        side: BorderSide(
          color: hovered ? AppColors.orange : AppColors.inactiveText,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          widget.label,
          style: TextStyle(
            color: widget.selected ? AppColors.grayBG : AppColors.orange,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
