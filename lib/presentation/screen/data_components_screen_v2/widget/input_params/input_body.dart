import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class InputBody extends StatelessWidget {
  final RequestBodyComponent? body;

  const InputBody({
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bodyNotNull = body;
    if (bodyNotNull == null) {
      return const SizedBox.shrink();
    }

    return Column(
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
          '${bodyNotNull.type.getTypeDeclaration(DataFileType.none)} ${bodyNotNull.name}',
          style: TextStyle(
            color: context.appColors.textColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
