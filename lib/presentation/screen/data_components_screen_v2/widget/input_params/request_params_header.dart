import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class RequestParamsHeader extends StatelessWidget {
  const RequestParamsHeader({super. key}) ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              'Input',
              style: TextStyle(
                color: context.appColors.textColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
          child: VerticalDivider(
            color: context.appColors.textColor,
            width: 2,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Output',
              style: TextStyle(
                color: context.appColors.textColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
