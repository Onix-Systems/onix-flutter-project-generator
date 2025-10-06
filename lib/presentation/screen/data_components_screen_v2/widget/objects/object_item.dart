import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:recase/recase.dart';

class ObjectItem extends StatelessWidget {
  final Component component;
  final ValueChanged<Component> onEdit;
  final ValueChanged<Component> onDelete;

  const ObjectItem({
    required this.component,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.appColors.contrastColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  component.name.titleCase,
                  style: TextStyle(
                    color: context.appColors.textColor,
                    fontSize: 16,
                  ),
                ),
                if (!component.fromSwagger) ...[
                  const Spacer(),
                  IconButton(
                    onPressed: () => onEdit(component),
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      CupertinoIcons.pencil,
                      size: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () => onDelete(component),
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      CupertinoIcons.delete,
                      size: 18,
                      color: context.appColors.alarmColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Gap(8),
          Container(
            color: context.appColors.darkContrastColor,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: component is EnumParamComponent
                ? Text(
                    (component as EnumParamComponent)
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
                    children: (component as DataObjectComponent)
                        .variables
                        .map(
                          (e) => e.type is SwaggerEnum
                              ? Text(
                                  //ignore: lines_longer_than_80_chars
                                  'enum: {${(e.type as SwaggerEnum).enumValues.join(', ')}}',
                                )
                              : Text(
                                  //ignore: lines_longer_than_80_chars
                                  '${e.type.getTypeDeclaration(DataFileType.none)} '
                                  '${e.name.camelCase}',
                                  style: TextStyle(
                                    color: e.type
                                            .getTypeDeclaration(
                                              DataFileType.none,
                                            )
                                            .contains('UndefinedValue')
                                        ? context.appColors.alarmColor
                                        : context.appColors.textColor,
                                    fontSize: 14,
                                  ),
                                ),
                        )
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
