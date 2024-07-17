import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:recase/recase.dart';

class ObjectItem extends StatelessWidget {
  final DataObjectComponent object;

  const ObjectItem({
    required this.object,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.contrastColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(object.name.titleCase,
                style: TextStyle(
                  color: context.appColors.textColor,
                  fontSize: 16,
                )),
          ),
          const SizedBox(height: 8),
          Container(
            color: context.appColors.darkContrastColor,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: object.variables
                  .map(
                    (e) => Text(
                        '${e.type.getTypeDeclaration(DataFileType.none)} ${e.name.camelCase}'),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
