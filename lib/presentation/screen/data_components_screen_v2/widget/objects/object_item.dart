import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:recase/recase.dart';

class ObjectItem extends StatelessWidget {
  final dynamic object;

  const ObjectItem({
    required this.object,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late final String name;
    var isEnum = false;

    if (object is DataObjectComponent) {
      name = (object as DataObjectComponent).name;
    } else if (object is EnumParamComponent) {
      name = (object as EnumParamComponent).name;
      isEnum = true;
    } else {
      return const SizedBox();
    }

    return ColoredBox(
      color: context.appColors.contrastColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              name.titleCase,
              style: TextStyle(
                color: context.appColors.textColor,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            color: context.appColors.darkContrastColor,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: isEnum
                ? Text(
                    (object as EnumParamComponent)
                        .type
                        .enumValues
                        .toSet()
                        .toString(),
                    style: TextStyle(
                      color: context.appColors.textColor,
                      fontSize: 14,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (object as DataObjectComponent)
                        .variables
                        .map(
                          (e) => e.type is SwaggerEnum
                              ? Text(
                                  'enum: {${(e.type as SwaggerEnum).enumValues.join(', ')}}',
                                )
                              : Text(
                                  '${e.type.getTypeDeclaration(DataFileType.none)} '
                                  '${e.name.camelCase}'),
                        )
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
