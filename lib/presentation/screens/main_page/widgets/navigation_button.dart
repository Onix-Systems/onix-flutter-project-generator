import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class NavigationButton extends StatefulWidget {
  const NavigationButton(
      {required this.index,
      required this.label,
      required this.navigationStreamController,
      required this.navigationStream,
      Key? key})
      : super(key: key);

  final String label;
  final int index;
  final StreamController<int> navigationStreamController;
  final Stream<int> navigationStream;

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  bool hovered = false;
  bool pressed = false;

  @override
  void initState() {
    widget.navigationStream.listen((event) {
      setState(() {
        pressed = event == widget.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          widget.navigationStreamController.add(widget.index);
        });
      },
      onHover: (value) {
        if (!pressed) {
          setState(() {
            hovered = value;
          });
        }
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: hovered ? AppColors.orange : Colors.transparent,
        backgroundColor: pressed ? AppColors.orange : Colors.transparent,
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
            color: pressed ? AppColors.grayBG : AppColors.orange,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
