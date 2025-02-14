import 'package:flutter/cupertino.dart';
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
        if (variables.isNotEmpty)
          Text(
            '}',
            style: context.appTextStyles.fs18,
          ),
      ],
    );
  }
}
