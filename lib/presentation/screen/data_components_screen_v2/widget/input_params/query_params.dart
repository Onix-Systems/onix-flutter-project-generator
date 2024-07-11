import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class QueryParams extends StatelessWidget {
  final List<RequestQueryComponent> queryParams;

  const QueryParams({
    required this.queryParams,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (queryParams.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Query Parameters:',
          style: TextStyle(
            color: context.appColors.textColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        ...queryParams
            .map((e) => Text(
                  '${e.type.getTypeDeclaration(DataFileType.none)} ${e.name}',
                  style: TextStyle(
                    color: context.appColors.textColor,
                    fontSize: 14,
                  ),
                ))
            ,
      ],
    );
  }
}
