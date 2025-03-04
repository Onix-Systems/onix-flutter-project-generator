import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_view.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class InputBody extends StatelessWidget {
  final RequestBodyComponent? body;
  final ObjectView? object;

  const InputBody({
    required this.body,
    required this.object,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bodyNotNull = body;
    if (bodyNotNull == null) {
      return const SizedBox.shrink();
    }

    return ClickableWidget(
      onTap: () => onTap(context),
      splashColor: context.appColors.contrastColor.withValues(alpha: 0.5),
      borderRadiusInk: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.appColors.contrastColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Request Body:',
              style: TextStyle(
                color: context.appColors.textColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${bodyNotNull.type.getTypeDeclaration(DataFileType.none)} '
              '${bodyNotNull.name}',
              style: TextStyle(
                color: context.appColors.textColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    if (object == null) return;

    showDialog(
      context: context,
      builder: (context) {
        return ObjectDialog(object: object!);
      },
    );
  }
}
