import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_view.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class ObjectDialog extends StatelessWidget {
  final ObjectView object;

  const ObjectDialog({
    required this.object,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(left: 20, right: 24, bottom: 16),
      titlePadding: const EdgeInsets.only(top: 10, left: 20, right: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            object.name,
            style: TextStyle(
              color: context.appColors.textColor,
              fontSize: 20,
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            customBorder: const CircleBorder(),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.close),
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Text(
          object.variablesString,
          textAlign: TextAlign.left,
          softWrap: false,
          // maxLines: 20,
          style: TextStyle(
            color: context.appColors.textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
