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

  const ClassPreview({
    required this.className,
    required this.isEnum,
    required this.variables,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
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
                  Text(
                    '  ${variable.type} ${variable.name};',
                    style: context.appTextStyles.fs18,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(5),
                    constraints: BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                    icon: const Icon(
                      CupertinoIcons.pencil,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(5),
                    constraints: BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                    icon: Icon(
                      CupertinoIcons.delete,
                      color: context.appColors.alarmColor,
                      size: 18,
                    ),
                  )
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
