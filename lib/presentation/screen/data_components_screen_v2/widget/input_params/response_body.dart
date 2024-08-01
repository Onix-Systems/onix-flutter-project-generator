import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/response_param_component.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class ResponseBody extends StatelessWidget {
  final ResponseParamComponent response;

  const ResponseBody({
    required this.response,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Response: ${response.type.getTypeDeclaration(DataFileType.none)}',
        style: TextStyle(
          color: context.appColors.textColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
