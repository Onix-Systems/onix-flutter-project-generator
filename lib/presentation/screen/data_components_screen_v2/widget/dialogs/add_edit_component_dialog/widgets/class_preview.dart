import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
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
    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              //ignore: lines_longer_than_80_chars
              '${isEnum ? 'enum' : 'class'} ${className.pascalCase} {${variables.isNotEmpty ? '' : '}'}',
              style: context.appTextStyles.fs18,
            ),
            if (variables.isNotEmpty) ...[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: variables
                    .map(
                      (variable) => Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                //ignore: lines_longer_than_80_chars
                                '${isEnum ? '' : '${variable.type} '}${variable.name}${isEnum ? ',' : ';'}',
                                maxLines: 2,
                                style: context.appTextStyles.fs18?.copyWith(
                                  color: variable.type
                                          .getTypeDeclaration(
                                            DataFileType.none,
                                          )
                                          .contains('UndefinedValue')
                                      ? context.appColors.alarmColor
                                      : context.appColors.textColor,
                                ),
                              ),
                            ),
                          ),
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
                    )
                    .toList(),
              ),
            ] else
              const SizedBox(),
            if (variables.isNotEmpty)
              Text(
                '}',
                style: context.appTextStyles.fs18,
              ),
          ],
        ),
      ),
    );
  }
}
