import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/response_param_component.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class ResponseBody extends StatelessWidget {
  final ResponseParamComponent response;
  final DataObjectComponent? object;
  final ValueChanged<DataObjectComponent?> onHover;

  const ResponseBody({
    required this.response,
    required this.object,
    required this.onHover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: object == null
          ? Text(
              'Response: ${response.type.getTypeDeclaration(
                DataFileType.none,
              )}',
              style: TextStyle(
                color: context.appColors.textColor,
                fontSize: 16,
              ),
            )
          : MouseRegion(
              onEnter: (_) => onHover(object),
              onExit: (_) => onHover(null),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.appColors.contrastColor,
                  border: Border.all(
                    color: context.appColors.contrastColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Response: ${response.type.getTypeDeclaration(
                    DataFileType.none,
                  )}',
                  style: TextStyle(
                    color: context.appColors.textColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
    );
  }
}
