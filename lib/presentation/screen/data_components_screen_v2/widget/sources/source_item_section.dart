import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/add_request_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_view.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/sources/requests_section.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:recase/recase.dart';

class SourceItem extends StatelessWidget {
  final SourceComponent source;
  final List<ObjectView> objects;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const SourceItem({
    required this.source,
    required this.objects,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: context.appColors.darkColor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 48,
          child: Row(
            children: [
              Text(
                source.name.titleCase,
                style: context.appTextStyles.fs22,
              ),
              const Spacer(),
              IconButton(
                onPressed: onEdit,
                icon: const Icon(
                  CupertinoIcons.pencil,
                ),
              ),
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  CupertinoIcons.delete,
                  color: context.appColors.alarmColor,
                ),
              ),
            ],
          ),
        ),
        if (!source.fromSwagger) ...[
          AppFilledButton(
            label: S.of(context).addRequest,
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (ctx) => const AddEditRequestDialog(),
              ).then((request) {
                logger.f('Request: $request');
              });
            },
          ),
          const Gap(16),
        ],
        RequestsSection(
          requests: source.requests,
          objects: objects,
        ),
      ],
    );
  }
}
