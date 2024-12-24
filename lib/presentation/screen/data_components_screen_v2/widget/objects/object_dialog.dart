import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class ObjectDialog extends StatelessWidget {
  final DataObjectComponent object;

  const ObjectDialog({
    required this.object,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          object.getString(),
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            color: context.appColors.textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
