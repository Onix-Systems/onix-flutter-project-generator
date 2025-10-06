import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:recase/recase.dart';

class ClassPreview extends StatelessWidget {
  final String className;
  final bool isEnum;
  final List<DataVariableComponent> variables;
  final ValueChanged<DataVariableComponent> onEdit;
  final ValueChanged<DataVariableComponent> onDelete;

  const ClassPreview({
    required this.className,
    required this.isEnum,
    required this.variables,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          //ignore: lines_longer_than_80_chars
          '${isEnum ? 'enum' : 'class'} ${className.pascalCase} {${variables.isNotEmpty ? '' : '}'}',
          style: context.appTextStyles.fs18,
        ),
        if (variables.isNotEmpty) ...[
          const Gap(10),
          for (final variable in variables)
            Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      //ignore: lines_longer_than_80_chars
                      '${isEnum ? '' : '${variable.type} '}${variable.name}${isEnum ? ',' : ';'}',
                      style: context.appTextStyles.fs18,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      onEdit(variable);
                    },
                    padding: const EdgeInsets.all(5),
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      CupertinoIcons.pencil,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onDelete(variable);
                    },
                    padding: const EdgeInsets.all(5),
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      CupertinoIcons.delete,
                      color: context.appColors.alarmColor,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          const Gap(10),
        ],
        if (variables.isNotEmpty)
          Text(
            '}',
            style: context.appTextStyles.fs18,
          ),
      ],
    );
  }
}
