import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class ParamsPreview extends StatelessWidget {
  final List<RequestParamComponent> params;
  final ValueChanged<RequestParamComponent> onEdit;
  final ValueChanged<RequestParamComponent> onDelete;

  const ParamsPreview({
    required this.params,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (params.isNotEmpty) ...[
          const Gap(10),
          for (final param in params)
            Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        //ignore: lines_longer_than_80_chars
                        '${param.type} ${param.name}${param == params.last ? '' : ','}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.appTextStyles.fs18,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onEdit(param);
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
                      onDelete(param);
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
      ],
    );
  }
}
